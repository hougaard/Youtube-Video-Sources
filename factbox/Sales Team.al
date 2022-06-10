table 50100 "Sales Team Member"
{
    fields
    {
        field(1; ParentTable; Integer)
        {
            Caption = 'Parent Table';
        }
        field(2; ParentSystemId; Guid)
        {
            Caption = 'Parent Record';
        }
        field(3; SalesPerson; Code[20])
        {
            Caption = 'Person';
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(4; Name; Text[100])
        {
            Caption = 'Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Salesperson/Purchaser".Name where(Code = field(SalesPerson)));
            Editable = false;
        }
    }
    keys
    {
        Key(PK; ParentTable, ParentSystemId, SalesPerson)
        { }
    }
}