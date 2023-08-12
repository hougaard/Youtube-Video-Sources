table 53101 "Entity Hgd"
{
    fields
    {
        field(1; EntityKey; Text[50])
        {
            Caption = 'Entity Key';
        }
        field(2; RowKeyField; Text[100])
        {
            Caption = 'Row Key Field';
        }
        field(10; SortingFieldName; Text[100])
        {
            Caption = 'Sorting Field';
        }
        field(20; ListFields; Text[2048])
        {
            Caption = 'List Fields';
        }
    }
    keys
    {
        key(PK; EntityKey)
        {
            Clustered = true;
        }
    }
}