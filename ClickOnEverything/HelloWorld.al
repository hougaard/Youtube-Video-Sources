
pageextension 50128 CustomerListExt extends "Customer List"
{
    layout
    {
        addlast(content)
        {
            usercontrol(JavascriptAccess; JavascriptAccess)
            {
                ApplicationArea = all;
                trigger ControlReady()
                begin
                    //CurrPage.JavascriptAccess.clickanything();
                end;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Test Javascript';
                ApplicationArea = all;
                trigger OnAction()
                begin
                    CurrPage.JavascriptAccess.clickanything();
                end;
            }
            action(FilterPane)
            {
                Caption = 'Filter Pane Toggle';
                ApplicationArea = all;
                trigger OnAction()
                begin
                    CurrPage.JavascriptAccess.FilterPaneToggle();
                end;
            }
        }
    }
}