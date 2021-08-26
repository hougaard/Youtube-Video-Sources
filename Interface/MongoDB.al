codeunit 50100 "MongoDB" implements DataProviderEFQ
{
    procedure Connect(): Boolean
    begin
        Error('MongoDB is not yet implemented!');
    end;

    procedure CheckTable(TableName: Text): Boolean
    begin

    end;

    procedure AddTable(TableName: Text): Boolean
    begin

    end;

    procedure Insert(Ref: RecordRef; AddDateToPrimaryKey: Boolean; AddDate: Date): Boolean
    begin

    end;

    procedure DeleteTable(TableName: Text): Boolean
    begin

    end;
}