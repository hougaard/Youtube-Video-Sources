codeunit 50100 "USPS Management"
{
    procedure VerifyCustomerAddress(var Customer: Record Customer)
    var
        Setup: Record "USPS Setup";
        Parameters: XmlDocument;
        Result: XmlDocument;
        Address: XmlElement;
        AVR: XmlElement;
        ResultTxt: Text;
    begin
        if not Setup.GET() then
            error('USPS Setup is needed, please enter URL and UserID');
        Parameters := XmlDocument.Create();
        Address := XmlElement.Create('Address');
        Address.Attributes().Set('ID', '0');
        Address.Add(AddField('FirmName', Customer.Name));
        Address.Add(AddField('Address1', Customer.Address));
        Address.Add(AddField('Address2', Customer."Address 2"));
        Address.Add(AddField('City', Customer.City));
        Address.Add(AddField('State', Customer.County));
        Address.Add(AddField('Zip5', Customer."Post Code"));
        Address.Add(AddField('Zip4', '')); // TODO: Split and Fix!
        AVR := XmlElement.Create('AddressValidateRequest');
        AVR.Attributes().Set('USERID', Setup.UserID);
        AVR.Add(Address);
        Parameters.Add(AVR);
        Result := CallWebService('Verify', Parameters);
        Result.WriteTo(ResultTxt);
        Message(ResultTxt);
    end;

    local procedure AddField(Name: Text; Value: Text): XmlElement
    var
        e: XmlElement;
    begin
        e := XmlElement.Create(Name);
        e.Add(Value);
        exit(e);
    end;

    local procedure CallWebService(API: Text; XMLin: XmlDocument): XmlDocument
    var
        Setup: Record "USPS Setup";
        TypeHelper: Codeunit "Type Helper";
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Headers: HttpHeaders;
        QueryString: Text;
        XMLtxt: Text;
        TxtOut: Text;
        XMLout: XmlDocument;
    begin
        if not Setup.GET() then
            error('USPS Setup is needed, please enter URL and UserID');
        XMLin.WriteTo(XMLtxt);
        TypeHelper.UrlEncode(XMLtxt);
        QueryString := '?API=' + API + '&XML=' + XMLtxt;
        Request.Method := 'GET';
        Request.GetHeaders(Headers);
        Headers.Add('User-Agent', 'Dynamics 365 Business Central');
        Request.SetRequestUri(Setup.URL + QueryString);
        if Client.Send(Request, Response) then begin
            if Response.HttpStatusCode() = 200 then begin
                Response.Content().ReadAs(TxtOut);
                if XmlDocument.ReadFrom(TxtOut, XMLout) then
                    exit(XMLout)
                else
                    error('Expected XML format from USPS, got this instead: %1', Txtout);
            end else
                error('USPS web service call failed (status code %1)', Response.HttpStatusCode());
        end else
            error('Cannot contact USPS, connection error!');
    end;
}