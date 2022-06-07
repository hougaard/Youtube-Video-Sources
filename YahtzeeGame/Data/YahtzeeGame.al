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

    var

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;


}