codeunit 50100 "USPS Management Hgd"
{
    procedure ApplyAddress(CompareRec: Record "USPS Address Verify Hgd")
    var
        Customer: Record Customer;
        Vendor: Record Vendor;
    begin
        case CompareRec.Type of
            CompareRec.Type::Customer:
                begin
                    Customer.GET(CompareRec."No.");
                    Customer.Validate(Name, CompareRec."USPS FirmName");
                    Customer.Validate(Address, CompareRec."USPS Address 1");
                    Customer.Validate("Address 2", CompareRec."USPS Address 2");
                    Customer.Validate(City, CompareREc."USPS City");
                    Customer.Validate("Post Code", CompareRec."USPS Zip5");
                    Customer.Validate(County, CompareRec."USPS State");
                    Customer.Modify(true);
                end;
            CompareRec.Type::Vendor:
                begin
                    Vendor.GET(CompareRec."No.");
                    Vendor.Validate(Name, CompareRec."USPS FirmName");
                    Vendor.VAlidate(Address, CompareRec."USPS Address 1");
                    Vendor.VAlidate("Address 2", CompareRec."USPS Address 2");
                    Vendor.Validate(City, CompareREc."USPS City");
                    Vendor.Validate("Post Code", CompareRec."USPS Zip5");
                    Vendor.Validate(County, CompareRec."USPS State");
                    Vendor.Modify(true);
                end;
        end;
    end;

    procedure VerifyVendorAddress(var Vendor: Record Vendor)
    var
        Setup: Record "USPS Setup Hgd";
        CompareRec: Record "USPS Address Verify Hgd";
    begin
        if not Setup.GET() then
            error('USPS Setup is needed, please enter URL and UserID');

        If not CompareRec.GET(CompareRec.Type::Customer, Vendor."No.") then begin
            CompareRec.INIT();
            CompareREc.Type := CompareRec.Type::Customer;
            CompareRec."No." := Vendor."No.";
            CompareRec.Insert(true);
        end;
        CompareRec.Name := Vendor.Name;
        CompareRec."Address 1" := Vendor.Address;
        CompareRec."Address 2" := Vendor."Address 2";
        CompareRec.City := Vendor.City;
        CompareRec.County := Vendor.County;
        CompareRec."Post Code" := Vendor."Post Code";

        PrepareXML(CompareRec, Setup);

        CompareRec.Modify();
        Commit();
        Page.run(50101, CompareRec);
    end;

    procedure VerifyCustomerAddress(var Customer: Record Customer)
    var
        Setup: Record "USPS Setup Hgd";
        CompareRec: Record "USPS Address Verify Hgd";
    begin
        if not Setup.GET() then
            error('USPS Setup is needed, please enter URL and UserID');

        If not CompareRec.GET(CompareRec.Type::Customer, Customer."No.") then begin
            CompareRec.INIT();
            CompareREc.Type := CompareRec.Type::Customer;
            CompareRec."No." := Customer."No.";
            CompareRec.Insert(true);
        end;
        CompareRec.Name := Customer.Name;
        CompareRec."Address 1" := Customer.Address;
        CompareRec."Address 2" := Customer."Address 2";
        CompareRec.City := Customer.City;
        CompareRec.County := Customer.County;
        CompareRec."Post Code" := Customer."Post Code";

        PrepareXML(CompareRec, Setup);

        CompareRec.Modify();
        Commit();
        Page.run(50101, CompareRec);
    end;

    local procedure PrepareXML(var CompareRec: Record "USPS Address Verify Hgd"; var Setup: Record "USPS Setup Hgd")
    var
        Parameters: XmlDocument;
        Result: XmlDocument;
        Address: XmlElement;
        AVR: XmlElement;
        ErrorTxt: Text;
        ErrorResultLbl: Label 'USPS returned an error: %1', Comment = '%1 is the error text';
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

        if GetField(Result, 'AddressValidateResponse/Address[1]/Error/Description') <> '' then
            error(ErrorResultLbl, GetField(Result, 'AddressValidateResponse/Address[1]/Error/Description'));

        if GetField(Result, 'AddressValidateResponse/Address[1]/Address1') = '' then begin
            Result.WriteTo(ErrorTxt);
            error('USPS did not return a value address. (but no error was shown, Debug informatoin: %1', ErrorTxt);
        end;
        CompareRec."USPS FirmName" := copystr(GetField(Result, 'AddressValidateResponse/Address[1]/FirmName'), 1, maxstrlen(CompareRec."USPS FirmName"));
        CompareRec."USPS Address 1" := GetField(Result, 'AddressValidateResponse/Address[1]/Address1');
        CompareRec."USPS Address 2" := GetField(Result, 'AddressValidateResponse/Address[1]/Address2');
        CompareRec."USPS Business" := GetFieldBool(Result, 'AddressValidateResponse/Address[1]/Business');
        CompareRec."USPS City" := GetField(Result, 'AddressValidateResponse/Address[1]/City');
        CompareRec."USPS State" := GetField(Result, 'AddressValidateResponse/Address[1]/State');
        CompareRec."USPS Zip5" := GetField(Result, 'AddressValidateResponse/Address[1]/Zip5');
        CompareRec."USPS Zip4" := GetField(Result, 'AddressValidateResponse/Address[1]/Zip4');
    end;

    local procedure GetFieldBool(var Xml: XmlDocument; Path: Text): Boolean;
    var
        N: XmlNode;
        b: Boolean;
    begin
        if Xml.SelectSingleNode(Path, N) then begin
            Evaluate(b, N.AsXmlElement().InnerText, 9);
            exit(b);
        end;
    end;

    local procedure GetField(var Xml: XmlDocument; Path: Text): Text;
    var
        N: XmlNode;
    begin
        if Xml.SelectSingleNode(Path, N) then
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
        Setup: Record "USPS Setup Hgd";
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