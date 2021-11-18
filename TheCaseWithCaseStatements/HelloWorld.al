// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50117 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        age: Integer;
    begin
        age := 16;


        if test(0) = 0 then
            message('Welcome to the world')
            else if test(1) = 1 then
                message('Learn to walk')
                else if test(16) = 16 then
                    message('Sweet sixteen!')
                else
                    message('Anything else!');
                    
        case age of
            test(0):
                Message('Welcome to the world');
            test(1):
                Message('Learn to walk');
            test(16):
                Message('Sweet sixteen');
            else
                message('Anything else!');
        end;
    end;

    procedure test(i: Integer): Integer
    begin
        //message('Testing %1', i);
        exit(i);
    end;
}