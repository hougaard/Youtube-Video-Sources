tableextension 50100 Customer extends Customer
{
    fields
    {
        field(50100; BoxesOnHand; Decimal)
        {
            Caption = 'Boxes on hand';
            FieldClass = FlowField;
            CalcFormula = Sum("Box Entry".Quantity where(CustomerNo = field("No.")));
        }
    }
}
pageextension 50100 CustomerCard extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(BoxesOnHand; Rec.BoxesOnHand)
            {
                ApplicationArea = all;
                DrillDown = true;
                DrillDownPageId = 50100;
            }
        }
    }
}