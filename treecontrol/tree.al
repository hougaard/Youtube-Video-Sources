page 50142 "Tree test"
{
    PageType = list;
    SourceTable = "G/L Account";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(rep)
            {
                IndentationColumn = Rec.Indentation;
                IndentationControls = Name;
                ShowAsTree = true;
                TreeInitialState = CollapseAll;
                field(Indentation; Rec.Indentation)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the name of the cash account.';
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(Balance; Rec.Balance)
                {
                    ToolTip = 'Specifies the balance of the cash account.';
                    ApplicationArea = All;
                }
                field("Net Change"; Rec."Net Change")
                {
                    ToolTip = 'Specifies the net change in the account balance during the time period in the Date Filter field.';
                    ApplicationArea = All;
                }

            }
        }
    }
}