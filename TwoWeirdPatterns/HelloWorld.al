// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        starttime: Time;
    begin
        starttime := Time();
        // if not Condition1() or
        //    not Condition2() or
        //    not Condition3() then

        if false in [Condition1(), Condition2(), Condition3()] then
            message('No!! (%1)', time() - starttime);

        // if not test() then
        //     message('No!! (%1)', time() - starttime);
        
    end;

    procedure test(): boolean;
    begin
        x
        end;
    end;

    procedure Condition1(): Boolean
    begin
        exit(false);
    end;

    procedure Condition2(): Boolean
    begin
        Sleep(5000);
        exit(False);
    end;

    procedure Condition3(): boolean
    begin
        Sleep(5000);
        exit(false);
    end;
}