report 54100 ContractBilling
{
    ProcessingOnly = true;
    Caption = 'Contract Billing';
    UsageCategory = Administration;
    ApplicationArea = all;
    dataset
    {
        dataitem(Contract; Contract)
        {
            RequestFilterFields = "Contract No.", "Customer No.";
            trigger OnAfterGetRecord()
            begin
                CreateInvoice(Contract);
            end;
        }
    }

    local procedure CreateInvoice(Contract: Record Contract)
    var
        Lines: Record "Contract Line";
        SH: Record "Sales Header";
        HeaderCreated: Boolean;
        SL: Record "Sales Line";
        LineNo: Integer;
    begin

        Lines.Setrange("Contract No.", Contract."Contract No.");
        if Lines.FindSet(true) then
            repeat
                if Lines.LastBillingDate < today() then begin
                    Lines.LastBillingDate := CalcDate(Lines.Frequency, Today());
                    if Not HeaderCreated then begin
                        SH.Init();
                        SH."Document Type" := SH."Document Type"::Invoice;
                        SH.Insert(true);
                        SH.Validate("Sell-to Customer No.", Contract."Customer No.");
                        SH.Validate("Posting Date", Today());
                        SH.Modify(true);
                        HeaderCreated := true;
                        LineNo := 0;
                    end;
                    Clear(SL);
                    SL.Init();
                    SL."Document Type" := SH."Document Type";
                    SL."Document No." := SH."No.";
                    LineNo += 10000;
                    SL."Line No." := LineNo;
                    SL.Insert(true);
                    SL.Validate(Type, SL.Type::Item);
                    SL.Validate("No.", Lines."Item No.");
                    SL.Validate(Quantity, 1);
                    SL.Validate("Unit Price", Lines.Price);
                    SL.Modify(true);
                end;
            until Lines.Next() = 0;
    end;
}