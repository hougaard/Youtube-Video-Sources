codeunit 50102 "AL Secret"
{
    procedure getclientid(): Text
    begin
        exit('secret santa');
    end;

    procedure getclientsecret(): Text
    begin
        exit('enter your own');
    end;
}