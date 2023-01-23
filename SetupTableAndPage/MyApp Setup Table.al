table 50600 "MyApp Setup"
{
    Caption = 'MyApp Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(10; "Important Setup 1"; Date)
        {
            Caption = 'Important Setup 1';
            DataClassification = ToBeClassified;
        }
        field(11; "Important Account"; Code[20])
        {
            Caption = 'Important Account';
            DataClassification = ToBeClassified;
        }
        field(12; "Important Item"; Code[20])
        {
            Caption = 'Important Item';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
