// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ArraysOfEverything;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Posting;
using Microsoft.Sales.Document;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Refs: Array[100] of RecordRef;
    begin

    end;
}