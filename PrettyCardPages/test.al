codeunit 50100 "Test"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeGetFullDocTypeTxt', '', true,true)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header";var FullDocTypeTxt: Text;var IsHandled: Boolean)
    begin
        
    end;
}