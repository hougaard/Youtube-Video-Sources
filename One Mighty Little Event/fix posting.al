codeunit 50129 "Make sure all is posted"
{
    [EventSubscriber(ObjectType::Table, Database::"Invoice Post. Buffer", 'OnAfterInvPostBufferPrepareSales', '', true, true)]
    local procedure MyProcedure(var SalesLine: Record "Sales Line"; var InvoicePostBuffer: Record "Invoice Post. Buffer")
    begin
        InvoicePostBuffer."Additional Grouping Identifier" := format(SalesLine."Line No.", 0, 2);
    end;
}