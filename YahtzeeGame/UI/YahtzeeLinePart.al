page 54581 "Yahtzee Line Part"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Yahtzee Data Game Line";

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
                        Style = Favorable;
                        StyleExpr = Rec.P1Set;

                        trigger OnDrillDown()
                        begin
                            ApplyDiceToCombination();
                        end;
                    }
                }
            }
        }
    }

    procedure ApplyDiceToCombination()
    begin
        if Engine.ApplyScore(Rec) then begin
            ChanceApplied := true;
            CurrPage.Update();
        end;
    end;

    local procedure GetScore(Line: Record "Yahtzee Data Game Line"; PlayerNum: Integer): Text
    var
        PossibleScore: Integer;
        Score: Text;
    begin
        if Line.P1Set then
            Score := Format(Line.P1Score)
        else begin
            Score := '...';
            PossibleScore := Engine.GetPossibleScore(Line.Combination);
            if PossibleScore <> 0 then
                Score := StrSubstNo('... (%1)', PossibleScore);
        end;
        exit(Score);
    end;

    procedure GetChanceApplied(): Boolean
    begin
        exit(ChanceApplied);
    end;

    procedure OnDiceRolled(var GameEngine: Codeunit Yahtzee)
    var
    begin
        Engine := GameEngine;
        ChanceApplied := false;
        CurrPage.Update();
    end;

    var
        Engine: Codeunit Yahtzee;
        [InDataSet]
        ChanceApplied: Boolean;


}