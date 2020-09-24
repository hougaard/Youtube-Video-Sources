table 50142 "FlowField Test Table"
{
    fields
    {
        field(1; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(2; Name; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup (Customer.Name where("No." = field("Customer No.")));
        }
        field(3; "Has Invoices"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist ("Sales Invoice Header" where("Sell-to Customer No." = field("Customer No.")));
        }
        field(4; "Invoices Total"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum ("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("Customer No.")));
        }
        field(5; "Invoices Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count ("Cust. Ledger Entry" where("Document Type" = const(Invoice), "Customer No." = field("Customer No.")));
        }
        field(6; "Average Invoice"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = average ("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("Customer No.")));
        }
        field(7; "Max Invoice Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = max ("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("Customer No.")));
        }
    }
    keys
    {
        key(PK; "Customer No.")
        {

        }
    }
}