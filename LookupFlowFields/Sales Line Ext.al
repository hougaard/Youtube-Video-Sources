tableextension 50100 "My Sales Line" extends "Sales Line"
{
    fields
    {
        field(50100; VendorItemNo; Text[50])
        {
            Caption = 'Vendor Item No.';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Item."Vendor Item No." where("No." = field("No.")));
        }
    }
}
pageextension 50100 "My Sales Line" extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field(VendorItemNo; Rec.VendorItemNo)
            {
                ApplicationArea = all;
                DrillDownPageId = 30;
            }
        }
    }
}