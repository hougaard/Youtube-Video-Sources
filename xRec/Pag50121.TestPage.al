page 50121 "Test Page"
{

    ApplicationArea = All;
    Caption = 'Test Page';
    PageType = List;
    SourceTable = "Test Table";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("code"; Rec."code")
                {
                    ToolTip = 'Specifies the value of the code field';
                    ApplicationArea = All;
                }
                field("Text 1"; Rec."Text 1")
                {
                    ToolTip = 'Specifies the value of the Text 1 field';
                    ApplicationArea = All;
                }
                field("Text 2"; Rec."Text 2")
                {
                    ToolTip = 'Specifies the value of the Text 2 field';
                    ApplicationArea = All;
                }
            }
        }
    }

}
