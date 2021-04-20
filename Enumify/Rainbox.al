page 54800 "The Rainbow"
{
    Caption = 'Rainbow';
    UsageCategory = Administration;
    ApplicationArea = all;
    SourceTable = "Rainbow Component";
    PageType = List;
    layout
    {
        area(Content)
        {
            repeater(rep)
            {
                field(Layer; Rec.Layer)
                {
                    ApplicationArea = all;
                }
                field(Size; Rec.Size)
                {
                    ApplicationArea = all;
                }
                field(Color; Rec.Color)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}