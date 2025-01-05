codeunit 50100 "Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', true, true)]
    local procedure SetPostingDescription(var SalesHeader: Record "Sales Header")
    var
        SL: Record "Sales Line";
    begin
        SL.Setrange("Document Type", SalesHeader."Document Type");
        SL.Setrange("Document No.", SalesHeader."No.");
        SL.Setrange(Type, SL.Type::Item);
        if SL.FindFirst() then begin
            SalesHeader."Posting Description" := SL.Description;
        end;
    end;
}