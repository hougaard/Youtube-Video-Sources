page 59100 "Blob Test Page"
{
    PageType = Card;
    SourceTable = "Blob Demo";
    layout
    {
        area(Content)
        {
            field(PKEY; Rec.PKEY)
            {
                ApplicationArea = All;
            }
            field(B; Rec.BLOB)
            {
                ApplicationArea = all;

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Import)
            {
                Caption = 'Import';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    InS: InStream;
                    OutS: OutStream;
                    FileName: Text;
                begin
                    if UploadIntoStream('Select file', '', '', FileName, InS) then begin
                        TempBlob.CreateOutStream(OutS);
                        CopyStream(OutS, InS);

                        // The universe does something different!

                        Rec.CalcFields(BLOB);
                        Rec.BLOB.CreateOutStream(OutS);
                        TempBlob.CreateInStream(InS);
                        CopyStream(OutS, InS);
                    end;
                end;
            }
            action(Import2)
            {
                Caption = 'Import into Persistent';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    InS: InStream;
                    OutS: OutStream;
                    FileName: Text;
                    PNo: BigInteger;
                begin
                    if UploadIntoStream('Select file', '', '', FileName, InS) then begin
                        PNo := Persistent.Create();
                        Persistent.CopyFromInStream(Pno, InS);
                        Message('P Number = %1', PNo);
                    end;
                end;
            }
            action(Import3)
            {
                Caption = 'From Persistent';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    OutS: OutStream;
                begin
                    Rec.CalcFields(BLOB);
                    Rec.BLOB.CreateOutStream(OutS);
                    Persistent.CopyToOutStream(1, OutS);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if Rec.isempty then
            Rec.insert();
    end;

    var
        TempBlob: Codeunit "Temp Blob";
        TempBlob2: Codeunit "Temp Blob List";
        BLobList: Codeunit "Temp Blob List";
        Persistent: Codeunit "Persistent Blob";
}