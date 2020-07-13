page 50101 "USPS Verify Address Hgd"
{

    Caption = 'USPS Verify Address';
    PageType = Card;
    SourceTable = "USPS Address Verify Hgd";
    Editable = false;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group("Business Central")
            {
                field("No."; "No.")
                {
                    ToolTip = 'No.';
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ToolTip = 'Name';
                    ApplicationArea = All;
                }
                field("Address 1"; "Address 1")
                {
                    ToolTip = 'Address 1';
                    ApplicationArea = All;
                }
                field("Address 2"; "Address 2")
                {
                    ToolTip = 'Address 2';
                    ApplicationArea = All;
                }
                field(City; City)
                {
                    ToolTip = 'City';
                    ApplicationArea = All;
                }
                field("Post Code"; "Post Code")
                {
                    ToolTip = 'Post Code';
                    ApplicationArea = All;
                }
                field(County; County)
                {
                    ToolTip = 'State/county';
                    ApplicationArea = All;
                }
            }
            group(USPS)
            {
                field("USPS FirmName"; "USPS FirmName")
                {
                    ToolTip = 'USPS Firm Name';
                    ApplicationArea = All;
                }
                field("USPS Address 1"; "USPS Address 1")
                {
                    ToolTip = 'USPS Address 1';
                    ApplicationArea = All;
                }
                field("USPS Address 2"; "USPS Address 2")
                {
                    ToolTip = 'USPS Address 2';
                    ApplicationArea = All;
                }
                field("USPS City"; "USPS City")
                {
                    ToolTip = 'USPS City';
                    ApplicationArea = All;
                }
                field("USPS Zip5"; "USPS Zip5")
                {
                    ToolTip = 'USPS Zip5';
                    ApplicationArea = All;
                }
                field("USPS State"; "USPS State")
                {
                    ToolTip = 'USPS State';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Apply)
            {
                Caption = 'Apply USPS Address';
                Image = Apply;
                ToolTip = 'Apply the fields from USPS to the Business Central entity';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Mgt: Codeunit "USPS Management Hgd";
                begin
                    if confirm('Update %1 %2 with USPS address?', true, Rec.Type, Rec.Name) then begin
                        Mgt.ApplyAddress(Rec);
                        CurrPage.Close();
                    end;
                end;
            }
        }
    }
}
