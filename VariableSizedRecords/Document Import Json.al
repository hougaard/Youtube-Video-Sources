report 53100 "Document Import Json"
{
    ProcessingOnly = true;
    Caption = 'Import JSON into Document table';
    requestpage
    {
        layout
        {
            area(Content)
            {
                field(TableKey; TableKey)
                {
                    Caption = 'Table Key';
                    ApplicationArea = all;
                }
                field(RowKeyField; RowKeyField)
                {
                    Caption = 'Row Key Field';
                    ApplicationArea = all;
                }

            }
        }
    }
    trigger OnPreReport()
    var
        InS: InStream;
        FileName: Text;
        Records: JsonArray;
        T: JsonToken;
        T2: JsonToken;
        Doc: Record "Document Hgd";
        Helper: Codeunit "Document Helper";
    begin
        If TableKey = '' then
            Error('You must specify a Table Key');
        if RowKeyField = '' then
            Error('You must specify what field is the row key field');
        Doc.SetRange(EntityKey, TableKey);
        Doc.DeleteAll(); // DEBUG TEST
        Helper.SetCurrentSortField('City');
        if UploadIntoStream('Select JSON file', '', '', FileName, InS) then begin
            if Records.ReadFrom(InS) then begin
                foreach T in Records do begin
                    if T.AsObject().Get(RowKeyField, T2) then begin
                        Doc.Insert(TableKey, T2.AsValue().AsText(), T.AsObject());
                    end;
                end;
            end;
        end;
    end;

    var
        TableKey: Text;
        RowKeyField: Text;
}