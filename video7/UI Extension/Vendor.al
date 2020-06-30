pageextension 50102 "VendorListExt Hgd" extends "Vendor List"
{
    actions
    {
        addfirst(processing)
        {
            action("Verify Hgd")
            {
                Caption = 'Verify Address';
                Image = Addresses;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Mgt: Codeunit "USPS Management Hgd";
                begin
                    Mgt.VerifyVendorAddress(Rec);
                end;
            }
        }
    }
}
pageextension 50103 "VendorCardExt Hgd" extends "Vendor Card"
{
    actions
    {
        addfirst(processing)
        {
            action("Verify Hgd")
            {
                Caption = 'Verify Address';
                Image = Addresses;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Mgt: Codeunit "USPS Management Hgd";
                begin
                    Mgt.VerifyVendorAddress(Rec);
                end;
            }
        }
    }
}