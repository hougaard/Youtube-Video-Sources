// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ReportAsEmailBody;

using Microsoft.Sales.Customer;
using System.Email;
using System.Utilities;
using Microsoft.Sales.History;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Email: Codeunit Email;
        EmailMsg: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        PostedSalesInvoiceHeader: Record "Sales Invoice Header";
        Body: Text;
        OutS: OutStream;
        InS: InStream;
        Ref: RecordRef;
    begin
        PostedSalesInvoiceHeader.FindLast();
        PostedSalesInvoiceHeader.Setrange("No.", PostedSalesInvoiceHeader."No.");
        Ref.GetTable(PostedSalesInvoiceHeader);
        TempBlob.CreateOutStream(OutS);
        Report.SaveAs(Report::"Standard Sales - Invoice", '', ReportFormat::Html, OutS, Ref);
        TempBlob.CreateInStream(InS);
        InS.ReadText(Body);
        EmailMsg.Create('demo@hougaard.com', 'Invoice from ' + CompanyName(), Body, true);
        Email.Send(EmailMsg, "Email Scenario"::"Sales Invoice");
    end;
}