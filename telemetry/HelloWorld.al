// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 ItemList extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(Telemetry)
            {
                Caption = 'Telemetry';
                ApplicationArea = all;
                trigger OnAction()
                var
                    t: Codeunit "Telemetry Query thing";
                begin
                    t.RunQuery();
                end;
            }
        }
    }
}