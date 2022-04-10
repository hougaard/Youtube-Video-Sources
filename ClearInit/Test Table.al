table 50118 "Test Table"
{
    fields
    {
        field(1; Primary; Code[20])
        {
            InitValue = 'ABC';
        }
        field(3; Texti; Text[100])
        {
            InitValue = 'Hello';
        }
        field(4; ANumber; Decimal)
        {
            InitValue = 123.45;
        }
        field(10; SomeDay; Date)
        {
            InitValue = 20220101D;
        }
    }
    keys
    {
        key(PK; Primary)
        { }
    }
}