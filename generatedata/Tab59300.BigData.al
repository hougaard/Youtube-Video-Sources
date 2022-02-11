table 59300 BigData
{
    Caption = 'BigData';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; LineNo; Integer)
        {
            Caption = 'LineNo';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[1000])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; LineNo)
        {
            Clustered = true;
        }
    }
}
