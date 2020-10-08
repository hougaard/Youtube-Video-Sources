table 56101 "A proper Table"
{
    Caption = 'A proper Table';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Primary Key Field"; Code[20])
        {
            Caption = 'Primary Key Field';
            DataClassification = SystemMetadata;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Primary Key Field")
        {
            Clustered = true;
        }
    }
    
}
