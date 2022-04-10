table 50104 "Blob Table"
{
    Caption = 'Blob Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Code[20])
        {
            Caption = 'PK';
            DataClassification = ToBeClassified;
        }
        field(2; "Blob"; Blob)
        {
            Caption = 'Blob';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
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
