page 53101 "Entity List"
{
    PageType = List;
    Caption = 'Document Entities';
    SourceTable = "Entity Hgd";
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            repeater(rep)
            {
                field(EntityKey; Rec.EntityKey)
                {
                    ApplicationArea = All;
                }
                field(RowKeyField; Rec.RowKeyField)
                {
                    ApplicationArea = All;
                }
                field(SortingFieldName; Rec.SortingFieldName)
                {
                    ApplicationArea = All;
                }
                field(ListFields; Rec.ListFields)
                {
                    ApplicationArea = all;
                    ToolTip = 'Comma separated list of fields for list pages';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(View)
            {
                Caption = 'View Records';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                RunObject = Page "Generic Document List Hgd";
                RunPageLink = EntityKey = field(EntityKey);
                Image = ListPage;
            }
        }
    }
}