// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ELI5_Filters;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Customer: Record Customer;
        SalesLine: Record "Sales Line";
    begin
        //Customer.Setfilter(Address, 'Some Road');
        //Customer.SetRange(Name, 123.50);
        Customer.Setfilter("Credit Limit (LCY)", '..0|100..');
        Customer.SetCurrentKey(Name);
        Customer.FindFirst();
        Customer.Setrange("Gen. Bus. Posting Group", 'RETAIL');
        Customer.FindFirst();


        repeat
            message('Result = %1', Customer.Count());
        until Customer.Next(-1) = 0;
    end else
            message('Nothing within filter!');
    end;
}