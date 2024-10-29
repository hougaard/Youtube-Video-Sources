// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.shortcomingsintheplatform;

using Microsoft.Sales.Customer;
using Microsoft.Inventory.Item;

pageextension 50100 ItemListExt extends "Item Card"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}