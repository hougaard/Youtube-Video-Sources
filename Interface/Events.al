codeunit 50101 "Wire up Codeunit"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Cloud Replicator Engine EFQ", 'OnSelectingCustomDestination', '', true, true)]
    local procedure SelectingCustomDestination(TableMap: Record "Replicator Table Mapping EFQ"; var Destination: Interface DataProviderEFQ; var Handled: Boolean)
    var
        MongoDB: Codeunit MongoDB;
    begin
        if TableMap.Destination = TableMap.Destination::MongoDB then begin
            Destination := MongoDB;
            Handled := true;
        end;
    end;
}