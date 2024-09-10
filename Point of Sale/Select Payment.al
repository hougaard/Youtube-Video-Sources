page 57103 "Select Payment"
{
    PageType = List;
    SourceTable = "Payment Method";
    SourceTableView = where("POS Payment" = const(true));
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}