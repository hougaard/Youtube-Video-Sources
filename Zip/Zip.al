// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50139 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(ZIP)
            {
                Caption = 'Get Documents in Zip';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    CLE: Record "Cust. Ledger Entry";
                    Zip: Codeunit "Data Compression";
                    OutS: OutStream;
                    InS: InStream;
                    FileName: Text;
                    TempBlob: Codeunit "Temp Blob";
                begin
                    Zip.CreateZipArchive();
                    CLE.Setrange("Customer No.", Rec."No.");
                    if CLE.FindSet(False) then
                        repeat
                            AddSingleDocument(CLE, Zip);
                        until CLE.Next() = 0;
                    TempBlob.CreateOutStream(OutS);
                    Zip.SaveZipArchive(OutS);
                    TempBlob.CreateInStream(InS);
                    FileName := Rec.Name + ' data.zip';
                    DownloadFromStream(InS, '', '', '', FileName);
                end;

            }
        }
    }
    procedure AddSingleDocument(CLE: Record "Cust. Ledger Entry"; var Zip: Codeunit "Data Compression")
    var
        ReportSelection: Record "Report Selections";
        SalesInv: Record "Sales Invoice Header";
        SalesCr: Record "Sales Cr.Memo Header";
        Ref: RecordRef;
        OutS: OutStream;
        InS: InStream;
        TempBlob: Codeunit "Temp Blob";
        FileName: Text;
    begin
        TempBlob.CreateOutStream(OutS);
        case CLE."Document Type" of
            CLE."Document Type"::Invoice:
                begin
                    ReportSelection.Setrange(Usage, ReportSelection.Usage::"S.Invoice");
                    ReportSelection.Setfilter("Report ID", '<>0');
                    ReportSelection.FindFirst();

                    SalesInv.setrange("No.", CLE."Document No.");
                    Ref.OPEN(DATABASE::"Sales Invoice Header");
                    Ref.GetTable(SalesInv);

                    REPORT.SaveAs(ReportSelection."Report ID", '', ReportFormat::Pdf, OutS, Ref);
                end;
            CLE."Document Type"::"Credit Memo":
                begin
                    ReportSelection.Setrange(Usage, ReportSelection.Usage::"S.Cr.Memo");
                    ReportSelection.Setfilter("Report ID", '<>0');
                    ReportSelection.FindFirst();

                    SalesCr.setrange("No.", CLE."Document No.");
                    Ref.OPEN(DATABASE::"Sales Cr.Memo Header");
                    Ref.GetTable(SalesCr);

                    REPORT.SaveAs(ReportSelection."Report ID", '', ReportFormat::Pdf, OutS, Ref);
                end;
            CLE."Document Type"::Payment:
                begin
                    CLE.Setrange("Entry No.", CLE."Entry No.");
                    Ref.OPEN(DATABASE::"Cust. Ledger Entry");
                    Ref.GetTable(CLE);
                    REPORT.SaveAs(REPORT::"Customer - Payment Receipt", '', ReportFormat::PDF, OutS, Ref);
                end;
            else
                exit;
        end;
        TempBlob.CreateInStream(InS);
        FileName := format(CLE."Document Type") + ' ' + CLE."Document No." + '.pdf';
        Zip.AddEntry(InS, FileName);
    end;
}