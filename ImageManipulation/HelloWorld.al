pageextension 56100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(OmageToImages)
            {
                Caption = 'Image stuff';
                ApplicationArea = all;
                trigger OnAction()
                var
                    Image: Codeunit Image;
                    InS: InStream;
                    FileName: Text;
                    TmpBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                begin
                    if UploadIntoStream('Upload Image', '', '', FileName, InS) then begin
                        Image.FromStream(InS);
                        // message('Type %1\Height %2\Width %3\RotateFlipType %4', Image.GetFormat(), Image.GetHeight(), Image.GetWidth(),
                        //         Image.GetRotateFlipType());
                        //Image.Crop(50, 50, Image.GetWidth() - 100, Image.GetHeight() - 100);
                        //Image.Resize(round(Image.GetWidth() * 1.5, 1), round(Image.GetHeight() * 0.8, 1));
                        Image.RotateFlip("Rotate Flip Type"::Rotate270FlipX);
                        TmpBlob.CreateOutStream(OutS);
                        Image.SetFormat("Image Format"::Gif);
                        Image.Save(OutS);
                        TmpBlob.CreateInStream(InS);
                        FileName := FileName.Replace('.', '2.');
                        FileName := FileName.Replace('.jpg', '.gif');
                        Image.
                        DownloadFromStream(InS, '', '', '', FileName);
                    end;
                end;
            }
        }
    }
}