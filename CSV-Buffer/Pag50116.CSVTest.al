page 50116 "CSV Test"
{

    ApplicationArea = All;
    Caption = 'CSV Test';
    PageType = List;
    SourceTable = "CSV Buffer";
    SourceTableTemporary = true;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Field No."; Rec."Field No.")
                {
                    ApplicationArea = All;
                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = All;
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
                Image = Import;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    InS: InStream;
                    FileName: Text;
                begin
                    if UploadIntoStream('CSV File', '', '', Filename, InS) then begin
                        Rec.LoadDataFromStream(InS, ',');
                        Message('Lines = %1', Rec.GetNumberOfLines());
                    end;
                end;
            }
            action(CreateOrders)
            {
                Caption = 'Create Orders';
                Image = Import;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    LineNo: Integer;
                begin
                    for LineNo := 1 to Rec.GetNumberOfLines() do begin
                        CreateInvoice(LineNo);
                    end;
                end;
            }
        }
    }
    procedure GetText(LineNo: Integer; FieldNo: Integer): Text
    begin
        if Rec.GET(LineNo, FieldNo) then
            exit(Rec.Value.TrimEnd('"').TrimStart('"'));
    end;

    local procedure GetDate(LineNo: Integer; FieldNo: Integer): Date
    var
        D: Date;
    begin
        if Rec.GET(LineNo, FieldNo) then begin
            evaluate(D, Rec.Value.TrimEnd('"').TrimStart('"'));
            exit(d);
        end;
    end;

    local procedure CreateInvoice(var LineNo: Integer)
    var
        SH: Record "Sales Header";
    begin
        SH.Init();
        SH."Document Type" := SH."Document Type"::Invoice;
        SH.Insert(true);
        SH.Validate("Sell-to Customer No.", GetText(LineNo, 1));
        SH.Validate("Document Date", GetDate(LineNo, 2));
        SH.Modify(true);
        CreateLines(LineNo, SH);
    end;

    local procedure CreateLines(var LineNo: Integer; SH: Record "Sales Header")
    var
        FieldNo: Integer;
        Done: Boolean;
    begin
        FieldNo := 3;
        repeat
            if Rec.Get(LineNo, FieldNo) then begin
                CreateLine(LineNo, SH, FieldNo);
            end else
                Done := true;
            FieldNo += 2;
        until Done;
    end;

    local procedure GetDecimal(var LineNo: Integer; FieldNo: Integer): Decimal
    var
        D: Decimal;
    begin
        if Rec.GET(LineNo, FieldNo) then begin
            evaluate(D, Rec.Value.TrimEnd('"').TrimStart('"'));
            exit(d);
        end;
    end;

    local procedure CreateLine(var LineNo: Integer; var SH: Record "Sales Header"; var FieldNo: Integer)
    var
        SL: Record "Sales Line";
    begin
        SL.Init();
        SL."Document Type" := SH."Document Type";
        SL."Document No." := SH."No.";
        SL."Line No." := 10000 * FieldNo;
        SL.Insert(true);
        SL.Validate(Type, SL.Type::Item);
        SL.Validate("No.", GetText(LineNo, FieldNo));
        SL.Validate(Quantity, GetDecimal(LineNo, FieldNo + 1));
        SL.Modify(true);
    end;


    trigger OnAfterGetRecord()
    begin
        Rec.Value := Rec.Value.TrimEnd('"').TrimStart('"');
    end;
}
