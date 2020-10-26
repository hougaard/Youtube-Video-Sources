// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        SP: Codeunit "SharePoint EFQ";
        InS: InStream;
        FileName: Text;
    begin
        SP.UploadFile('/shared documents/folder/', Ins, Filename);
    end;
}