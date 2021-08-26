codeunit 50100 "DateFilters"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Filter Tokens", 'OnResolveDateFilterToken', '', true, true)]
    local procedure MyFilters(DateToken: Text; var FromDate: Date; var ToDate: Date; var Handled: Boolean)
    begin
        if DateToken.ToLower() = 'party' then begin
            FromDate := Today() + 10;
            ToDate := FromDate;
            Handled := true;
        end;
    end;
}