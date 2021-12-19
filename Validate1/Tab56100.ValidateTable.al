table 56100 "Validate Table"
{
    Caption = 'Validate Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Code[10])
        {
            Caption = 'PK';
            DataClassification = ToBeClassified;
        }
        field(2; "Validate This"; Text[100])
        {
            Caption = 'Validate This';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Message('OnValidate Table Trigger');
                Rec."Validate This" := 'OnValidate Table Trigger';
            end;
        }
    }
    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }

}
