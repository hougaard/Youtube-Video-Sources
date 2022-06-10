// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

#pragma implicitwith disable
pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        item: Record Item;
    begin
        case item."Inventory Posting Group" of
            '100':
                message('100');
            '200':
                message('200');
            else
                message('rest');
        end;
    end;
}
#pragma implicitwith restore
