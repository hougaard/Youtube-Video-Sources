page 56100 "Validate Test"
{

    Caption = 'Validate Test';
    PageType = Card;
    SourceTable = "Validate Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(PK; Rec.PK)
                {
                    ToolTip = 'Specifies the value of the PK field.';
                    ApplicationArea = All;
                }
                field("Validate This"; Rec."Validate This")
                {
                    ToolTip = 'Specifies the value of the Validate This field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Message('OnValidate Page Trigger');
                        Rec."Validate This" := 'OnValidate Page Trigger';
                    end;
                }
            }
        }
    }

}
