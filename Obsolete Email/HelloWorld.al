// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    procedure CalcAvgUnitCost(Item: Record Item; Location: Record Location): decimal
    var
        ILE: Record "Item Ledger Entry";
        Q: Decimal;
        Total: Decimal;
    begin
        ILE.setrange("Item No.", Item."No.");
        ILE.setrange("Location Code", Location.Code);
        ILE.setrange(Open, true);
        ILE.SetCurrentKey("Item No.", "Location Code", Open);
        if ILE.findset() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)", "Cost Amount (Expected)");
                if ILE."Cost Amount (Actual)" <> 0 then begin
                    Total += ILE."Cost Amount (Actual)" / ILE.Quantity * ILE."Remaining Quantity";
                    Q += ILE."Remaining Quantity";
                end else
                    if ILE."Cost Amount (Expected)" <> 0 then begin
                        Total += ILE."Cost Amount (Expected)" / ILE.Quantity * ILE."Remaining Quantity";
                        Q += ILE."Remaining Quantity";
                    end;
            until ILE.Next() = 0;
        if Q <> 0 then
            exit(Total / Q);
    end;

    procedure NewSendMail()
    var
        mail: Codeunit "Email Message";
        email: Codeunit Email;
        InS: InStream;
        base64: Codeunit "Base64 Convert";
    begin
        mail.Create('hello@example.com', 'The is the subject', 'here''s the body');
        mail.AddAttachment('open this.pdf', 'application/pdf', base64.ToBase64(InS));
        email.Send(mail);
    end;

    procedure sendemail()
    var
        SMTPSetup: Record "SMTP Mail Setup";
        mail: Codeunit "SMTP Mail";
        TempBlob: Codeunit "Temp Blob";
        attach1: InStream;
        addressTo: List of [Text];
        subjectTxt: Text;
    begin
        SMTPSetup.get();
        SMTPSetup.TestField("User ID");

        addressTo.Add('homey@home.com');

        addressTo.Add('demo@example.com');

        subjectTxt := 'Important message inside, please open!';
        mail.CreateMessage('CEO of Bank of Spain', SMTPSetup."User ID", addressTo, subjectTxt, '');
        mailBody(mail);


        Clear(TempBlob);
        SaveDocumentAsPDFToStream(TempBlob, 50140);
        TempBlob.CreateInStream(attach1);
        mail.AddAttachmentStream(attach1, 'a cheque for you.pdf');

        mail.Send();
    end;

    procedure mailBody(var mail: Codeunit "SMTP Mail"): Text
    begin
        mail.AppendBody('I am Santiago Sebastian, a Spanish');
        mail.AppendBody('politician/investor and former Senior');
        mail.AppendBody('Director with Bank of Spain, National Central');
        mail.AppendBody('Bank of Spain. I am interested in investing the');
        mail.AppendBody('sum of US$12.7Million in your Country or any');
        mail.AppendBody('other place in the world under your custody.');
        mail.AppendBody('Please if you are interested in this project,');
        mail.AppendBody('kindly reply me and lets move forward.');
    end;

    procedure SaveDocumentAsPDFToStream(var TempBlob: Codeunit "Temp Blob"; ReportID: integer): Boolean;
    var
        DocumentRef: RecordRef;
        VarOutStream: OutStream;
    begin
        DocumentRef.Open(18);
        TempBlob.CreateOutStream(VarOutStream);
        if Report.SaveAs(ReportID, '', ReportFormat::Pdf, VarOutStream, DocumentRef) then
            exit(true)
        else
            Error('Could not save Report: %1 as PDF attachment', ReportID);
    end;
}