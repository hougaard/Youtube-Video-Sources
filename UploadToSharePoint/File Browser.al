page 50100 "SharePoint File Browser"
{
    Caption = 'SharePoint';
    PageType = List;
    SourceTable = "SharePoint File EFQ";
    SourceTableView = sorting(Name);
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = true;
    UsageCategory = None;
    SourceTableTemporary = true;
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field(Name; DisplayName)
                {
                    Caption = 'Name';
                    ToolTip = 'Name';
                    ApplicationArea = All;
                    AssistEdit = true;
                    Editable = false;
                    Style = Ambiguous;
                    StyleExpr = Rec.Type = Rec.Type::Folder;
                    trigger OnAssistEdit()
                    var
                        Setup: Record "SharePoint Setup EFQ";
                        Handled: Boolean;
                    begin
                        if Handled then
                            exit;
                        case Rec.Type of
                            Rec.Type::File:
                                begin
                                    OnBeforeOpenSharePointFile(Rec, Handled);
                                    if Handled then
                                        exit;
                                    if Setup.GET() then
                                        Hyperlink(Setup.BaseURL + Rec.ServerRelativeUrl.Replace('#', '%23') + '?web=1');
                                end;
                            Rec.type::Folder:
                                begin
                                    if Rec.Name = '..' then begin
                                        FolderHistory.RemoveAt(FolderHistory.Count());
                                        FolderHistory.Get(FolderHistory.Count(), CurrentFolder);
                                    end else begin
                                        CurrentFolder := CurrentFolder + '/' + Rec.Name;
                                        FolderHistory.Add(CurrentFolder);
                                    end;
                                    RefreshCurrentFolder();
                                end;
                        end;
                    end;
                }
#pragma warning restore
            }
            usercontrol(Drop; Drop_EFQ)
            {
                ApplicationArea = all;

                trigger SendUpload(FileName: Text; Data: Text; Last: Boolean)
                var
                    Base64: Codeunit "Base64 Convert";
                    TempBlob: Codeunit "Temp Blob";
                    InS: InStream;
                    OutS: OutStream;
                    UploadFailedErr: Label 'Upload failed (Folder path %1)', Comment = '%1 = Path';
                    OverwriteQst: Label 'This file already exists, replace?';
                    NotEditableErr: Label 'Drop is not allowed, this SharePoint folder is not editable.';
                    Window: Dialog;
                begin
                    if not PageIsEditable then
                        Error(NotEditableErr);
                    FileName := SP.SanitizeNameNoDot(FileName);
                    Window.open('Uploading #1############################');
                    Window.update(1, FileName);
                    TempBlob.CreateOutStream(OutS);
                    Base64.FromBase64(Data, OutS);
                    TempBlob.CreateInStream(InS);
                    if Rec.Count() = 0 then
                        SP.CreateFolder('', CurrentFolder);
                    if CurrentFolder = '' then
                        Error(NotMappedLbl);
                    COMMIT();

                    Rec.Setrange(Name, FileName);
                    if Rec.FindFirst() then
                        if not confirm(OverwriteQst) then
                            exit;
                    Rec.Setrange(Name);

                    if SP.UploadFile(CurrentFolder, InS, FileName, false) then begin
                        if Last then
                            RefreshCurrentFolder();
                    end else
                        error(UploadFailedErr, CurrentFolder);
                    Window.Close();
                    if not Last then
                        CurrPage.Drop.GetNext();
                end;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Upload)
            {
                ToolTip = 'Upload a Document to this SharePoint folder';
                Caption = 'Upload Document';
                ApplicationArea = All;
                Image = MoveUp;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Enabled = PageIsEditable;
                trigger OnAction()
                var
                    InS: InStream;
                    FileName: Text;
                    UploadFailedErr: Label 'Upload failed (Folder path %1)', Comment = '%1 = Path';
                    OverwriteQst: Label 'This file already exists, replace?';
                begin
                    //GlobalRef.Modify(true);
                    if UploadIntoStream('Select File', '', '', FileName, InS) then begin
                        if Rec.Count() = 0 then
                            SP.CreateFolder('', CurrentFolder);
                        if CurrentFolder = '' then
                            Error(NotMappedLbl);
                        COMMIT();

                        Rec.Setrange(Name, FileName);
                        if Rec.FindFirst() then
                            if not confirm(OverwriteQst) then
                                exit;
                        Rec.Setrange(Name);

                        if SP.UploadFile(CurrentFolder, InS, FileName, true) then
                            RefreshCurrentFolder()
                        else
                            error(UploadFailedErr, CurrentFolder);
                    end;
                end;
            }
            action(Download)
            {
                ToolTip = 'Download the current document to your local storage';
                Caption = 'Download Document';
                ApplicationArea = All;
                Image = MoveDown;
                Scope = Repeater;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    InS: InStream;
                    ToFile: Text;
                begin
                    if CurrentFolder = '' then
                        Error(NotMappedLbl);
                    if SP.DownloadFile(Rec, InS) then begin
                        ToFile := Rec.Name;
                        DownloadFromStream(Ins, '', '', '', ToFile);
                    end;
                end;
            }
            action(Camera)
            {
                ToolTip = 'Upload a photo from the camera on your computer';
                Caption = 'Take Photo';
                ApplicationArea = All;
                Image = Camera;
                trigger OnAction()
                var
                    blob: Codeunit "Temp Blob";
                    CameraInterAction: Page Camera;
                    SaveFile: Page "Filename Dialog EFQ";
                    InS: InStream;
                    FileName: Text;
                    UploadFailedErr: Label 'Upload failed (Folder path %1)', Comment = '%1 = Path';
                    OverwriteQst: Label 'This file already exists, replace?';
                    PhotoLbl: Label 'Photo';
                begin
                    CameraInterAction.SetQuality(100);
                    CameraInterAction.SetEncodingType("Image Encoding"::JPEG);
                    CameraInterAction.SetAllowEdit(true);
                    CameraInterAction.RunModal();
                    if CameraInterAction.HasPicture() then begin
                        if Rec.Count() = 0 then
                            SP.CreateFolder('', CurrentFolder);
                        if CurrentFolder = '' then
                            Error(NotMappedLbl);
                        COMMIT();

                        CameraInterAction.GetPicture(blob);
                        blob.CreateInStream(InS);
                        SaveFile.SetFileName(PhotoLbl + ' ' + SP.SanitizeName(format(CurrentDateTime, 0, 9)) + '.jpg');
                        if SaveFile.RunModal() = Action::Yes then begin
                            FileName := sp.SanitizeNameNoDot(SaveFile.GetFileName());
                            if not FileName.ToLower().EndsWith('.jpg') then
                                FileName += '.jpg';

                            Rec.Setrange(Name, FileName);
                            if Rec.FindFirst() then
                                if not confirm(OverwriteQst) then
                                    exit;
                            Rec.Setrange(Name);

                            if SP.UploadFile(CurrentFolder, InS, FileName, true) then
                                RefreshCurrentFolder()
                            else
                                error(UploadFailedErr, CurrentFolder);
                        end;
                    end;
                end;
            }
            action(ConvertToPDF)
            {
                Caption = 'Convert Word to PDF';
                Image = SendAsPDF;
                ApplicationArea = All;
                Tooltip = 'Convert Word document to PDF';
                trigger OnAction()
                var
                    Blob: Codeunit "Temp Blob";
                    InS: InStream;
                    OutS: OutStream;
                    //ToFile: Text;
                    OnlyWordErr: Label 'Only Word Documents can be converted to PDF';
                    UploadFailedErr: Label 'Upload failed (Folder path %1)', Comment = '%1 = Path';
                begin
                    if not Rec.Name.ToLower().Contains('.docx') then
                        Error(OnlyWordErr);
                    if CurrentFolder = '' then
                        Error(NotMappedLbl);
                    if SP.DownloadFile(Rec, InS) then begin
                        Blob.CreateOutStream(OutS);
                        CopyStream(OutS, InS);
                        SP.ConvertToPDF(Blob);
                        Blob.CreateInStream(InS);
                        if SP.UploadFile(CurrentFolder, InS, Rec.Name.Replace('.docx', '.pdf'), false) then
                            RefreshCurrentFolder()
                        else
                            error(UploadFailedErr, CurrentFolder);
                    end;
                end;
            }
            action(ViewOnSharePoint)
            {
                ToolTip = 'Open this SharePoint folder in a browser window';
                Caption = 'Browse on SharePoint';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = DocInBrowser;
                trigger OnAction()
                var
                    Setup: Record "SharePoint Setup EFQ";
                    Mapping: Record "Table Mapping EFQ";
                    CreateFolderQst: Label 'No folder has been assigned yet, create it?';
                begin
                    if Rec.Count() = 0 then
                        if confirm(CreateFolderQst) then
                            SP.CreateFolder(Mapping, '', CurrentFolder)
                        else
                            exit;
                    if Setup.GET() then
                        Hyperlink(Setup.BaseURL + CurrentFolder);
                end;
            }
            action(ShareFile)
            {
                Caption = 'Share File';
                ApplicationArea = all;
                ToolTip = 'Send a filesharing link';
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Scope = Repeater;
                trigger OnAction()
                var
                    Mapping: Record "Table Mapping EFQ";
                    Ref: RecordRef;
                begin
                    Ref.GetTable(Rec);
                    SP.GetTableMapping(Mapping, Ref);
                    SP.ShareFile(Mapping, Rec);
                end;
            }
            action(Checkout)
            {
                Caption = 'Check out file';
                ToolTip = 'Check out this file on SharePoint';
                ApplicationArea = All;
                Image = StepOut;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Scope = Repeater;
                Enabled = CheckoutEnabled and (Rec.CheckedOutUserId = '');
                trigger OnAction()
                var
                    Mapping: Record "Table Mapping EFQ";
                    CheckOutQst: Label 'Check out this file on SharePoint?';
                begin
                    if confirm(CheckOutQst) then
                        SP.CheckOutFile(Mapping, Rec);
                end;
            }
            action(Checkin)
            {
                Caption = 'Check in file';
                ToolTip = 'Check in this file on SharePoint';
                ApplicationArea = All;
                Image = StepOut;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Scope = Repeater;
                Enabled = CheckoutEnabled and (Rec.CheckedOutUserId <> '');
                trigger OnAction()
                var
                    Mapping: Record "Table Mapping EFQ";
                    CheckOutQst: Label 'Check out this file on SharePoint?';
                begin
                    if confirm(CheckOutQst) then
                        SP.CheckInFile(Mapping, Rec);
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        Setup: Record "SharePoint Setup EFQ";
        DocuSetup: Record "DocuSign Setup EFQ";
        AdobeSetup: Record "Adobe Setup EFQ";
        SPDataScope: DataScope;
        Token: Text;
    begin
        if GuiAllowed then
            if Setup.GET() then begin
                CheckoutEnabled := Setup.CheckInOut;
                if Setup.SeparateTokenPerCompany then
                    SPDataScope := SPDataScope::Company
                else
                    SPDataScope := SPDataScope::Module;
                if Setup.AuthenticationMethod <> Setup.AuthenticationMethod::Certificate then begin
                    if not IsolatedStorage.Contains(SP.GetOauthTokenString(), SPDataScope) then
                        if Setup.AuthenticationMethod = Setup.AuthenticationMethod::Personal then
                            if not IsolatedStorage.Contains(SP.GetRefreshTokenString() + UserId(), SPDataScope) then
                                page.runmodal(page::"SharePoint Connect EFQ");
                end else
                    if not IsolatedStorage.Contains(SP.GetOauthTokenString(), SPDataScope) then
                        SP.GetAccessTokenAgain(Token);

                if not SP.VerifyAccess() then
                    page.runmodal(page::"SharePoint Connect EFQ");
            end;
        If DocuSetup.get() then
            if DocuSetup."DocuSign Activated" then
                EsignVisible := true;
        if AdobeSetup.Get() then
            if AdobeSetup."Adobe Sign Active" then
                EsignVisible := true;
        CurrentFolder := Setup.GetBaseFolder();
        FolderHistory.Add(CurrentFolder);
        RefreshCurrentFolder();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        CategoryStyle := '';
        DisplayName := Rec.Name;
        if Rec.CheckedOutUserId <> '' then
            DisplayName += ' ✅';
    end;

    trigger OnAfterGetRecord()
    begin
        CategoryStyle := '';
        DisplayName := Rec.Name;
        if Rec.CheckedOutUserId <> '' then
            DisplayName += ' ✅';
    end;

    trigger OnDeleteRecord(): Boolean
    var
        Details: Record "SharePoint File Details EFQ";
        NotEditableErr: Label 'Drop is not allowed, this SharePoint folder is not editable.';
    begin
        if not PageIsEditable then
            error(NotEditableErr);
        SP.RecycleFile(Rec);
        RefreshCurrentFolder();
        Details.setrange(SharePointFileUrl, Rec.ServerRelativeUrl);
        details.DeleteAll();
        exit(true);
    end;

    procedure RefreshCurrentFolder()
    var
        Mapping: Record "Table Mapping EFQ";
        ResultTxt: Text;
    begin
        Rec.DELETEALL();
        CurrPage.Update(false);
        if FolderHistory.Count() > 1 then begin
            Clear(Rec);
            Rec.SetCurrentKey(Name);
            Rec.INIT();
            Rec.Name := '..';
            Rec.Type := Rec.Type::Folder;
            Rec.UniqueId := '00000000-0000-0000-0000-000000000000';
            Rec.INSERT();
        end;

        ResultTxt := SP.GetFolderContentStepOne(Mapping, CurrentFolder);
        if ResultTxt <> '' then
            SP.GetFolderContentStepTwoEx(Mapping, ResultTxt, Rec);
        CurrPage.Update(false);
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        FinishFill(Results);
    end;

    procedure PrepareFill(Ref: RecordRef): Text
    var
        Setup: Record "SharePoint Setup EFQ";
    begin
        Rec.DELETEALL();
        CurrPage.Update(false);


        Setup.Get();
        CurrentFolder := Setup.GetBaseFolder();
        if CurrentFolder <> '' then begin
            clear(FolderHistory);
            FolderHistory.Add(CurrentFolder);
            exit(CurrentFolder);
        end;
    end;

    procedure FinishFill(Results: Dictionary of [Text, Text])
    var
        Mapping: Record "Table Mapping EFQ";
        Data: Text;
    begin
        if Results.Get('data', data) then
            if data <> '' then
                SP.GetFolderContentStepTwoEx(Mapping, data, Rec);
        PageTaskId := 0;
        Rec.SetCurrentKey(Name);
        CurrPage.Update(false);
    end;

    procedure FillError(ErrorText: Text)
    begin
        Rec.INIT();
        Rec.Name := copystr(ErrorText, 1, maxstrlen(Rec.Name));
        Rec.INSERT();
        PageTaskId := 0;
        CurrPage.Update(false);
    end;

    trigger OnInit()
    begin
        PageIsEditable := true;
    end;

    procedure SetEditable(_PageIsEditable: Boolean)
    begin
        PageIsEditable := _PageIsEditable;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOpenSharePointFile(var Rec: Record "SharePoint File EFQ" temporary; var Handled: Boolean)
    begin
    end;

    var
        SP: Codeunit "SharePoint EFQ";
        CheckoutEnabled: Boolean;
        PageTaskId: Integer;
        CurrentFolder: Text;
        DisplayName: Text;
        FolderHistory: List of [Text];
        NotMappedLbl: Label 'The entity is not complete, cannot map a folder.';
        EsignVisible: Boolean;
        PageIsEditable: Boolean;
        CategoryStyle: Text;
}