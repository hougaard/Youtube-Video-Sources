pageextension 50200 "download" extends "Customer List"
{
    layout
    {
        addlast(content)
        {
            usercontrol(down; downloader)
            {
                ApplicationArea = all;
                trigger downloadtrigger()
                begin
                    FileName := 'data2.dat';
                    TmpBlob.CreateInStream(InS);
                    DownloadFromStream(InS, '', '', '', FileName);
                end;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(Download)
            {
                Caption = 'Download';
                ApplicationArea = all;
                trigger OnAction()
                begin
                    TmpBlob.CreateOutStream(OutS);
                    OutS.WriteText('Hello Mom, I''m writing to a blob!');
                    TmpBlob.CreateInStream(InS);
                    FileName := 'data1.dat';
                    CurrPage.down.download();
                    Sleep(1000);
                    DownloadFromStream(InS, '', '', '', FileName);
                end;
            }
        }
    }
    var
        TmpBlob: Codeunit "Temp Blob";
        InS: InStream;
        OutS: OutStream;
        FileName: Text;

}