pageextension 50100 "Sales Order" extends "Sales Order"
{
    layout
    {
        addafter("No.")
        {
            field(JobNo; Rec.JobNo)
            {
                ApplicationArea = all;
            }
        }
    }
}

tableextension 50101 "Sales Header" extends "Sales Header"
{
    fields
    {
        field(50100; JobNo; Code[20])
        {
            Caption = 'Job';
            TableRelation = Job."No.";
            trigger OnValidate()
            var
                dims: Record "Dimension Set Entry" temporary;
            begin
                dims.init();
                dims.validate("Dimension Code", 'PROJECT');
                dims.validate("Dimension Value Code", Rec.JobNo);
                Dims.Insert();
                UpdateDimSetOnSalesHeader(Rec, Dims);
                Rec.Modify();
            end;
        }
    }
    procedure UpdateDimSetOnSalesHeader(var SH: Record "Sales Header"; var ToAddDims: Record "Dimension Set Entry" temporary)
    var
        DimMgt: Codeunit DimensionManagement;
        NewDimSet: Record "Dimension Set Entry" temporary;

    begin
        DimMgt.GetDimensionSet(NewDimSet, SH."Dimension Set ID");
        if ToAddDims.FindSet() then
            repeat
                if NewDimSet.Get(SH."Dimension Set ID", ToAddDims."Dimension Code") then begin
                    NewDimSet.validate("Dimension Value Code", ToAddDims."Dimension Value Code");
                    NewDimSet.Modify();
                end else begin
                    NewDimSet := ToAddDims;
                    NewDimSet."Dimension Set ID" := SH."Dimension Set ID";
                    NewDimSet.Insert();
                end;
            until ToAddDims.Next() = 0;
        SH."Dimension Set ID" := DimMgt.GetDimensionSetID(NewDimSet);
        DimMgt.UpdateGlobalDimFromDimSetID(SH."Dimension Set ID", SH."Shortcut Dimension 1 Code", SH."Shortcut Dimension 2 Code");
    end;
}
