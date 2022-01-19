table 50100 Bulk
{
    Caption = 'Bulk';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; PK; Integer)
        {
            Caption = 'PK';
            DataClassification = ToBeClassified;
        }
        field(2; Data; Text[1000])
        {
            Caption = 'Data';
            DataClassification = ToBeClassified;
        }
        field(3; Data2; Text[1000])
        {
            Caption = 'Data2';
            DataClassification = ToBeClassified;
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
