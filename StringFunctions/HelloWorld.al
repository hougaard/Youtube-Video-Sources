// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 53300 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        s: Text;
        s2: Text;
        L: List of [Text];
    begin
        s := 'Erik Hougaard YouTube Videos';

        //s2 := copystr(s, 6, 8000);
        s2 := s.Substring(6);


        Message('Result %1', s2);
    end;
}