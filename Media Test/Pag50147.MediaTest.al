page 50147 "Media Test"
{

    Caption = 'Media Test';
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            field(Picture; Rec.Image)
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        //CalcFields(Image);
    end;
}
