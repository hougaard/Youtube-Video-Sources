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

    procedure CreateFolderAndAutoFolders(Ref: RecordRef)
    var
        Mapping: Record "Table Mapping EFQ";
        SP: Codeunit "SharePoint EFQ";
        Folder: Text;
        Token: Text;
    begin
        // Inputs
        // ======
        // Ref = RecordRef to the record the file should be uploaded to

        // Let's make sure we have a valid connection active to SharePoint
        SP.GetAccessTokenAgain(Token);
        SP.StoreAccessToken(Token);
        // Find the basic mapping (subsite etc.)
        SP.GetTableMapping(Mapping, Ref.Number);
        // Find the folder for the related record
        Folder := SP.GetFolderForRecord(Ref, true); // true=create the folder

        // Create subfolder is subfolders are defined for this table
        SP.CreateSubfolders(Mapping, Ref.Number(), Folder);
    end;

    procedure HasFiles(Ref: RecordRef): Boolean
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

        // Let's make sure we have a valid connection active to SharePoint - This should be outside the main loop, no reason to get authentication for each record, too slow
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
                exit(true);
            end;
        end;
    end;

    procedure GenerateFile(Ref: RecordRef)
    var
        Mapping: Record "Table Mapping EFQ";
        Template: Record "Document Template EFQ";
        SP: Codeunit "SharePoint EFQ";
        Folder: Text;
        Token: Text;
        NewFileName: Text;
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

        // Get the SharePoint Document Template for the Customer Order Summary (Report No. 107)
        Template.Get(18, 107, '');

        NewFileName := SP.GenerateDocument(Template, Ref, Folder, 'new filename.pdf');
        if NewFileName <> '' then
            SP.FilloutCustomColumns(Mapping, Folder, NewFileName, Ref)
        else
            error('The report did not produce any output');
    end;
}