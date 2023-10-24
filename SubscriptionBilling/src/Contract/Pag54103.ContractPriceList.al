page 54103 "Contract Price List"
{
    ApplicationArea = All;
    Caption = 'Contract Price List';
    PageType = List;
    SourceTable = "Contract Item Price";
    UsageCategory = None;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                }
                field(Frequency; Rec.Frequency)
                {
                }
                field(Price; Rec.Price)
                {
                }
            }
        }
    }
}
