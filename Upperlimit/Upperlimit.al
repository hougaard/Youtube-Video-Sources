tableextension 66100 "My COA" extends "G/L Account"
{
    fields
    {
        field(66100; MyBalance; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."),
                                                       "Posting Date" = field(upperlimit("Date Filter"))));
        }
    }
}

pageextension 66100 "My COA Page" extends "Chart of Accounts"
{
    layout
    {
        addafter("Net Change")
        {
            field(MyBalance; Rec.MyBalance)
            {
                ApplicationArea = all;
            }
        }
    }
}