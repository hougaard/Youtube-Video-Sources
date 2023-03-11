codeunit 51200 "Odd Accounting"
{
    Permissions = tabledata "G/L Entry" = RM;

    internal procedure UpdateAccountingPeriods()
    var
        Entry: Record "G/L Entry";
    begin
        if Entry.FindSet() then
            repeat
                Entry.AccountingPeriod := CalcPeriod(Entry."Posting Date");
                Entry.Modify();
            until Entry.Next() = 0;
    end;

    local procedure CalcPeriod(PostingDate: Date): Integer
    var
        DayOfYear: Integer;
        Period: Integer;
    begin
        DayOfYear := PostingDate - DMY2Date(1, 1, Date2DMY(PostingDate, 3));
        Period := DayOfYear div 28 + 1;
        if Period = 14 then
            exit(13)
        else
            exit(Period);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertGlEntry', '', true, true)]
    local procedure MyProcedure(var GLEntry: Record "G/L Entry")
    begin
        GLEntry.AccountingPeriod := CalcPeriod(GLEntry."Posting Date");
    end;
}