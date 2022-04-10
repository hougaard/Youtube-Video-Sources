page 50104 "Blob Table View"
{
    Caption = 'Blob Table View';
    PageType = Card;
    SourceTable = "Blob Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(PK; Rec.PK)
                {
                    ToolTip = 'Specifies the value of the PK field.';
                    ApplicationArea = All;
                }
                field("Blob"; Rec."Blob")
                {
                    ToolTip = 'Specifies the value of the Blob field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreateJson)
            {
                Caption = 'Create Json';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Base64: Codeunit "Base64 Convert";
                    TmpBlob: Codeunit "Temp Blob";
                    J: JsonObject;
                    InS: InStream;
                    OutS: OutStream;

                    FileName: Text;
                    JsonTxt: Text;
                    BlobJsonBase64: text;
                    // A: JsonArray;
                    // V : JsonValue;
                    T: JsonToken;
                begin
                    // Blob -> Json
                    J.Add('PK', Rec.PK);
                    Rec.CalcFields(Blob);
                    Rec.Blob.CreateInStream(InS);
                    J.Add('Blob', Base64.ToBase64(InS));
                    TmpBlob.CreateOutStream(OutS);
                    OutS.Write(format(J));
                    TmpBlob.CreateInStream(InS);
                    FileName := 'download.json';
                    //DownloadFromStream(InS, '', '', '', FileName);

                    // Json->Blob
                    InS.Read(JsonTxt);
                    J.ReadFrom(JsonTxt);
                    J.Get('Blob', T);
                    if T.IsValue() then
                        BlobJsonBase64 := T.AsValue().AsText();
                    Rec.Blob.CreateOutStream(OutS);
                    Base64.FromBase64(BlobJsonBase64, OutS);
                    Rec.Modify();
                end;
            }
        }
    }
}
