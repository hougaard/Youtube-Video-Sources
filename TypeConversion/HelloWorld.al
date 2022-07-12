pageextension 50132 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        t: Text;
        c: Code[20];
        i: Integer;
        d: Decimal;
        da: Date;
        da2: Date;
        ti: Time;
        ti2: Time;
        dt: DateTime;
        du: Duration;
        bt: BigText;
    begin
        da := today();
        da2 := da + 7;
        i := da2 - da;
        du := i;
        ti := time();
        ti2 := ti + 60000;
        du := ti - ti2;
        da := DT2Date(dt);
        message('Result %1 %2 %3', ti, ti2, du);
    end;
}