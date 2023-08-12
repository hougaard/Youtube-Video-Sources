page 53100 "Test Document Page"
{
    SourceTable = "Document Hgd";
    PageType = List;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(rep)
            {

                field(TableKey; Rec.EntityKey)
                {
                    ApplicationArea = All;
                }
                field(RowKey; Rec.RowKey)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.FieldTxt('Name'))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption('Name');
                }
                field(Address; Rec.FieldTxt('Address'))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption('Address');
                }
                field(OsO; Rec.FieldDecimal('Outstanding_Orders'))
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Rec.Caption('Outstanding_Orders');
                }
                field(SortingField; Rec.SortingField)
                {
                    ApplicationArea = all;
                    CaptionClass = 'DOC,' + Helper.GetCurrentSortField();
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Import)
            {
                Caption = 'Import';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                RunObject = Report "Document Import Json";
                ApplicationArea = all;
            }
        }
    }
    trigger OnInit()
    begin
        Helper.SetCurrentSortField('City');
    end;

    var
        Helper: Codeunit "Document Helper";
}