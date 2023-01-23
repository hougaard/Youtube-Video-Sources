tableextension 50100 Customerx extends Customer
{
    fields
    {
        field(50500; "Quote_Count"; Integer)
        {
            Caption = 'Quote_Count';
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Document Type" = const(Quote), "Sell-to Customer No." = field("No.")));
        }
        field(50501; "Quote_Sum"; Decimal)
        {
            Caption = 'Quote_Sum';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Header".Amount where("Document Type" = const(Order), "Sell-to Customer No." = field("No.")));
        }
        field(50502; "Has_Quotes"; Boolean)
        {
            Caption = 'Has_Quotes';
            FieldClass = FlowField;
            CalcFormula = exist("Sales Header" where("Document Type" = const(Quote), "Sell-to Customer No." = field("No.")));
        }
        field(50503; "Quote_avg"; Decimal)
        {
            Caption = 'Quote_avg';
            FieldClass = FlowField;
            CalcFormula = average("Sales Header".Amount where("Document Type" = const(Quote), "Sell-to Customer No." = field("No.")));
        }
        field(50504; "VendorName"; Text[100])
        {
            Caption = 'VendorName';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("No.")));
        }
    }
}