table 50100 "New Table"
{
    Caption = 'New Table';
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; "Funky Field"; Code[13])
        {
            Caption = 'Funky Field';
            DataClassification = ToBeClassified;
        }
        field(2; "Nice Field"; Text[100])
        {
            Caption = 'Nice Field';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Funky Field")
        {
            Clustered = true;
        }
    }

}
