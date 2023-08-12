// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        TheMessage : Codeunit "Email Message";
        Email : Codeunit Email;
        base64 : Codeunit "Base64 Convert";
        InS: InStream;
    begin
        TheMessage.Create('erik@hougaard.com','Hello Friend', 'This is the body');
        TheMessage.AddAttachment('myfile.zip','application/zip',base64.ToBase64(InS));
        Email.Send(TheMessage);
    end;
}