table 50100 "Excel Test"
{
    Caption = 'Excel Test';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Primary; Code[10])
        {
            Caption = 'Primary';
            DataClassification = SystemMetadata;
        }
        field(2; "Text Data"; Text[100])
        {
            Caption = 'Text Data';
            DataClassification = SystemMetadata;
        }
        field(3; "Date Data"; Date)
        {
            Caption = 'Date Data';
            DataClassification = SystemMetadata;
        }
        field(4; "Decimal Data"; Decimal)
        {
            Caption = 'Decimal Data';
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
