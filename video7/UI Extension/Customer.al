pageextension 50100 CustomerListExt extends "Customer List"
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
                    Mgt.VerifyCustomerAddress(Rec);
                end;
            }
        }
    }
}
pageextension 50101 CustomerCardExt extends "Customer Card"
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
                    Mgt.VerifyCustomerAddress(Rec);
                end;
            }
        }
    }
}