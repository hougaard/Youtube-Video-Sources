table 54582 "Yahtzee Data Dice"
{
    DataCaptionFields = GameId;

    fields
    {
        field(1; GameId; Integer)
        {
            TableRelation = "Yahtzee Data Game".GameId;
        }
        field(2; TryCount; Integer)
        {
            Caption = 'Dice Round';
        }
        field(3; Dice1Val; Integer)
        {
            Editable = false;
        }
        field(4; Dice2Val; Integer)
        {
            Editable = false;
        }
        field(5; Dice3Val; Integer)
        {
            Editable = false;
        }
        field(6; Dice4Val; Integer)
        {
            Editable = false;
        }
        field(7; Dice5Val; Integer)
        {
            Editable = false;
        }
        field(8; Dice1Img; Blob)
        {
            Caption = 'Dice 1 (Img)';
            Subtype = Bitmap;
        }
        field(9; Dice2Img; Blob)
        {
            Caption = 'Dice 2 (Img)';
            Subtype = Bitmap;
        }
        field(10; Dice3Img; Blob)
        {
            Caption = 'Dice 3 (Img)';
            Subtype = Bitmap;
        }
        field(11; Dice4Img; Blob)
        {
            Caption = 'Dice 4 (Img)';
            Subtype = Bitmap;
        }
        field(12; Dice5Img; Blob)
        {
            Caption = 'Dice 5 (Img)';
            Subtype = Bitmap;
        }
        field(13; Dice1Mark; Boolean)
        {
            Caption = 'Dice 1 (Marked)';
        }
        field(14; Dice2Mark; Boolean)
        {
            Caption = 'Dice 2 (Marked)';
        }
        field(15; Dice3Mark; Boolean)
        {
            Caption = 'Dice 3 (Marked)';
        }
        field(16; Dice4Mark; Boolean)
        {
            Caption = 'Dice 4 (Marked)';
        }
        field(17; Dice5Mark; Boolean)
        {
            Caption = 'Dice 5 (Marked)';
        }
        field(18; TurnNum; Integer)
        {
            Caption = 'No. of Dice Turn';
        }
    }

    keys
    {
        key(PK1; GameId)
        {
            Clustered = true;
        }
    }

    procedure DiceIdx2ImgFldPosition(DiceIdx: Integer): Integer
    begin
        exit(DiceIdx + 7);
    end;

    procedure DiceIdx2ValFldPosition(DiceIdx: Integer): Integer
    begin
        exit(DiceIdx + 2);
    end;

    procedure DiceMark(DiceIdx: Integer; Marked: Boolean)
    var
    begin
        case DiceIdx of
            1:
                Dice1Mark := Marked;
            2:
                Dice2Mark := Marked;
            3:
                Dice3Mark := Marked;
            4:
                Dice4Mark := Marked;
            5:
                Dice5Mark := Marked;
        end;
    end;

    procedure DiceMarkAll(Marked: Boolean)
    var
        DiceIdx: Integer;
    begin
        for DiceIdx := 1 to 5 do begin
            DiceMark(DiceIdx, Marked);
        end;
        Rec.Modify();
    end;

    procedure DiceRoundDisplay(): Text
    begin
        exit(StrSubstNo('%1/3', TryCount));
    end;

    procedure DiceTurnDisplay(): Text
    begin
        exit(StrSubstNo('%1/13', TurnNum));
    end;

    procedure ValidateAnyDiceMarked(): Boolean
    var
        AnyMarked: Boolean;
    begin
        AnyMarked := (Dice1Mark or Dice2Mark or Dice3Mark or Dice4Mark or Dice5Mark);
        if not AnyMarked then
            Error('At least a dice should be marked to roll');
        exit(AnyMarked);
    end;

    procedure IsDiceMarked(DiceIdx: Integer): Boolean
    var
        IsMarked: Boolean;
    begin
        case DiceIdx of
            1:
                IsMarked := Dice1Mark;
            2:
                IsMarked := Dice2Mark;
            3:
                IsMarked := Dice3Mark;
            4:
                IsMarked := Dice4Mark;
            5:
                IsMarked := Dice5Mark;
        end;
        exit(IsMarked);
    end;

    procedure GetDiceValue(DiceIdx: Integer): Integer
    var
        DiceValue: Integer;
    begin
        case DiceIdx of
            1:
                DiceValue := Dice1Val;
            2:
                DiceValue := Dice2Val;
            3:
                DiceValue := Dice3Val;
            4:
                DiceValue := Dice4Val;
            5:
                DiceValue := Dice5Val;
        end;
        exit(DiceValue);
    end;

    procedure SetDiceValue(DiceIdx: Integer; DiceValue: Integer)
    begin
        case DiceIdx of
            1:
                Dice1Val := DiceValue;
            2:
                Dice2Val := DiceValue;
            3:
                Dice3Val := DiceValue;
            4:
                Dice4Val := DiceValue;
            5:
                Dice5Val := DiceValue;
        end;
    end;

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