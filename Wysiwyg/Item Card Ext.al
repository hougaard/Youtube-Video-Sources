pageextension 52100 "Youtube Item Card" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            usercontrol(EditCtl; Wysiwyg)
            {
                ApplicationArea = all;
                trigger ControlReady()
                begin
                    CurrPage.EditCtl.Init();
                end;

                trigger OnAfterInit()
                begin
                    EditorReady := true;
                    if "Item Description" <> '' then
                        CurrPage.EditCtl.Load("Item Description")
                    else
                        CurrPage.EditCtl.Load(Rec.Description);
                    CurrPage.EditCtl.SetReadOnly(not CurrPage.Editable);
                end;

                trigger ContentChanged()
                begin
                    CurrPage.EditCtl.RequestSave();
                end;

                trigger SaveRequested(data: Text)
                begin
                    "Item Description" := Data;
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if EditorReady then begin
            EditorReady := false;
            CurrPage.EditCtl.Init();
        end;
    end;

    var
        EditorReady: Boolean;
}