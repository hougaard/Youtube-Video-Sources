codeunit 50100 "USPS Management"
{
    procedure VerifyCustomerAddress(var Customer: Record Customer)
    var
        Setup: Record "USPS Setup";
        CompareRec: Record "USPS Address Verify";
        Parameters: XmlDocument;
        Result: XmlDocument;
        Address: XmlElement;
        AVR: XmlElement;
        ResultTxt: Text;

    begin
        if not Setup.GET() then
            error('USPS Setup is needed, please enter URL and UserID');
        PrepareXML(CompareRec, Setup);
    end;

    local procedure PrepareXML(var CompareRec: Record "USPS Address Verify"; var Setup: Record "USPS Setup")
    var
        Parameters: XmlDocument;
        Result: XmlDocument;
        Address: XmlElement;
        AVR: XmlElement;
        ResultTxt: Text;
    begin
        Parameters := XmlDocument.Create();
        Address := XmlElement.Create('Address');
        Address.Attributes().Set('ID', '0');
        Address.Add(AddField('FirmName', CompareRec.Name));
        Address.Add(AddField('Address1', CompareRec."Address 1"));
        Address.Add(AddField('Address2', CompareRec."Address 2"));
        Address.Add(AddField('City', CompareRec.City));
        Address.Add(AddField('State', CompareRec.County));
        Address.Add(AddField('Zip5', CompareRec."Post Code"));
        Address.Add(AddField('Zip4', '')); // TODO: Split and Fix!
        AVR := XmlElement.Create('AddressValidateRequest');
        AVR.Attributes().Set('USERID', Setup.UserID);
        AVR.Add(Address);
        Parameters.Add(AVR);
        Result := CallWebService('Verify', Parameters);

        CompareRec."USPS FirmName" := GetField(Result, 'AddressValidateResponse/Address[1]/FirmName');
        CompareRec."Address 1" := GetField(Result, 'AddressValidateResponse/Address[1]/Address1');
        CompareRec."Address 2" := GetField(Result, 'AddressValidateResponse/Address[1]/Address2');
    end;

    local procedure GetFieldBool(var Xml: XmlDocument; Path: Text): Boolean;
    var
        v: Variant;
        N: XmlNode;
        b: Boolean;
    begin
        Xml.SelectSingleNode(Path, N);
        Evaluate(b, N.AsXmlElement().InnerText, 9);
        exit(b);
    end;

    local procedure GetField(var Xml: XmlDocument; Path: Text): Text;
    var
        v: Variant;
        N: XmlNode;
    begin
        Xml.SelectSingleNode(Path, N);
        exit(N.AsXmlElement().InnerText);
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