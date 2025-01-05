// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ELI5FlowFields;

using Microsoft.Sales.Customer;
using Microsoft.Purchases.Vendor;
using Microsoft.Purchases.Payables;

tableextension 50100 CustomerTable extends Customer
{
    fields
    {
        field(50100; MyFlow; Decimal)
        {
            FieldClass = FlowField;
            //CalcFormula = count(Customer where("Customer Posting Group" = filter('DOMESTIC')));
            //CalcFormula = exist(Customer where("Customer Posting Group" = filter('FOREIGN')));
            //CalcFormula = lookup(Vendor.Name where("No." = field("No.")));
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Vendor No." = field("No.")));
            Editable = false;
        }
    }
}
pageextension 50100 CustomerList extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field(MyFlow; Rec.MyFlow)
            {
                ApplicationArea = all;
                //DrillDownPageId = "Vendor Card";
            }
        }
    }
}