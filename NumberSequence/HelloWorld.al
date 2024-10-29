// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.NumberSequence;

using Microsoft.Sales.Customer;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        if not NumberSequence.Exists('youtube') then begin
            NumberSequence.Insert('youtube', 1234, 1, true);
        end;
        message('Number %1', NumberSequence.Range('youtube', 5));
    end;
}