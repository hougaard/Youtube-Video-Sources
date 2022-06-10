page 54589 TestYahtzeeLine
{
    ApplicationArea = All;
    Caption = 'TestYahtzeeLine';
    PageType = List;
    SourceTable = "Yahtzee Data Game Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(GameId; Rec.GameId)
                {
                    ApplicationArea = All;
                }
                field(Combination; Rec.Combination)
                {
                    ApplicationArea = All;
                }
                field(P1Score; Rec.P1Score)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

page 54588 TestYahtzeeHeader
{
    ApplicationArea = All;
    Caption = 'TestYahtzeeHeader';
    PageType = List;
    SourceTable = "Yahtzee Data Game";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(GameId; Rec.GameId)
                {
                    ApplicationArea = All;
                }
                field(Combination; Rec."P1 Score")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
