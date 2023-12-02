page 50100 "Prompt Dialog Test"
{
    PageType = PromptDialog;
    Extensible = false;
    Caption = 'Prompt Test';
    PromptMode = Prompt;
    SourceTable = Item;
    SourceTableTemporary = true;

    layout
    {
        area(Prompt)
        {
            field(P; P)
            {
                ShowCaption = false;
                MultiLine = true;
                ApplicationArea = All;
            }
        }
        area(Content)
        {
            // field(C; C)
            // {
            //     ShowCaption = false;
            //     MultiLine = true;
            //     ApplicationArea = All;
            // }
            part(Items; "Item SubList")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                Caption = 'Do something!';
                trigger OnAction()
                begin
                    c := '42';
                    Sleep(5000);
                end;
            }
        }
    }
    var
        P: Text;
        C: Text;
}