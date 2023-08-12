pageextension 50105 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        D1: Date;
        D2: Date;
        JValue: JsonValue;
    begin
        D1 := ClosingDate(TODAY());
        JValue.SetValue(format(D1));

        //D2 := JValue.AsDate();
        Evaluate(D2, JValue.AsText());
        Message('Result %1 - %2 - %3', D1, D2, format(D1));
    end;
}