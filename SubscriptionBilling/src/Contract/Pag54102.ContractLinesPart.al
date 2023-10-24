page 54102 "Contract Lines Part"
{
    ApplicationArea = All;
    Caption = 'Contract Lines Part';
    PageType = ListPart;
    SourceTable = "Contract Line";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {

                }
                field(StartingDate; Rec.StartingDate)
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field(Active; Rec.Active)
                {
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ToolTip = 'Specifies the value of the Billing Frequency field.';
                }
                field(Price; Rec.Price)
                {

                }
                field(LastBillingDate; Rec.LastBillingDate)
                {
                    ToolTip = 'Specifies the value of the Last Billing Date field.';
                }
            }
        }
    }
}
