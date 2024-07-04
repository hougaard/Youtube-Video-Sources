codeunit 50120 "Global Triggers EH"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::GlobalTriggerManagement, 'OnAfterOnGlobalInsert', '', true, true)]
    local procedure OnGlobalInsert(RecRef: RecordRef)
    begin
        message('insert');
    end;
}