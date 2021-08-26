pageextension 50104 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        J: JsonObject;
        T: JsonToken;
        D: Decimal;
    begin
        J.Add('amount', '1.00.00');
        if J.GET('amount', T) then begin
            if TryDecimal(T, D) then
                message('The Amount is %1', D)
            else
                message('That''s not a number! (%1)', GetLastErrorText());
        end;
    end;

    [TryFunction]
    local procedure TryDecimal(var T: JsonToken; var D: Decimal)
    begin
        D := T.AsValue().AsDecimal();
    end;
}