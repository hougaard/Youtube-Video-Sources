table 50100 "My Sorting Table"
{
    TableType = Temporary;
    fields
    {
        field(1; Integer; Integer)
        {

        }
        field(2; Date; Date)
        {

        }
        field(3; DateTime; DateTime)
        {

        }
    }
    keys
    {
        key(PK; Integer)
        { }
    }
}


pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Sorting: Record "My Sorting Table" temporary;
    begin
        Sorting.Init();
        Sorting.Integer := 1;
        Sorting.Date := 20230101D;
        Sorting.Insert();

        Sorting.Init();
        Sorting.Integer := 2;
        Sorting.Date := 20220101D;
        Sorting.Insert();

        Sorting.Init();
        Sorting.Integer := 3;
        Sorting.Date := 20210101D;
        Sorting.Insert();

        Sorting.Init();
        Sorting.Integer := 4;
        Sorting.Date := 20200101D;
        Sorting.Insert();

        Sorting.SetCurrentKey(Date);
        if Sorting.FindSet() then
            repeat
                Message('%1 %2', Sorting.Integer, Sorting.Date);
            until Sorting.Next() = 0;

    end;
}