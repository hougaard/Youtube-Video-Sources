table 50300 "Test Table BarCode"
{
    fields
    {
        field(1; "BarCode"; Code[20])
        {
            Caption = 'BarCode Code';
            DataClassification = SystemMetadata;
        }
        field(2; "BarCode Picture"; Blob)
        {
            Caption = 'Picture';
            Subtype = Bitmap;
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; BarCode)
        {

        }
    }
}