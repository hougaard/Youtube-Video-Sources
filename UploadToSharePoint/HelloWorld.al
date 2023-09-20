// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Mapping: Record "Table Mapping EFQ";
        SP: Codeunit "SharePoint EFQ";
        Folder: Text;
        Token: Text;

        FileName: Text;
        Ref: RecordRef;
        InS: InStream;
    begin

        // Inputs
        // ======
        // Ref = RecordRef to the record the file should be uploaded to
        // InS = InStream to the content of the file
        // FileName = Name for the file

        // Let's make sure we have a valid connection active to SharePoint
        SP.GetAccessTokenAgain(Token);
        SP.StoreAccessToken(Token);
        // Find the basic mapping (subsite etc.)
        SP.GetTableMapping(Mapping, Ref.Number);
        // Find the folder for the related record
        Folder := SP.GetFolderForRecord(Ref, true);
        // Upload the file
        SP.UploadFile(Mapping, Folder, InS, FileName, true);
    end;
}