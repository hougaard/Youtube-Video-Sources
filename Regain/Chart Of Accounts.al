pageextension 50003 "My Chart of Accounts" extends "Chart of Accounts"
{
    layout
    {
        addafter("Net Change")
        {
            field("Budget at Date Ctl"; Rec."Budget at Date")
            {
                ApplicationArea = All;
            }
            field("Budgeted Amount"; Rec."Budgeted Amount")
            {
                ApplicationArea = All;
            }
        }
    }
}
