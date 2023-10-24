codeunit 50100 "Send Invoices as Emails"
{
    procedure SendInvoicesAsEmails()
    var
        PSH: Record "Sales Invoice Header";
        PSH2: Record "Sales Invoice Header";
        OutS: OutStream;
        InS: InStream;
        TempBlob: Codeunit "Temp Blob";
        Ref: RecordRef;
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
        Base64: Codeunit "Base64 Convert";
    begin
        PSH.Setrange("No. Printed", 0);

        if PSH.FindSet() then
            repeat
                PSH2 := PSH;
                PSH2.Setrange("No.", PSH."No.");
                Ref.GetTable(PSH2);
                TempBlob.CreateOutStream(OutS);
                if Report.SaveAs(Report::"Sales Invoice NA", '', ReportFormat::Pdf, OutS, Ref) then begin
                    TempBlob.CreateInStream(InS);
                    EmailMsg.Create(PSH."Sell-to E-Mail", 'Your Invoice', 'Here you go!');
                    EmailMsg.AddAttachment('Invoice ' + PSH."No." + '.pdf', 'application/pdf', Base64.ToBase64(InS));
                    Email.Send(EmailMsg, "Email Scenario"::"Sales Invoice");
                end;
            until PSH.Next() = 0;
    end;
}