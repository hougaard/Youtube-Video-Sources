#if appsource
table 70050100 Preprocessor
#else
table 50100 Preprocessor
#endif
{
    Caption = 'Preprocessor';
    DataClassification = ToBeClassified;

    fields
    {
        #region Fields
        field(1; Pre; Code[20])
        {
            Caption = 'Pre';
            DataClassification = ToBeClassified;
        }
        field(2; Pro; Text[30])
        {
            Caption = 'Pro';
            DataClassification = ToBeClassified;
        }
#pragma warning disable AL0468
        field(3; Preprocessoriscoolandfuntoplaywith; Integer)
        {
            Caption = 'Preprocessoriscoolandfuntoplaywith';
            DataClassification = ToBeClassified;
        }
#pragma warning restore
        field(4; Preprocessoriscoolandfuntoplaywith2; Integer)
        {
            Caption = 'Preprocessoriscoolandfuntoplaywith';
            DataClassification = ToBeClassified;
        }
        #endregion
    }
    keys
    {
        key(PK; Pre)
        {
            Clustered = true;
        }
    }
}
