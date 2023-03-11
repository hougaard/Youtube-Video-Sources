pageextension 51200 "My G/L Entry List" extends "General Ledger Entries"
{
    layout
    {
        addbefore("Posting Date")
        {
            field(AccountingPeriod; Rec.AccountingPeriod)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(AddActP)
            {
                Caption = 'Add Account Period to posted entries';
                ApplicationArea = all;
                trigger OnAction()
                var
                    OddMgt: Codeunit "Odd Accounting";
                begin
                    OddMgt.UpdateAccountingPeriods();
                end;
            }
        }
    }
}