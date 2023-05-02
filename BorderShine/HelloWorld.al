// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 ItemListExt extends "Item Card"
{
    layout
    {
        addLast(content)
        {
            usercontrol(Border; BorderAddIn)
            {
                applicationArea = all;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Test';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Test';

                trigger OnAction()
                begin
                    CurrPage.Border.DoIt();
                end;
            }
        }
    }
}