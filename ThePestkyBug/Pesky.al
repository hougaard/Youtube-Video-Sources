tableextension 50143 "Sales Lines" extends "Sales Line"
{
    fields
    {
        modify(Quantity)
        {
            trigger OnBeforeValidate()
            begin
                Call(Quantity);
            end;
        }
    }
    procedure Call(q: Decimal)
    begin
        Call2(q, 10);
    end;

    local procedure Call2(Q: Decimal; P: Decimal)
    begin
        call3(q, p, -10);
    end;

    local procedure call3(q: Decimal; p: Decimal; u: Integer)
    begin
        if q > q / (p + u) then
            message('Hello my little bug!');
    end;
}