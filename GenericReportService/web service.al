codeunit 50144 "Report Web Service"
{
    procedure RunReport(ReportNo: Integer; Parameters: Text): Text
    var
        OutS: OutStream;
        InS: InStream;
        TempBlob: Codeunit "Temp Blob";
        Base64: Codeunit "Base64 Convert";
    begin
        TempBlob.CreateOutStream(OutS);
        Report.SaveAs(ReportNo, Parameters, ReportFormat::Pdf, OutS);
        TempBlob.CreateInStream(InS);
        exit(Base64.ToBase64(InS));
    end;

    procedure RunReportAsExcel(ReportNo: Integer; Parameters: Text): Text
    var
        OutS: OutStream;
        InS: InStream;
        TempBlob: Codeunit "Temp Blob";
        Base64: Codeunit "Base64 Convert";
    begin
        TempBlob.CreateOutStream(OutS);
        Report.SaveAs(ReportNo, Parameters, ReportFormat::Excel, OutS);
        TempBlob.CreateInStream(InS);
        exit(Base64.ToBase64(InS));
    end;

}