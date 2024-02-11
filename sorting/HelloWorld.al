// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.sorting;

using Microsoft.Sales.Customer;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        C: Record Customer;
    begin
        c."No." := '30000';
        c.find('=');
        message('%1', C.Name);
        c.next();
        message('%1', C.Name);
        c.SetCurrentKey(Name);
        c."No." := '30000';
        c.find('=');
        message('%1', C.Name);
        c.next();
        message('%1', C.Name);
    end;
}