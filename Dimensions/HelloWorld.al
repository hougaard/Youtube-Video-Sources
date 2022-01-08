// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50102 SalesOrder extends "Sales Order"
{
    actions
    {
        addfirst(processing)
        {
            action(DimTest)
            {
                Caption = 'Test Dimensions';
                ApplicationArea = all;
                trigger OnAction()
                var
                    dims: Record "Dimension Set Entry" temporary;
                begin
                    dims.init();
                    dims.validate("Dimension Code", 'BUSINESSGROUP');
                    dims.validate("Dimension Value Code", 'HOME');
                    Dims.Insert();
                    dims.init();
                    dims.validate("Dimension Code", 'PURCHASER');
                    dims.validate("Dimension Value Code", 'RB');
                    Dims.Insert();
                    UpdateDimSetOnSalesHeader(Rec, Dims);
                    Rec.Modify();
                end;
            }
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