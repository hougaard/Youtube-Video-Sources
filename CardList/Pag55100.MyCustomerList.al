page 55100 "My Customer List"
{
    ApplicationArea = All;
    Caption = 'My Customer List';
    PageType = List;
    CardPageId = "My Customer Card";
    Editable = false;
    SourceTable = Customer;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Name 2"; Rec."Name 2")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Address 2"; Rec."Address 2")
                {
                }
                field(City; Rec.City)
                {
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        T : Codeunit "Telemetry Management";
    begin
        
    end;
}
