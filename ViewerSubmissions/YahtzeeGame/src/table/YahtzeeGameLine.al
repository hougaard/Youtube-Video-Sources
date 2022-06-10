table 54581 "Yahtzee Data Game Line"
{

    fields
    {
        field(1; GameId; Integer)
        {
            TableRelation = "Yahtzee Data Game".GameId;
        }
        field(2; Combination; Enum YahtzeeCombEnum)
        {
            Caption = 'Combinação';
        }
        field(3; P1Score; Integer)
        {
            Caption = 'Player 1';
            Editable = false;

            trigger OnValidate();
            begin
                ScoreValidation(1);
            end;
        }
        field(4; P1Set; Boolean)
        {
            Editable = false;
        }
        field(5; P2Score; Integer)
        {
            Editable = false;
        }
    }

    keys
    {
        key(PKey; GameId, Combination)
        {
            Clustered = true;
        }
    }

    procedure CreateGameLine(GameId: Integer; Combination: Enum YahtzeeCombEnum)
    var
        NewLine: Record "Yahtzee Data Game Line";
    begin
        NewLine.GameId := GameId;
        NewLine.Combination := Combination;
        NewLine.Insert();
    end;

    procedure GetCombinationToolTip(): Text[100]
    begin
        exit(GetCombinationToolTip(Combination));
    end;

    procedure GetCombinationToolTip(Comb: Enum YahtzeeCombEnum): Text[100]
    var
        ToolTip: Text[100];
        LabelSumOf, LabelHigherBetter, LabelPoints, LabelSeeOptions : Text[40];
    begin
        LabelSumOf := 'Sum of %1.';
        LabelHigherBetter := ' Higher number is better.';
        LabelPoints := '%1 points.';
        LabelSeeOptions := ' (See options)';
        case Comb of
            Comb::NumRepeatOnes:
                ToolTip := StrSubstNo(LabelSumOf, Comb);
            Comb::NumRepeatTwos:
                ToolTip := StrSubstNo(LabelSumOf, Comb);
            Comb::NumRepeatThrees:
                ToolTip := StrSubstNo(LabelSumOf, Comb);
            Comb::NumRepeatFours:
                ToolTip := StrSubstNo(LabelSumOf, Comb);
            Comb::NumRepeatFives:
                ToolTip := StrSubstNo(LabelSumOf, Comb);
            Comb::NumRepeatSixes:
                ToolTip := StrSubstNo(LabelSumOf, Comb);
            Comb::NumRepeatBonus:
                ToolTip := '+35pts if ≥ 63pts';
            Comb::ThreeOfAKind:
                ToolTip := StrSubstNo(LabelSumOf, '3 equal dice') + LabelHigherBetter;
            Comb::FourOfAKind:
                ToolTip := StrSubstNo(LabelSumOf, '4 equal dice') + LabelHigherBetter;
            Comb::FullHouse:
                ToolTip := StrSubstNo(LabelPoints, '25 or Dice') + LabelSeeOptions;
            Comb::StraightSmall:
                ToolTip := StrSubstNo(LabelPoints, 30);
            Comb::StraightLarge:
                ToolTip := StrSubstNo(LabelPoints, 40);
            Comb::Yahtzee:
                ToolTip := StrSubstNo(LabelPoints, 50);
            Comb::Chance:
                ToolTip := StrSubstNo(LabelSumOf, 'ALL dice') + LabelHigherBetter;
        end;
        exit(ToolTip);
    end;

    local procedure ScoreValidation(PlayerNum: Integer)
    var
    begin
        if P1Set = true then
            Error('Combination %1 has been already allocated for player %2', Combination, PlayerNum)
        else begin
            if P1Score > 0 then
                P1Set := true
            else begin
                if Confirm('Do you confirm discarding %1', false, Combination) then
                    P1Set := true;
            end;
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