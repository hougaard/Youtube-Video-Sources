// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        T: Text;
        P1: Integer;
        P2: Integer;
        Output: Text;
        X1, X2, X3 : Text;
        L1, L2 : List of [Text];
        d: Date;
    begin
        d.
        T := 'Text[250]';
        // P1 := Strpos(T, '[');
        // P2 := Strpos(T, ']');
        // Output := copystr(T, P1 + 1, P2 - P1 - 1);
        // Message('Result %1', Output);
        // L1 := T.Split('[');
        // X1 := L1.Get(2);
        // L2 := X1.Split(']');
        // Output := L2.Get(1);
        Output := T.Split('[').Get(2).Split(']').Get(1);
        Message('Result %1', Output);

    end;
}