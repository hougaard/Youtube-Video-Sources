page 50100 "Eriks Customers"
{
    ApplicationArea = All;
    Caption = 'My Customers';
    PageType = List;
    SourceTable = Customer;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(City; Rec.City)
                {
                }
                field(VendorName; GetVendorName(Rec))
                {
                }
                field(VendorName2; VendorNameTxt)
                {
                }
                field(VendorName3; Rec.VendorName)
                {
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        Vendor: Record Vendor;
    begin
        if Vendor.Get(Rec."No.") then
            VendorNameTxt := Vendor.Name
        else
            VendorNameTxt := '';
    end;

    local procedure GetVendorName(CustRec : Record Customer): Text
    var
        Vendor: Record Vendor;
    begin
        if Vendor.Get(CustRec."No.") then
            exit(Vendor.Name)
        else
            exit('<no vendor>');
    end;

    var
        [InDataSet]
        VendorNameTxt: Text;
}
