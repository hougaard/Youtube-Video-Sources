pageextension 50214 "Cust List" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(TestOverload)
            {
                Caption = 'Create Customer';
                ApplicationArea = all;
                trigger OnAction()
                var
                    CreateCustomer: Codeunit Overloading;
                    base64: Codeunit "Base64 Convert";
                begin
                end;
            }
        }
    }
}