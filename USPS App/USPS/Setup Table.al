table 50100 "USPS Setup Hgd"
{
    Caption = 'USPS Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; UKEY; Code[10])
        {
            Caption = 'UKEY';
            DataClassification = SystemMetadata;
        }
        field(10; URL; Text[100])
        {
            Caption = 'URL';
            DataClassification = SystemMetadata;
        }
        field(20; UserID; Text[30])
        {
            Caption = 'UserID';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; UKEY)
        {
            Clustered = true;
        }
    }

}
