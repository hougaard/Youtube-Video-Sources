pageextension 50147 "Customer List Email" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(SendMail)
            {
                Caption = 'Send Mail';
                ApplicationArea = all;
                trigger OnAction()
                var
                    OutS: OutStream;
                    InS: InStream;
                    B: Codeunit "Temp Blob";
                    Ref: RecordRef;
                    FRef: FieldRef;
                    Mail: Codeunit "SMTP Mail";
                    Recipients: List of [Text];
                    Body: Text;
                begin
                    B.CreateOutStream(OutS);
                    Ref.OPEN(DATABASE::Customer);
                    Fref := Ref.Field(1);
                    Fref.Setrange(Rec."No.");
                    Report.SaveAs(50147, '', ReportFormat::Html, OutS, Ref);
                    B.CreateInStream(InS);
                    InS.ReadText(Body);
                    Body := Body.Replace('%%%%HOMEPAGE%%%%', '<a href="https://' + rec."Home Page" + '">Homepage</a>');
                    Recipients.add('erik@hougaard.com');
                    Mail.CreateMessage('Erik Hoguaard', 'erik@hougaard.com', Recipients, 'Mail from BC', Body, true);
                    Mail.Send();
                end;
            }
        }
    }
}