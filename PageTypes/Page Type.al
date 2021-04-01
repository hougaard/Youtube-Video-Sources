page 50100 "Page Type Demo"
{
    PageType = List;
    SourceTable = Customer;
    layout
    {
        area(Content)
        {
            // repeater(Rep)
            // {
            field("No."; Rec."No.")
            {
                ApplicationArea = all;
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = all;
            }
            //}
        }
        // area(FactBoxes)
        // {
        //     part(Stat; "Page Type Part")
        //     {
        //         SubPageLink = "No." = field("No.");
        //         ApplicationArea = all;
        //     }
        // }
    }
}