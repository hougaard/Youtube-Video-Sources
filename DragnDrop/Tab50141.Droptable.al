table 50141 "Drop table"
{
    Caption = 'Drop table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; pkey; Code[10])
        {
            Caption = 'pkey';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Sorting Index"; Integer)
        {
            Caption = 'Sorting Index';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; pkey)
        {
            Clustered = true;
        }
        key(sort; "Sorting Index")
        {

        }
    }

}
