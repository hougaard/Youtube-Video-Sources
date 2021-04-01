table 50148 "Lookup tester"
{
    Caption = 'Lookup tester';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PKEY; Code[20])
        {
            Caption = 'PKEY';
            DataClassification = ToBeClassified;
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = Item,GL;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(Item)) Item."No." else
            if (Type = const(GL)) "G/L Account"."No.";
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
