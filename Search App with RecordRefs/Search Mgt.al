codeunit 51100 "Search Management"
{
    procedure Search(SearchTerm: Text; var Result: Record "Search Result" temporary)
    var
        SearchSetup: Record "Search Setup";
        Ref: RecordRef;
        FullRef: RecordRef;
        KRef: KeyRef;
        FRef: FieldRef;
        LowerSearchTerm: Text;
        LastResult: Integer;
        FullCounter: Integer;
        OnlyONeFieldPrimaryKeyErr: Label 'Primary key search is only supported on tables with 1 field in the key.';
    begin
        Result.Deleteall();
        if SearchSetup.findset() then
            repeat
                Ref.OPEN(SearchSetup."Table No.");
                if SearchSetup."Search Primary Key" then begin
                    KRef := Ref.KeyIndex(1);
                    if Kref.FieldCount() <> 1 then
                        error(OnlyOneFieldPrimaryKeyErr);
                    FRef := KRef.FieldIndex(1);
                    FRef.SetRange(SearchTerm);
                    if Ref.FindFirst() then begin
                        LastResult += 1;
                        Result.INIT();
                        Result."Line No." := LastResult;
                        Result."Table No." := SearchSetup."Table No.";
                        Result."Data Caption" := CopyStr(DataCaption(Ref), 1, maxstrlen(Result."Data Caption"));
                        Result."Record ID" := Ref.RecordId;
                        Result.Insert();
                    end else
                        if SearchSetup."Full Text Search" then begin
                            FullRef.OPEN(SearchSetup."Table No.");
                            LowerSearchTerm := SearchTerm.ToLower();
                            FullCounter := 0;
                            if FullRef.FindSet(false, false) then
                                repeat
                                    if format(FullRef).ToLower().Contains(LowerSearchTerm) then begin
                                        LastResult += 1;
                                        Result.INIT();
                                        Result."Line No." := LastResult;
                                        Result."Table No." := SearchSetup."Table No.";
                                        Result."Data Caption" := CopyStr(DataCaption(FullRef), 1, maxstrlen(Result."Data Caption"));
                                        Result."Record ID" := FullRef.RecordId;
                                        Result.Insert();
                                        FullCounter += 1;
                                    end;
                                until (FullRef.Next() = 0) or (FullCounter = SearchSetup."Full Text Search Limit");
                            FullRef.Close();
                        end;

                end;

                Ref.Close();
            until SearchSetup.Next() = 0;
    end;

    procedure DataCaption(Ref: RecordRef): Text
    var
        i: Integer;
        Fref: FieldRef;
        Result: Text;
        UsedFields: Dictionary of [Integer, Text];
        UsedFieldTypes: Dictionary of [Text, Text];
    begin
        for i := 1 to Ref.KeyIndex(1).FieldCount() do begin
            Fref := Ref.FieldIndex(i);
            UsedFields.Add(Fref.Number(), Fref.Name());
            if not UsedFieldTypes.ContainsKey(format(Fref.Type())) then
                UsedFieldTypes.Add(Format(Fref.Type()), format(Fref.Type()));
            if Result <> '' then
                result += ' ' + format(FRef.Value())
            else
                Result += format(Fref.Value());
        end;

        for i := 1 to Ref.FieldCount() do begin
            Fref := Ref.FieldIndex(i);
            if not UsedFields.ContainsKey(Fref.Number()) then begin
                case Fref.Type of
                    FieldType::Text:
                        begin
                            if Result <> '' then
                                result += ' ' + format(FRef.Value())
                            else
                                Result += format(Fref.Value());
                        end;
                    else begin
                            if not UsedFieldTypes.ContainsKey(format(Fref.Type())) then begin
                                if Result <> '' then
                                    result += ' ' + format(FRef.Value())
                                else
                                    Result += format(Fref.Value());
                                UsedFieldTypes.Add(Format(Fref.Type()), format(Fref.Type()));
                            end;
                        end;
                end;
            end;
        end;

        exit(Result);
    end;

    procedure NavigateTo(Rec: Record "Search Result")
    var
        Setup: Record "Search Setup";
        Ref: RecordRef;
        RefVari: Variant;
    begin
        Setup.get(Rec."Table No.");
        Setup.TestField("Card Page");
        Ref.OPEN(Setup."Table No.");
        Ref.Get(Rec."Record ID");
        RefVari := Ref;
        Page.run(Setup."Card Page", RefVari);
    end;
}