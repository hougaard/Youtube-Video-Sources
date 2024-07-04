report 50100 "Print PDF"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    DefaultLayout = Word;
    WordLayout = 'bait.docx';

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = const(17));
            column(Number; Number) { }
        }
    }
    trigger OnPreReport()
    var
        PrintPDF: Codeunit "Print PDF";
    begin
        if UploadIntoStream('', InS) then
            PrintPDF.PDFToPrint(InS);
    end;

    var
        InS: InStream;
}