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
                Ref: RecordRef;
            begin
                Ref.GetTable(Item);
                SP.GetFolderForRecord(Ref, true);
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
