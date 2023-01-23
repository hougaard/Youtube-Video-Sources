table 50108 StuffandDate
{
    Caption = 'StuffandDate';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; StartDate; Date)
        {
            Caption = 'StartDate';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; StartDate)
        {
            Clustered = true;
        }
    }
}
