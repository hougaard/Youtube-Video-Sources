codeunit 50100 "x"
{
    var
        _test: Text;

    procedure Test(value: Text): Text
    begin
        _test := value;
    end;

    procedure Test2(): Text
    begin
        exit(_test);
    end;

    procedure x()
    begin
        Test := '3123123';
        message('%1', Test2);
    end;
}