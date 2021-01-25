// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50110 ItemListExt extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(setfilter)
            {
                caption = 'Set two filters';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    grp: Integer;
                    item2: Record Item;
                begin
                    rec.FilterGroup(-1);
                    rec.SetCurrentKey("")
                    rec.setfilter(Description, '*@chair*');
                    rec.setfilter("Description 2", '*@chair*');
                    rec.FilterGroup(0);
                end;
            }
        }
    }
}