table 54583 "Yahtzee Data Setup"
{
    Caption = 'Yahtzee Game Options';

    fields
    {
        field(1; UniqueKey; Integer)
        {
            Editable = false;
        }
        field(2; "Full-house for dice-price"; Boolean)
        {
            Caption = 'Full-house for dice-price';
        }
        field(10; "Highest score"; Integer)
        {
            Caption = 'Highest score';
            Editable = false;
        }
    }

    keys
    {
        key(UK; UniqueKey)
        {
            Clustered = true;
        }
    }

    procedure FindOrCreate(): Record "Yahtzee Data Setup"
    var
        UniqueRec: Record "Yahtzee Data Setup";
    begin
        if not UniqueRec.Get(1) then begin
            UniqueRec.Init();
            UniqueRec.UniqueKey := 1;
            UniqueRec.Insert();
            Commit();
        end;
        exit(UniqueRec);
    end;

    var

    trigger OnInsert()
    var
    begin
        if Rec.UniqueKey = 0 then
            Rec.UniqueKey := 1;
    end;

}