page 57102 "POS Receipt Total"
{
    PageType = CardPart;
    SourceTable = "Sales Header";
    Editable = false;
    layout
    {
        area(Content)
        {
            field(Amount; Rec.Amount)
            {
                ApplicationArea = all;
            }
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = All;
                AboutTitle = 'Remember TAX';
                AboutText = 'This total is including vat/tax/moms/gst/pst/hst';
            }
        }
    }
}