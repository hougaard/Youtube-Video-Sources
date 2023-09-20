codeunit 50112 "Event Recorder Demo"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', true, true)]
    local procedure OnBeforeReleaseSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    begin
        if PreviewMode then
            exit;
        if Date2DWY(SalesHeader."Posting Date", 1) = 7 then
            error('No posting dates on a Sunday!');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeOnRun', '', true, true)]
    local procedure MyProcedure()
    begin
    end;
}