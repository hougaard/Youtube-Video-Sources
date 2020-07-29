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
                var
                    InS: InStream;
                    Txt: Text;
                begin
                    EditorReady := true;
                    CalcFields("Description Blob");
                    "Description Blob".CreateInStream(InS);
                    InS.ReadText(Txt);
                    CurrPage.EditCtl.Load(Txt);
                    CurrPage.EditCtl.SetReadOnly(not CurrPage.Editable);
                end;

                trigger ContentChanged()
                begin
                    CurrPage.EditCtl.RequestSave();
                end;

                trigger SaveRequested(data: Text)
                var
                    OutS: OutStream;
                begin
                    CalcFields("Description Blob");
                    "Description Blob".CreateOutStream(OutS);
                    OutS.WriteText(data);
                end;
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action(ImportTxt)
            {
                Caption = 'Import Text';
                ApplicationArea = all;
                trigger OnAction()
                var
                    FileName: Text;
                    InS: InStream;
                    OutS: OutStream;
                begin
                    if UploadIntoStream('', '', '', FileName, InS) then begin
                        CalcFields("Description Blob");
                        "Description Blob".CreateOutStream(OutS);
                        CopyStream(OutS, Ins);
                        Modify(true);
                        CurrPage.EditCtl.Init();
                    end;
                end;
            }
            action(ExportTxt)
            {
                Caption = 'Export Text';
                ApplicationArea = all;
                trigger OnAction()
                var
                    InS: InStream;
                    FileName: Text;
                begin
                    CalcFields("Description Blob");
                    "Description Blob".CreateInStream(InS);
                    FileName := Rec.Description + '.html';
                    DownloadFromStream(InS, '', '', '', FileName);
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