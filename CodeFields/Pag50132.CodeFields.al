page 50132 "Code Fields"
{

    ApplicationArea = All;
    Caption = 'Code Fields';
    PageType = List;
    SourceTable = "Code Table";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Display; Rec.Display)
                {
                    ToolTip = 'Specifies the value of the Display field';
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        T: Text;
        C: Code[10];
        PsudoCode: Text;
    begin
        T := ' 1 ';
        C := T;
        PsudoCode := T.ToUpper().Trim();

        message('!%1! (%2)', PsudoCode, strlen(PsudoCode));
    end;

}
