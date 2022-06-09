table 54580 "Yahtzee Data Game"
{

    fields
    {
        field(1; GameId; Integer)
        {
            Caption = 'Game ID';
        }
        field(2; "Player 1"; Integer)
        {
        }
        field(3; "P1 Score"; Integer)
        {
            Caption = 'Score';
            FieldClass = FlowField;
            CalcFormula = sum("Yahtzee Data Game Line".P1Score where(GameId = field(GameId),
                                                                     P1Set = filter(true)));
        }
        field(4; "P1 Sum Of Upper Points"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Yahtzee Data Game Line".P1Score where(GameId = field(GameId),
                                                                     P1Set = filter(true),
                                                                     Combination = filter(0 .. 5)));
        }
    }

    keys
    {
        key(PKey; GameId)
        {
            Clustered = true;
        }
    }

    procedure CalcHighestScore(): Integer
    var
        Games: Record "Yahtzee Data Game";
        BestScore: Integer;
    begin
        Games.SetAutoCalcFields("P1 Score");
        if Games.FindSet() then
            repeat
                if games."P1 Score" > BestScore then
                    BestScore := Games."P1 Score";
            until Games.Next() = 0;
        exit(BestScore);
    end;

    var

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    var
        GameLines: Record "Yahtzee Data Game Line";
        GameRound: Record "Yahtzee Data Dice";
    begin
        GameLines.SetRange(GameId, Rec.GameId);
        GameLines.DeleteAll();

        GameRound.SetRange(GameId, GameId);
        GameRound.DeleteAll();
    end;

    trigger OnRename()
    begin

    end;


}