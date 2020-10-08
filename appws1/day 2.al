codeunit 56100 "Workshop events"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnPostSalesLineOnBeforeInsertShipmentLine', '', true, true)]
    local procedure MyProcedure(var IsHandled: Boolean; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line")
    var
        Setup: Record "A proper Table";
    begin
        if Setup.Get() then begin
            // some one!
        end else
    end;
}