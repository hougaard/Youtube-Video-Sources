tableextension 50133 "Test" extends Customer
{
    fields
    {
        field(50100; "Current_Operation_Description1"; Text[100])
        {
            Caption = 'Current Operation Description';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Prod. Order Routing Line".Description where("Routing Status" = filter('<>Finished')));
        }
        field(50101; "Current_Operation_Description2"; Text[100])
        {
            Caption = 'Current Operation Description';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Prod. Order Routing Line".Description where("Routing Status" = filter(<> Finished)));
        }
    }
}
pageextension 50133 "custome xx" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(Current_Operation_Description1; Rec.Current_Operation_Description1)
            {
                ApplicationArea = all;
            }
            field(Current_Operation_Description2; Rec.Current_Operation_Description2)
            {
                ApplicationArea = all;
            }
        }
    }
}