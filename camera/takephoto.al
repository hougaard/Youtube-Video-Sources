page 50108 "take photo"
{
    SourceTable = photo;
    PageType = Card;
    layout
    {
        area(Content)
        {

            field(P; Rec.P)
            {
                ToolTip = 'Specifies the value of the P field.';
                ApplicationArea = All;
            }
            field(Picture; Rec.Picture)
            {
                ToolTip = 'Specifies the value of the Picture field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(test)
            {
                caption = 'Clicky Codeunit';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Camera: Codeunit Camera;
                    InS: InStream;
                    OutS: OutStream;
                    FileName: Text;
                begin
                    if Camera.IsAvailable() then begin
                        if Camera.GetPicture(InS, FileName) then begin
                            Rec.Picture.CreateOutStream(OutS);
                            CopyStream(OutS, InS);
                            Rec.Modify();
                        end;
                    end;
                end;
            }
            action(test2)
            {
                caption = 'Clicky';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Camera: Page Camera;
                    InS: InStream;
                    OutS: OutStream;
                    FileName: Text;
                begin
                    if Camera.IsAvailable() then begin
                        Camera.SetAllowEdit(true);
                        Camera.SetEncodingType("IMage Encoding"::PNG);
                        Camera.SetQuality(10);
                        Camera.RunModal();
                        if Camera.HasPicture() then begin
                            Camera.GetPicture(InS);
                            Rec.Picture.CreateOutStream(OutS);
                            CopyStream(OutS, InS);
                            Rec.Modify();
                        end;
                    end;
                end;
            }
        }
    }
}