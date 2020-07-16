codeunit 51100 "Search Management"
{
    procedure Search(SearchTerm: Text; var Result: Record "Search Result" temporary)
    var
        SearchSetup: Record "Search Setup";
        Ref: RecordRef;
        KRef: KeyRef;
        FRef: FieldRef;
        LastResult: Integer;
        OnlyONeFieldPrimaryKeyErr: Label 'Primary key search is only supported on tables with 1 field in the key.';
    begin
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
                        Result."Data Caption" := CopyStr(format(Ref).Replace(',', ' '), 1, maxstrlen(Result."Data Caption"));
                        Result."Record ID" := Ref.RecordId;
                        Result.Insert();
                    end;
                end;

                Ref.Close();
            until SearchSetup.Next() = 0;
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