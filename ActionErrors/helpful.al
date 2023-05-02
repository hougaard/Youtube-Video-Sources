codeunit 50100 "Helpful"
{
    SingleInstance = true;
    procedure Behelpful(e: ErrorInfo)
    var
        C: REcord Customer;
    begin
        C.GetBySystemId(RememberedSystemId);
        message('Wasn''t that helpful? %1', C.Name);
    end;

    procedure SetContext(g: Guid)
    begin
        RememberedSystemId := g;
    end;

    var
        RememberedSystemId: Guid;
}