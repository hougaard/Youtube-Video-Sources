table 54301 "Dude Setup"
{
    Caption = 'Dude Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PKEY; Code[10])
        {
            Caption = 'PKEY';
            DataClassification = ToBeClassified;
        }
        field(2; "No. Series for Dude"; Code[20])
        {
            Caption = 'No. Series for Dude';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
    }
    keys
    {
        key(PK; PKEY)
        {
            Clustered = true;
        }
    }

}
