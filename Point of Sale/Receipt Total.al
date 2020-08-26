page 57102 "POS Receipt Total"
{
    PageType = CardPart;
    SourceTable = "Sales Header";
    Editable = false;
    layout
    {
        area(Content)
        {
            field(Amount; Amount)
            {
                ApplicationArea = all;
            }
            field("Amount Including VAT"; "Amount Including VAT")
            {
                ApplicationArea = All;
            }
        }
    }
}