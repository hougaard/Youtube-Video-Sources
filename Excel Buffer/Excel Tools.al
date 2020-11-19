codeunit 50100 "Excel Tools"
{
    procedure GetText(var Buffer: Record "Excel Buffer" temporary; Col: Text; Row: Integer): Text
    begin
        if Buffer.Get(Row, GetColumnNumber(col)) then
            exit(Buffer."Cell Value as Text");
    end;

    procedure GetDate(var Buffer: Record "Excel Buffer" temporary; Col: Text; Row: Integer): Date
    var
        d: Date;
    begin
        if Buffer.Get(Row, GetColumnNumber(col)) then begin
            Evaluate(D, Buffer."Cell Value as Text");
            exit(D);
        end;
    end;

    procedure GetDecimal(var Buffer: Record "Excel Buffer" temporary; Col: Text; Row: Integer): Decimal
    var
        d: Decimal;
    begin
        if Buffer.Get(Row, GetColumnNumber(col)) then begin
            Evaluate(d, Buffer."Cell Value as Text");
            exit(d);
        end;

    end;

    procedure GetColumnNumber(ColumnName: Text): Integer
    var
        columnIndex: Integer;
        factor: Integer;
        pos: Integer;
    begin
        factor := 1;
        for pos := strlen(ColumnName) downto 1 do
            if ColumnName[pos] >= 65 then begin
                columnIndex += factor * ((ColumnName[pos] - 65) + 1);
                factor *= 26;
            end;

        exit(columnIndex);
    end;

    procedure GetColumnName(columnNumber: Integer): Text
    var
        dividend: Integer;
        columnName: Text;
        modulo: Integer;
        c: Char;
    begin
        dividend := columnNumber;

        while (dividend > 0) do begin
            modulo := (dividend - 1) mod 26;
            c := 65 + modulo;
            columnName := format(c) + columnName;
            dividend := (dividend - modulo) DIV 26;
        end;

        exit(columnName);
    end;
}