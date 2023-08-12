// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        d, d2 : Decimal;
    begin
        //Message('%1 %2', 123456.789, format(123456.789, 0, 9));
        if Evaluate(d, '123456,789', 9) then;
        if Evaluate(d2, '123678.789', 9) then;
        message('%1    %2', d, d2);
    end;
}