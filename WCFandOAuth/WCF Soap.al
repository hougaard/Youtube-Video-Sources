codeunit 50119 "WCF Test"
{
    procedure Ping(parm: Text): Text
    begin
        exit(Parm + ' ' + Parm);
    end;
}