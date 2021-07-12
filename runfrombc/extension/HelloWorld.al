// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(OpenExtenal)
            {
                Caption = 'Open External';
                ApplicationArea = all;
                trigger OnAction()
                var
                    Parm: Text;
                begin
                    Parm := format(Rec) +
                    '11111111111111111111111111111111111111111111111111111111111111111111111111111111' +
                    '11111111111111111111111111111111111111111111111111111111111111111111111111111111' +
                    '11111111111111111111111111111111111111111111111111111111111111111111111111111111' +
                    '11111111111111111111111111111111111111111111111111111111111111111111111111111111' +
                    '11111111111111111111111111111111111111111111111111111111111111111111111111111111' +
                    '11111111111111111111111111111111111111111111111111111111111111111111111111111111' +
                    '11111111111111111111111111111111111111111111111111111111111111111111111111111111' +
                    '11111111111111111111111111111111111111111111111111111111111111111111111111111111' +
                    '11111111111111111111111111111111111111111111111111111111111111111111111111111111';
                    Message('Parm Length %1', Strlen(Parm));
                    Hyperlink('runfrombc:' + Parm);
                end;
            }
        }
    }
}