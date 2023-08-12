table 53100 "Document Hgd"
{
    fields
    {
        field(1; EntityKey; Text[50])
        {
            Caption = 'Table Key';
            TableRelation = "Entity Hgd".EntityKey;
        }
        field(2; RowKey; Text[200])
        {
            Caption = 'Row Key';
        }
        field(3; Storage; Option)
        {
            Caption = 'Storage';
            OptionMembers = TextField,BLOB;
        }
        field(4; StorageText1; Text[2048])
        {
            Caption = 'Storage Text 1';
        }
        field(5; StorageText2; Text[1024])
        {
            Caption = 'Storage Text 1';
        }
        field(7; BlobStorage; Blob)
        {
            Caption = 'Blob Storage';
        }
        field(8; SortingField; Text[100])
        {
            Caption = 'SortingField';
            CaptionClass = 'DOC,' + SortingFieldName();
        }
    }
    keys
    {
        key(PK; EntityKey, RowKey)
        {
            Clustered = true;
        }
        key(Sort; SortingField)
        { }
    }
    procedure SetFieldText(FieldName: Text; Value: Text)
    begin
        if Object.Contains(FieldName) then
            Object.Replace(FieldName, Value)
        else
            Object.Add(FieldName, Value);
    end;

    procedure SetFieldDate(FieldName: Text; Value: Date)
    begin
        if Object.Contains(FieldName) then
            Object.Replace(FieldName, Value)
        else
            Object.Add(FieldName, Value);
    end;

    procedure SetFieldDecimal(FieldName: Text; Value: Decimal)
    begin
        if Object.Contains(FieldName) then
            Object.Replace(FieldName, Value)
        else
            Object.Add(FieldName, Value);
    end;

    procedure ModifyRec()
    var
        AsText: Text;
        OutS: OutStream;
        T: JsonToken;
    begin
        if SortingFieldName() <> '' then
            if Object.Get(SortingFieldName(), T) then
                Rec.SortingField := T.AsValue().AsText();
        AsText := format(Object);
        if strlen(AsText) < 3072 then begin
            Rec.Storage := Rec.Storage::TextField;
            Rec.StorageText1 := copystr(AsText, 1, 2048);
            Rec.StorageText2 := Copystr(AsText, 2049, 1024);
        end else begin
            Rec.Storage := Rec.Storage::BLOB;
            Rec.BlobStorage.CreateOutStream(OutS);
            OutS.Write(AsText);
        end;
        Rec.Modify();
    end;

    procedure Insert(_TableKey: Text; _RowKey: Text; _Object: JsonObject)
    var
        Rec2: Record "Document Hgd";
        AsText: Text;
        OutS: OutStream;
        T: JsonToken;
    begin
        Rec2.Init();
        Rec2.EntityKey := _TableKey;
        Rec2.RowKey := _RowKey;

        if SortingFieldName() <> '' then
            if _Object.Get(SortingFieldName(), T) then
                Rec2.SortingField := T.AsValue().AsText();

        AsText := format(_Object);
        if strlen(AsText) < 3072 then begin
            Rec2.Storage := Rec2.Storage::TextField;
            Rec2.StorageText1 := copystr(AsText, 1, 2048);
            Rec2.StorageText2 := Copystr(AsText, 2049, 1024);
        end else begin
            Rec2.Storage := Rec2.Storage::BLOB;
            Rec2.BlobStorage.CreateOutStream(OutS);
            OutS.Write(AsText);
        end;
        Rec2.Insert();
    end;

    procedure Caption(FieldName: Text): Text
    begin
        // Could be fancy!
        exit(FieldName);
    end;

    procedure FieldTxt(FieldName: Text): Text
    var
        T: JsonToken;
    begin
        LoadValue();
        if Object.Get(FieldName, T) then
            exit(T.AsValue().AsText());
    end;

    procedure FieldDate(FieldName: Text): Date
    var
        T: JsonToken;
    begin
        LoadValue();
        if Object.Get(FieldName, T) then
            exit(T.AsValue().AsDate());
    end;

    procedure FieldDateTime(FieldName: Text): DateTime
    var
        T: JsonToken;
    begin
        LoadValue();
        if Object.Get(FieldName, T) then
            exit(T.AsValue().AsDateTime());
    end;

    procedure FieldTime(FieldName: Text): Time
    var
        T: JsonToken;
    begin
        LoadValue();
        if Object.Get(FieldName, T) then
            exit(T.AsValue().AsTime());
    end;

    procedure FieldBoolean(FieldName: Text): Boolean
    var
        T: JsonToken;
    begin
        LoadValue();
        if Object.Get(FieldName, T) then
            exit(T.AsValue().AsBoolean());
    end;

    procedure FieldDecimal(FieldName: Text): Decimal
    var
        T: JsonToken;
    begin
        LoadValue();
        if Object.Get(FieldName, T) then
            exit(T.AsValue().AsDecimal());
    end;

    procedure LoadValue()
    var
        InS: InStream;
        T: JsonToken;
    begin
        if Rec.EntityKey + Rec.RowKey <> LoadedRowKey then begin
            case Rec.Storage of
                Rec.Storage::TextField:
                    Object.ReadFrom(Rec.StorageText1 + Rec.StorageText2);
                Rec.Storage::BLOB:
                    begin
                        Rec.CalcFields(BlobStorage);
                        Rec.BlobStorage.CreateInStream(InS);
                        Object.ReadFrom(inS);
                    end;
            end;
            ObjectHasValue := true;
            LoadedRowKey := Rec.EntityKey + Rec.RowKey;
        end;
    end;

    procedure GetObject(): JsonObject
    begin
        LoadValue();
        exit(Object);
    end;

    procedure SetObject(_O: JsonObject)
    begin
        Object := _O;
    end;

    procedure SortingFieldName(): Text
    var
        Entity: Record "Entity Hgd";
    begin
        if Entity.Get(EntityKey) then
            exit(Entity.SortingFieldName);
    end;


    var
        Object: JsonObject;
        ObjectHasValue: Boolean;
        LoadedRowKey: Text;
}