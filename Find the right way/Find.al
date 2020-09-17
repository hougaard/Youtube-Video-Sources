codeunit 50134 "Find The Right Way"
{
    procedure Test()
    var
        Customer: Record Customer;
    begin
        //if Customer.FIND('-') then
        Customer.Setfilter(Name, 'Erik*');
        Customer.SetCurrentKey(Name);
        IF Customer.FindSet() then
            repeat
            //
            until Customer.Next() = 0;
    end;
}