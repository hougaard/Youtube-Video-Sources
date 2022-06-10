table 50109 Fantastico
{
    Caption = 'Fantastico';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; Primo; Code[20])
        {
            Caption = 'Primo';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Value"; Decimal)
        {
            Caption = 'Value';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Primo)
        {
            Clustered = true;
        }
    }
}
