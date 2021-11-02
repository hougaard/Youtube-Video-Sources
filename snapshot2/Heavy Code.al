pageextension 50111 "Heavy Code" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Heavy Stuff';
                ApplicationArea = all;
                PromotedIsBig = true;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    if Cust.FindSet() then
                        repeat
                            Heavy2(Cust);
                        until Cust.Next() = 0;
                end;
            }
        }
    }

    local procedure Heavy2(var Cust: Record Customer)
    var
        Ledger: Record "Cust. Ledger Entry";
    begin
        Ledger.Setrange("Customer No.", Cust."No.");
        if Ledger.findset() then
            repeat
                Heavy3(Ledger);
            until Ledger.Next() = 0;
    end;

    local procedure Heavy3(var Ledger: Record "Cust. Ledger Entry")
    var
        Dtl: Record "Detailed Cust. Ledg. Entry";
        X: Decimal;
    begin
        Dtl.Setrange("Entry No.", Ledger."Entry No.");
        if Dtl.findset() then
            repeat
                x += Dtl."Amount (LCY)";
            until Dtl.Next() = 0;
    end;
}