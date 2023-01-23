codeunit 50123 "Test"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterCustLedgEntryInsert', '', true, true)]
    local procedure MyProcedure(var CustLedgerEntry: Record "Cust. Ledger Entry")
    var
        CustRec: Record Customer;
    begin
        if CustRec.Get(CustLedgerEntry."Customer No.") then begin
            CustRec.CalcFields("Balance (LCY)");
            if CustRec."Balance (LCY)" > CustRec."Credit Limit (LCY)" then begin
                CustRec.Blocked := CustRec.Blocked::Invoice;
                CustRec.Modify(true);
            end;
        end;
    end;
}