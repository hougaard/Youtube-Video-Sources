// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50143 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        GL: Record "G/L Entry";
        D: Date;
        D2: Date;
        D3 : Date;
        T1,T2,T3 : Text;
    begin
        D := 20220505D;
        D2 := 20220606D;
        GL.SetFilter("Posting Date", '5/5/22..6/6/22'); // BAD
        GL.SetFilter("Posting Date", format(D) + '|' + format(D2)); // semi-BAD
        GL.SetFilter("Posting Date", '%1|%2|%3', D, D2,D3); // Not-Bad
        GL.SetRange("Posting Date", D);

        GL.SetFilter(Description,'%1','sdfgsdfg');
    end;
}