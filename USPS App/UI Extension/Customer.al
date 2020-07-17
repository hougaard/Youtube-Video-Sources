pageextension 50100 "CustomerListExt Hgd" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action("Verify Hgd")
            {
                Caption = 'Verify Address';
                ToolTip = 'Verify the address of this customer with the USPS';
                Image = Addresses;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Mgt: Codeunit "USPS Management Hgd";
                begin
                    Mgt.VerifyCustomerAddress(Rec);
                end;
            }
        }
    }
}
pageextension 50101 "CustomerCardExt Hgd" extends "Customer Card"
{
    actions
    {
        addfirst(processing)
        {
            action("Verify Hgd")
            {
                Caption = 'Verify Address';
                ToolTip = 'Verify the address of this customer with the USPS';
                Image = Addresses;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Mgt: Codeunit "USPS Management Hgd";
                begin
                    Mgt.VerifyCustomerAddress(Rec);
                end;
            }
        }
    }
}