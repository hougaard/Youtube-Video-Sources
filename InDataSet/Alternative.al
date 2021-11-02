page 50100 "Customer List 2"
{
    PageType = List;
    SourceTable = Customer;
    Caption = 'Customer List 2';

    layout
    {
        area(Content)
        {
            repeater(Rep)
            {

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
                field("Name 2"; Rec."Name 2")
                {
                    ToolTip = 'Specifies the value of the Name 2 field';
                    ApplicationArea = All;
                }
                field(AltAdr; AltAdr)
                {
                    ApplicationArea = all;
                    CAption = 'Alt Adr';
                }

            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        AltAdr := Rec.Address;
    end;

    var
        [InDataSet]
        AltAdr: Text;
}
