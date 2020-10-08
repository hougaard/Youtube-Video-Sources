table 50129 "Very Temporary Table"
{
    Caption = 'Very Temporary Table';
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; Primary; Code[10])
        {
            Caption = 'Primary';
            DataClassification = SystemMetadata;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Naem';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; Primary)
        {
            Clustered = true;
        }
    }

}
