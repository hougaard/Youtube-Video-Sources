// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        lf: Text[2];
        line1: text;
        line2: text;
        total: Text;
        Lines: List of [Text];
    begin
        lf[1] := 13;
        lf[2] := 10;
        //Message('App published:%1Hello world with line feed', lf);

        Line1 := 'Erik';
        Line2 := 'YouTube';

        Total := Line1 + lf + line2 + lf;

        Lines := Total.Split(lf);
        Message('%1', Lines.Get(2));
    end;
}