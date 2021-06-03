codeunit 53400 "Update Time"
{
    trigger OnRun()
    var
        kt: Record "Time Keeper";
    begin
        kt.get();
        kt.Time1 := Time();
        kt.Time2 := CurrentDateTime();
        kt.Modify();
    end;
}