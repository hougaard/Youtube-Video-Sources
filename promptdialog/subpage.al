page 50101 "Item SubList"
{
    PageType = ListPart;
    SourceTable = Item;
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Net Change"; Rec."Net Change")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Net Change field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies what you are selling.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the price for one unit.';
                }
            }
        }
    }
}