page 53102 "Generic Document List Hgd"
{
    SourceTable = "Document Hgd";
    PageType = List;
    Caption = 'Documents';
    DataCaptionFields = EntityKey;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field(RowKey; Rec.RowKey)
                {
                    ApplicationArea = all;
                }
                field(C1; Rec.FieldTxt(Column1))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column1);
                    Visible = Column1 <> '';
                    Editable = false;
                }
                field(C2; Rec.FieldTxt(Column2))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column2);
                    Visible = Column2 <> '';
                    Editable = false;
                }
                field(C3; Rec.FieldTxt(Column3))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column3);
                    Visible = Column3 <> '';
                    Editable = false;
                }
                field(C4; Rec.FieldTxt(Column4))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column4);
                    Visible = Column4 <> '';
                    Editable = false;
                }
                field(C5; Rec.FieldTxt(Column5))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column5);
                    Visible = Column5 <> '';
                    Editable = false;
                }
                field(C6; Rec.FieldTxt(Column6))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column6);
                    Visible = Column6 <> '';
                    Editable = false;
                }
                field(C7; Rec.FieldTxt(Column7))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column7);
                    Visible = Column7 <> '';
                    Editable = false;
                }
                field(C8; Rec.FieldTxt(Column8))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column8);
                    Visible = Column8 <> '';
                    Editable = false;
                }
                field(C9; Rec.FieldTxt(Column9))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column9);
                    Visible = Column9 <> '';
                    Editable = false;
                }
                field(C10; Rec.FieldTxt(Column10))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption(Column10);
                    Visible = Column10 <> '';
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Edit)
            {
                Caption = 'Edit Record';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = Edit;
                trigger OnAction()
                var
                    EditPage: Page "Document Editor Hgd";
                begin
                    EditPage.SetObject(Rec.GetObject());
                    EditPage.LookupMode(true);
                    EditPage.Editable(true);
                    if EditPage.RunModal() = Action::LookupOK then begin
                        Rec.SetObject(EditPage.GetObject());
                        Rec.ModifyRec();
                    end;
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if Entity.Get(Rec.GetFilter(EntityKey)) then begin
            Columns := Entity.ListFields.Split(',');
            if Columns.Count() > 0 then
                Column1 := Columns.Get(1);
            if Columns.Count() > 1 then
                Column2 := Columns.Get(2);
            if Columns.Count() > 2 then
                Column3 := Columns.Get(3);
            if Columns.Count() > 3 then
                Column4 := Columns.Get(4);
            if Columns.Count() > 4 then
                Column5 := Columns.Get(5);
            if Columns.Count() > 5 then
                Column6 := Columns.Get(6);
            if Columns.Count() > 6 then
                Column7 := Columns.Get(7);
            if Columns.Count() > 7 then
                Column8 := Columns.Get(8);
            if Columns.Count() > 8 then
                Column9 := Columns.Get(0);
            if Columns.Count() > 9 then
                Column10 := Columns.Get(10);
        end;
    end;

    var
        Entity: Record "Entity Hgd";
        Columns: List of [Text];
        Column1, Column2, Column3, Column4, Column5, Column6, Column7, Column8, Column9, Column10 : Text;
}