table 50121 "Test Table"
{
    Caption = 'Test Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "code"; Code[20])
        {
            Caption = 'code';
            DataClassification = ToBeClassified;
        }
        field(2; "Text 1"; Text[200])
        {
            Caption = 'Text 1';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if GuiAllowed then
                    message('x=%1 new=%2 (%3)', xRec."Text 1", Rec."Text 1", CurrFieldNo);
            end;
        }
        field(3; "Text 2"; Text[300])
        {
            Caption = 'Text 2';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "code")
        {
            Clustered = true;
        }
    }

}
