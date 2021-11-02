// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50133 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Image)
            {
                Caption = 'Test Stuff Image';
                ApplicationArea = all;
                PromotedIsBig = true;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Img: Codeunit Image;
                    InS: InStream;
                    OutS: OutStream;
                    B: Codeunit "Temp Blob";
                    FileName: Text;
                begin
                    if UploadIntoStream('Upload Image', '', '', FileName, Ins) then begin
                        Img.FromStream(InS);
                        message('Image Info: %1 x %2 - format is %3', Img.GetWidth(), Img.GetHeight(), Img.GetFormat());
                        Img.Crop(100, 100, 100, 100);
                        B.CreateOutStream(OutS);
                        Img.Save(OutS);
                        B.CreateInStream(InS);
                        FileName := 'crop_' + FileName;
                        DownloadFromStream(Ins, '', '', '', FileName);
                    end;
                end;
            }
        }
    }
    procedure DoSomething(var I: Codeunit Image)
    begin

    end;
}