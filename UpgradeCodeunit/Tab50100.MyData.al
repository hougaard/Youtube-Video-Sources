table 50100 MyData
{
    Caption = 'MyData';
    DataClassification = ToBeClassified;
    ObsoleteState = Removed;
    ObsoleteReason = 'Replaced by MyData2';

    fields
    {
        field(1; Customer; Code[20])
        {
            Caption = 'Customer';
        }
        field(2; When; Date)
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
