codeunit 50145 "XML Data"
{
    procedure Import()
    var
        InS: InStream;
        FileName: Text;
        XmlDoc: XmlDocument;
        Root: XmlElement;
        Records: XmlNodeList;
        Node: XmlNode;
        e: XmlElement;
        Data: record "XML Data";
        fieldnode: XmlNode;
        field: XmlElement;
        Ref: RecordRef;
        FieldRef: FieldRef;
        i: Integer;
    begin
        if UploadIntoStream('Upload XML', '', '', FileName, InS) then
            if XmlDocument.ReadFrom(InS, XmlDoc) then begin
                XmlDoc.GetRoot(Root);
                Records := Root.GetChildElements('Record');
                foreach Node in Records do begin
                    e := Node.AsXmlElement();

                    error('Select method 1, 2 or 3 in code first');

                    // First One
                    // ==============
                    Data.Init();
                    Data.RowID := GetInteger(e, 'RowID');
                    Data.Insert(true);
                    Data.Validate(Company, GetText(e, 'Company'));
                    Data.Validate(FirstName, GetText(e, 'FirstName'));
                    Data.Validate(LastName, GetText(e, 'LastName'));
                    Data.Modify(true);

                    // Second one
                    // ==========
                    Data.Init();
                    foreach fieldnode in e.GetChildElements() do begin
                        field := fieldnode.AsXmlElement();
                        case field.Name of
                            'Company':
                                Data.Company := field.InnerText;
                            'RowID':
                                Evaluate(Data.RowID, field.InnerText, 9);
                            'FirstName':
                                Data.FirstName := field.InnerText;
                            'LastName':
                                Data.LastName := field.InnerText;
                        end;
                    end;
                    Data.Insert(true);

                    // Third One
                    Ref.Open(DATABASE::"XML Data");
                    Ref.Init();
                    for i := 1 to Ref.FieldCount do begin
                        FieldRef := Ref.FieldIndex(i);
                        case FieldRef.Type of
                            FieldType::Integer:
                                FieldRef.Value := GetInteger(e, FieldRef.Name);
                            FieldType::Text,
                            FieldType::Code:
                                FieldRef.Value := GetText(e, FieldRef.Name);
                        end;
                    end;
                    Ref.Insert();
                    Ref.Close();

                end;
            end else
                error('Cannot parse XML');
    end;

    local procedure GetText(e: XmlElement; Name: Text): Text
    var
        FieldNode: XmlNode;
    begin
        foreach FieldNode in e.GetChildElements(Name) do
            exit(FieldNode.AsXmlElement().InnerText);
    end;

    local procedure GetInteger(e: XmlElement; Name: Text): Integer
    var
        FieldNode: XmlNode;
        value: Integer;
    begin
        foreach FieldNode in e.GetChildElements(Name) do
            if evaluate(Value, FieldNode.AsXmlElement().InnerText, 9) then
                exit(value);
    end;

    local procedure GetDateTime(e: XmlElement; Name: Text): DateTime
    var
        FieldNode: XmlNode;
        value: DateTime;
    begin
        foreach FieldNode in e.GetChildElements(Name) do
            if evaluate(Value, FieldNode.AsXmlElement().InnerText, 9) then
                exit(value);
    end;
}