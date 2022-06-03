table 54580 "Yahtzee Game"
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