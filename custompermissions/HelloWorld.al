// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Action1)
            {
                Caption = 'Only for the few';
                ApplicationArea = all;
                trigger OnAction()
                var
                    ac: Record "Access Control";
                begin
                    ac.setrange("User Security ID", UserSecurityId());
                    ac.setfilter("Role ID", 'ONLYTHEFEW');
                    if ac.IsEmpty() then
                        error('You''re not one of the few!');
                    message('Hello');
                end;
            }
        }
    }
}