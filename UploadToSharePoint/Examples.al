codeunit 50100 "SharePoint Examples"
{
    procedure UploadAFile(Ref: RecordRef; InS: InStream; FileName: Text)
    var
        Mapping: Record "Table Mapping EFQ";
        SP: Codeunit "SharePoint EFQ";
        Folder: Text;
        Token: Text;
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
        if not SP.UploadFile(Mapping, Folder, InS, FileName, true) then
            error(GetLastErrorText());
    end;

    procedure GetFiles(Ref: RecordRef)
    var
        FolderContent: Record "SharePoint File EFQ" temporary;
        Mapping: Record "Table Mapping EFQ";
        SP: Codeunit "SharePoint EFQ";
        Folder: Text;
        Token: Text;
        InS: InStream;
    begin
        // Inputs
        // ======
        // Ref = RecordRef to the record the file we should get files from

        // Let's make sure we have a valid connection active to SharePoint
        SP.GetAccessTokenAgain(Token);
        SP.StoreAccessToken(Token);
        // Find the basic mapping (subsite etc.)
        SP.GetTableMapping(Mapping, Ref.Number);
        // Find the folder for the related record
        Folder := SP.GetFolderForRecord(Ref, true);

        // This is the tricky part, GetFolderContent is separated into two calls, where step 1 is
        // completely read-only so it can be used in PageBackgroundTasks and other case where the
        // database is in read-only mode.
        if SP.GetFolderContentStepTwo(SP.GetFolderContentStepOne(Mapping, Folder), FolderContent) then begin
            if FolderContent.FindFirst() then begin // <- Here I'll just grab the first file
                SP.DownloadFile(Mapping, FolderContent, InS);
                DownloadFromStream(InS, '', '', '', FolderContent.Name);
            end;
        end;
    end;
}