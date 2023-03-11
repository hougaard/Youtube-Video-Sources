tableextension 50100 "My Customer Ext" extends Customer
{
    fields
    {
        field(50100; VendorName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("No.")));
            Editable = false;
        }
    }
}