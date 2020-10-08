table 58400 "base64 Blob Demo"
{
    fields
    {
        field(1; PKEY; Integer)
        {

        }
        field(2; BLOB; Blob)
        {
            Subtype = Bitmap;
        }
        field(3; base64; Text[2000])
        {

        }
    }
    keys
    {
        key(PK; PKEY)
        { }
    }
}