codeunit 72100 "Subscription Mgt Focus"
{
    procedure CalcQty(var SL: Record "Sales Line")
    var
        Setup: Record "Software Inc Setup";
        Item: Record Item;
    begin
        if setup.get() then begin
            if setup."Subscription Customization" then begin
                if SL.Type = SL.Type::Item then
                    if Item.GET(SL."No.") then
                        if item."Subscription Item" then
                            if (SL."Start Date" <> 0D) and (SL."End Date" <> 0D) then
                                SL.validate(Quantity, round(SL."User Count" * ((SL."End Date" - SL."Start Date") / 365), 0.01, '>'));
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterFinalizePosting', '', true, true)]
    local procedure RecordSubscriptionInfo(PreviewMode: Boolean; var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        setup: Record "Software Inc Setup";
        Sub: Record "Subscription Overview Focus";
        PSL: Record "Sales Invoice Line";
    begin
        if setup.get() then
            if setup."Subscription Customization" then begin
                if SalesInvoiceHeader."No." <> '' then begin
                    PSL.SETRANGE("Document No.", SalesInvoiceHeader."No.");
                    PSL.SETFILTER("Start Date", '<>%1', 0D);
                    if PSL.FindSet() then
                        repeat
                            Sub.INIT;
                            Sub."Customer No." := SalesInvoiceHeader."Bill-to Customer No.";
                            Sub."Invoice No." := SalesInvoiceHeader."No.";
                            SUb."Item No." := PSL."No.";
                            Sub."Start Date" := PSL."Start Date";
                            Sub."End Date" := PSL."End Date";
                            Sub."User Count" := PSL."User Count";
                            if Sub.INSERT() then;
                        until PSL.Next() = 0;
                end;
            end;
    end;
}