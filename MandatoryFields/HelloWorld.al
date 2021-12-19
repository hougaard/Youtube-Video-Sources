pageextension 50144 "Customer Card" extends "Customer Card"
{
    layout
    {
        modify("Credit Limit (LCY)")
        {
            ShowMandatory = Rec.Blocked = Rec.Blocked::" ";
            BlankZero = true;
        }
    }
    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Credit Limit (LCY)" = 0 then
            error('You cannot created a customer without a credit limit!');
        exit(true);
    end;
}


tableextension 50133 "Sales Header" extends "Sales Header"
{
    fields
    {
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                Customer: Record Customer;
            begin
                Customer.Get(Rec."Sell-to Customer No.");
                if Customer."Credit Limit (LCY)" = 0 then
                    error('You cannot use a customer without a credit limit!');
            end;
        }
    }
}