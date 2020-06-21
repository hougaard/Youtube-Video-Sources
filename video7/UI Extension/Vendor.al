pageextension 50102 VendorListExt extends "Vendor List"
{
    actions
    {
        addfirst(processing)
        {
            action(Verify)
            {
                Caption = 'Verify Address';
                Image = Addresses;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Mgt: Codeunit "USPS Management";
                begin
                    Mgt.VerifyVendorAddress(Rec);
                end;
            }
        }
    }
}
pageextension 50103 VendorCardExt extends "Vendor Card"
{
    actions
    {
        addfirst(processing)
        {
            action(Verify)
            {
                Caption = 'Verify Address';
                Image = Addresses;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Mgt: Codeunit "USPS Management";
                begin
                    Mgt.VerifyVendorAddress(Rec);
                end;
            }
        }
    }
}