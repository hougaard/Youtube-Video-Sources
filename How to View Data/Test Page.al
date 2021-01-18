page 55500 "Source Editor Test Page"
{
    PageType = Card;
    layout
    {
        area(Content)
        {
            usercontrol(Editor; SourceEditor)
            {
                ApplicationArea = all;
                trigger ControlReady()
                begin
                    CurrPage.Editor.Init();
                    CurrPage.Editor.SetLanguage('json');
                    //CurrPage.Editor.LoadDocument('procedure test(a : Integer);');
                    CurrPage.Editor.LoadDocument('{ "test" : 123 }');
                end;

                trigger SaveRequested(source: Text)
                begin
                    message('The Source is %1', source);
                end;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Save)
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = all;
                Caption = 'Save';
                trigger OnAction()
                begin
                    CurrPage.Editor.RequestSave();
                end;
            }
        }
    }
}