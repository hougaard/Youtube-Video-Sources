page 58400 "Test Base64"
{
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = all;
    SourceTable = "base64 Blob Demo";
    layout
    {
        area(Content)
        {
            field(PKEY; Rec.PKEY)
            {
                ApplicationArea = all;
            }
            field(b64txt; Rec.base64)
            {
                Caption = 'Base64 string';
                ApplicationArea = all;
                trigger OnValidate()
                var
                    convert: Codeunit "Base64 Convert";
                    OutS: OutStream;
                    InS: InStream;
                begin
                    Rec.BLOB.CreateOutStream(OutS);
                    convert.FromBase64(Rec.base64, OutS);
                    Rec.CalcFields(Blob);
                    Rec.Blob.CreateInStream(InS);
                    CurrPage.HTML.AddImage(convert.ToBase64(InS));
                end;
            }
            usercontrol(HTML; HTML)
            {
                ApplicationArea = all;
            }
            field(BLOB; Rec.BLOB)
            {
                ApplicationArea = all;
            }
        }
    }
    procedure LoadImage(b64txt: Text)
    var
        convert: Codeunit "Base64 Convert";
        OutS: OutStream;
    begin
        Rec.BLOB.CreateOutStream(OutS);
        convert.FromBase64(Rec.base64, OutS);

    end;
}