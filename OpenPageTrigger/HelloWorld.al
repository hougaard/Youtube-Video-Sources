// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        s: Codeunit Single;
    begin
        s.Add();
        OpenPageCounter += 1;
        Message('App published: Hello world %1', s.get());
        error('xx');
    end;

    var
        OpenPageCounter: Integer;
}

codeunit 50100 "Single"
{
    SingleInstance = true;

    procedure Add()
    begin
        counter += 1;
    end;

    procedure Get(): Integer
    begin
        exit(counter);
    end;

    var
        counter: Integer;
}