page 50100 "Sales Team FactBox"
{
    Caption = 'Team';
    PageType = ListPart;
    SourceTable = "Sales Team Member";
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = true;
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Add)
            {
                Caption = 'Add new';
                ApplicationArea = all;
                Image = Add;
                trigger OnAction()
                var
                    SP: Record "Salesperson/Purchaser";
                begin
                    if Page.RunModal(PAGE::"Salespersons/Purchasers", SP) = Action::LookupOK then begin
                        Rec.Init();
                        Rec.ParentTable := PTable;
                        Rec.ParentSystemId := PSystemId;
                        Rec.SalesPerson := SP.Code;
                        Rec.Insert();
                    end;
                end;
            }
        }
    }
    procedure SetParent(Ref: RecordRef)
    var
        SystemIdField: FieldRef;
    begin
        PTable := Ref.Number;
        SystemIdField := Ref.Field(Ref.SystemIdNo);
        PSystemId := SystemIdField.Value;
        Rec.SetRange(ParentTable, PTable);
        Rec.Setrange(ParentSystemId, PSystemId);
        CurrPage.Update(False);
    end;

    var
        PTable: Integer;
        PSystemId: Guid;
}