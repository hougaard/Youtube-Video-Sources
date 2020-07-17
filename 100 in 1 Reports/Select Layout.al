page 50123 "Select Layout"
{
    PageType = List;
    UsageCategory = None;
    SourceTable = "Custom Report Layout";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field(Description; Description)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(EditLayout)
            {
                Caption = 'Edit Layouts';
                ApplicationArea = All;
                Image = DocumentEdit;
                ToolTip = 'Edit the report layouts';
                RunObject = Page "Custom Report Layouts";
                RunPageLink = "Report ID" = field("Report ID");
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
            }
        }
    }
}