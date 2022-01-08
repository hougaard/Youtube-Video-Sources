codeunit 50144 "Sale Management stuff"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', true, true)]
    local procedure ReleaseSalesDoc(var IsHandled: Boolean; var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        CutOffDate: Date;
    begin
        CutOffDate := CalcDate('14D', Today());
        if SalesHeader."Requested Delivery Date" < CutOffDate then
            error('There''s a global pandemic, we cannot deliver that soon!');
    end;
}