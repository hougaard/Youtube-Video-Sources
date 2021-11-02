page 50110 "Temp Customer"
{

    Caption = 'Temp Customer';
    PageType = List;
    SourceTable = Customer;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field';
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies the value of the Address 2 field';
                    ApplicationArea = All;
                }
                field("Net Change (LCY)"; Rec."Net Change (LCY)")
                {
                    ToolTip = 'Specifies the value of the Net Change (LCY) field';
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field';
                    ApplicationArea = All;
                }
            }
        }
    }

}
