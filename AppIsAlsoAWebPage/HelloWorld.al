// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50123 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(HelpLinkCtl; HelpLink)
            {
                ApplicationArea = all;
                ShowCaption = false;
                trigger OnDrillDown()
                begin
                    Hyperlink('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
                end;
            }
        }
    }
    var
        HelpLink: Label 'Get more help, we really need help!';
}