codeunit 50103 "Subscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Reservation Entry", 'OnAfterCopyTrackingFromItemLedgEntry', '', true, true)]
    local procedure MyProcedure(ItemLedgerEntry: Record "Item Ledger Entry"; var ReservationEntry: Record "Reservation Entry")
    begin
        ReservationEntry.ournewfield := ItemLedgerEntry.ournewfield;
    end;
}