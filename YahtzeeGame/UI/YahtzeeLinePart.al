page 54581 "Yahtzee Line Part"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Yahtzee Game Line";

    layout
    {
        area(Content)
        {
            group(CombLinesGrp)
            {
                ShowCaption = false;
                repeater(CombLinesRpt)
                {
                    field(CombinationFld; Rec.Combination)
                    {
                        Caption = 'Combination';
                        ApplicationArea = All;
                        Style = Strong;
                    }
                    field(CombinationToolTipFld; Rec.GetCombinationToolTip())
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                        Style = Subordinate;
                        Visible = false; // Move below the CombinationId if possible
                    }
                    field(P1ScoreFld; GetScore(Rec, 1))
                    {
                        ApplicationArea = All;
                        Caption = 'Player 1';

                        trigger OnDrillDown()
                        begin
                            ApplyDiceToCombination(Rec);
                        end;
                    }
                }
            }
        }
    }

    procedure ApplyDiceToCombination(Line: Record "Yahtzee Game Line")
    var
    begin
        Line.Validate(P1Score, Engine.GetCombinationPossibleScore(Line.Combination));
        Line.Modify();
        ChanceApplied := true;
        CurrPage.Update();
    end;

    local procedure GetScore(Line: Record "Yahtzee Game Line"; PlayerNum: Integer): Text
    var
        PossibleScore: Integer;
        Score: Text;
    begin
        if Line.P1Set then
            Score := Format(Line.P1Score)
        else begin
            Score := '...';
            PossibleScore := Engine.GetCombinationPossibleScore(Line.Combination);
            if PossibleScore > 0 then
                Score := StrSubstNo('... (%1)', PossibleScore);
        end;
        exit(Score);
    end;

    procedure GetChanceApplied(): Boolean
    begin
        exit(ChanceApplied);
    end;

    procedure OnDiceRolled(var GameEngine: Codeunit "Yahtzee Engine")
    var
    begin
        Engine := GameEngine;
        ChanceApplied := false;
        CurrPage.Update();
    end;

    var
        Engine: Codeunit "Yahtzee Engine";
        [InDataSet]
        ChanceApplied: Boolean;


}