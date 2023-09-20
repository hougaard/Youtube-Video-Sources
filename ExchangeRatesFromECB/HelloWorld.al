pageextension 50100 CurExtend extends Currencies
{
    actions
    {
        addfirst(processing)
        {
            action(Import)
            {
                Caption = 'Import from ECB';
                ApplicationArea = all;

                trigger OnAction()
                var
                    HttpClient: HttpClient;
                    Response: HttpResponseMessage;
                    InS: InStream;
                    OutS: OutStream;
                    CSVStream: InStream;
                    TmpBlob: Codeunit "Temp Blob";
                    Zip: Codeunit "Data Compression";
                    FileList: List of [Text];
                    LengthOfCsv: Integer;
                    CSV: Record "CSV Buffer" temporary;
                    Col: Integer;
                    Line: Integer;
                    CurCode: Code[10];
                    CurRec: Record Currency;
                    ExtRec: Record "Currency Exchange Rate";
                begin
                    // https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist.zip
                    HttpClient.Get('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist.zip', Response);
                    if Response.IsSuccessStatusCode() then begin
                        Response.Content.ReadAs(InS);
                        Zip.OpenZipArchive(InS, false);
                        Zip.GetEntryList(FileList);
                        //Message('Found %1', FileList.Get(1));
                        TmpBlob.CreateOutStream(OutS);
                        Zip.ExtractEntry(FileList.Get(1), OutS, LengthOfCsv);
                        TmpBlob.CreateInStream(CSVStream);
                        CSV.LoadDataFromStream(CSVStream, ',');
                        for Col := 2 to CSV.GetNumberOfColumns() do begin
                            CSV.Get(1, Col);
                            CurCode := CSV.Value;
                            if CurCode <> '' then begin
                                if not CurRec.Get(CurCode) then begin
                                    CurRec.Init();
                                    CurRec.Code := CurCode;
                                    CurRec.Description := CurCode;
                                    CurRec.Insert(true);
                                end;
                                for Line := 2 to CSv.GetNumberOfLines() do begin
                                    ExtRec.Init();
                                    ExtRec."Currency Code" := CurRec.Code;
                                    CSV.Get(Line, 1);
                                    evaluate(ExtRec."Starting Date", CSV.Value, 9);
                                    ExtRec.Validate("Exchange Rate Amount", 1);
                                    CSV.Get(Line, Col);
                                    if evaluate(ExtRec."Relational Exch. Rate Amount", CSV.Value, 9) then begin
                                        ExtRec.Validate("Relational Exch. Rate Amount");
                                        ExtRec.Insert(true);
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            }
        }
    }
}