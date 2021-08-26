codeunit 50100 "Procedures"
{
    var
        Tmp: Record Customer temporary;

    internal procedure Proc1()
    begin

    end;

    internal procedure Process()
    var
        C: Record Customer;
    begin
        Tmp.DeleteAll();
        if C.FindSet() then
            repeat
                SubProcess();
            until C.Next() = 0;
    end;

    local procedure SubProcess()
    begin
        Tmp.Insert();
    end;

    procedure Test()
    begin
        Proc1();
    end;
}