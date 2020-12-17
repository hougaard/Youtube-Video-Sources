page 51101 "RegEx Matches"
{
    PageType = ListPart;
    SourceTable = Matches;
    SourceTableTemporary = true;
    Editable = false;
    layout
    {
        area(Content)
        {

            repeater(rep)
            {
                field(Index; Rec.Index)
                {
                    ApplicationArea = All;
                }
                field(MatchIndex; Rec.MatchIndex)
                {
                    ApplicationArea = All;
                }
                field(Success; Rec.Success)
                {
                    ApplicationArea = All;
                }
                field(Length; Rec.Length)
                {
                    ApplicationArea = All;
                }
                field(Data; GetData(Rec))
                {
                    ApplicationArea = all;
                    Caption = 'Match';
                }
            }
        }
    }
    procedure GetData(m: Record Matches): Text
    begin
        exit(copystr(InputData, m.Index + 1, m.Length));
    end;

    procedure Fill(_InputData: Text; var m2: Record Matches)
    begin
        InputData := _InputData;
        rec.deleteall();
        if m2.findset() then
            repeat
                rec.copy(m2);
                rec.insert();
            until m2.next() = 0;
    end;

    var
        InputData: Text;
}