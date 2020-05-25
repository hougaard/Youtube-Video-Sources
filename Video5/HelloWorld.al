// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message(GenerateAwesomeMessage(TODAY()));
    end;

    local procedure GenerateAwesomeMessage(T: Date): Text
    var
        d: Integer;
        m: Integer;
        y: Integer;
    begin
        d := 3;
        m := 4;
        y := 5;
        newProcedure(d, m);
    end;

    local procedure newProcedure(var d: Integer; var m: Integer): Text
    begin
        for d := m to m * 5 do begin
            for m := d to d * 5 do begin
                if d = m then
                    exit('Test!!!');
            end;
        end;
    end;
}