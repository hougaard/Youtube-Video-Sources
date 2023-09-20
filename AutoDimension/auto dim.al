tableextension 50100 MyJob extends Job
{
    trigger OnAfterModify()
    var
        DimValue: Record "Dimension Value";
    begin
        if Rec.Description <> '' then begin
            if not DimValue.Get('PROJECT', Rec."No.") then begin
                DimValue.Init();
                DimValue."Dimension Code" := 'PROJECT';
                DimValue.Code := Rec."No.";
                DimValue.Insert(True);
            end;
            DimValue.validate(Name, copystr(Rec.Description, 1, MaxStrLen(DimValue.Name)));
            DimValue.Modify(true);
        end;
    end;
}