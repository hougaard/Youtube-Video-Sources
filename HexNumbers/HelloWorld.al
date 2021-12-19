// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50109 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        TypeHelper: Codeunit "Type Helper";
        Input: Text;
        Output: Text;
        b: Integer;
        I: Integer;
    begin
        Input := 'Youtube';
        for i := 1 to strlen(Input) do begin
            b := Input[i];
            if b < 16 then
                output += '0';
            output += TypeHelper.IntToHex(b);
        end;
        Message('Input = %1, output = %2', Input, Output);
        //Message('Dec %1 = Hex %2', 4, TypeHelper.IntToHex(4));
    end;
}