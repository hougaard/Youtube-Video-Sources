table 50101 MyData2
{
    Caption = 'MyData';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Customer; Code[20])
        {
            Caption = 'Customer';
        }
        field(2; When; DateTime)
        {
            Caption = 'When';
        }
        field(3; What; Text[100])
        {
            Caption = 'What';
        }
    }
    keys
    {
        key(PK; Customer, WHen)
        {
            Clustered = true;
        }
    }
}
