// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.AtFiltering;

using Microsoft.Sales.Customer;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        //Message('App published: Hello world');
        Rec.SetRange(Name, 'test|Test|TEST');
    end;
}