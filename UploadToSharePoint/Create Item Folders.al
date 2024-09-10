report 50100 "Create Item Folders"
{
    ApplicationArea = All;
    Caption = 'Create Item Folders';
    UsageCategory = Tasks;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Inventory Posting Group";
            trigger OnAfterGetRecord()
            var
                Mapping: Record "Table Mapping EFQ";
                Ref: RecordRef;
                Folder: Text;
            begin
                Ref.GetTable(Item);

                // Create the main folder
                Folder := SP.GetFolderForRecord(Ref, true);

                // Create Sub Folders is any.
                SP.GetTableMapping(Mapping, DATABASE::Item);
                SP.CreateSubfolders(Mapping, DATABASE::Item, Folder);
            end;

            trigger OnPreDataItem()
            begin
                SP.VerifyAccess();
            end;
        }
    }
    var
        SP: Codeunit "SharePoint EFQ";
}
