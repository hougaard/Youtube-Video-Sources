page 54582 "Yahtzee Score Part"
{
    PageType = CardPart;
    Caption = 'Score';
    SourceTable = "Yahtzee Data Game";

    layout
    {
        area(Content)
        {
            cuegroup(ScoreCue)
            {
                ShowCaption = false;
                field(BestScore; BestScore)
                {
                    Caption = 'Best Score';
                    Image = Star;
                    ApplicationArea = All;
                    Style = Ambiguous;
                }
                field(ScoreCurrGame; Rec."P1 Score")
                {
                    Caption = 'Current Score';
                    Image = Info;
                    ApplicationArea = All;
                    StyleExpr = 'Favorable';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        Engine: Codeunit Yahtzee;
    begin
        BestScore := Engine.GetHighestScore();
    end;

    trigger OnAfterGetCurrRecord()
    var
        Engine: Codeunit Yahtzee;
    begin
        BestScore := Engine.GetHighestScore();
    end;

    var
        [InDataSet]
        BestScore: Integer;

}