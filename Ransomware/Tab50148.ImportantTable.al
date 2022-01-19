table 50148 ImportantTable
{
    Caption = 'ImportantTable';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; PKey; Code[20])
        {
            Caption = 'PKey';
            DataClassification = ToBeClassified;
        }
        field(2; Data1; Text[50])
        {
            Caption = 'Data1';
            DataClassification = ToBeClassified;
        }
        field(3; Date2; Date)
        {
            Caption = 'Date2';
            DataClassification = ToBeClassified;
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; PKey)
        {
            Clustered = true;
        }
    }
}
