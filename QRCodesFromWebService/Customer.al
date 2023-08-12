tableextension 50100 "QR Codes" extends Item
{
    fields
    {
        field(50100; QRCode; Blob)
        {
            Caption = 'QR Code';
            Subtype = Bitmap;
        }
    }
}

pageextension 50101 "QR Code" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(QRCode; Rec.QRCode)
            {
                ApplicationArea = all;
            }
            field(GenerateQR; GenerateQR)
            {
                ApplicationArea = all;
                ShowCaption = false;
                Trigger OnDrillDown()
                var
                    Client: HttpClient;
                    Response: HttpResponseMessage;
                    URL: Text;
                    InS: InStream;
                    OutS: OutStream;
                begin
                    URL := 'http://api.qrserver.com/v1/create-qr-code/?data=' + Rec."No." + '!&size=200x200';
                    if Client.get(URL, Response) then begin
                        if Response.IsSuccessStatusCode() then begin
                            Response.Content().ReadAs(InS);
                            Rec.QRCode.CreateOutStream(OutS);
                            CopyStream(OutS, InS);
                            Rec.Modify();
                        end;
                    end;
                end;
            }
        }
    }
    var
        GenerateQR: Label 'Generate QR Code';
}