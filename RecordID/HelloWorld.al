// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50104 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        x: RecordId;
    begin
        Rec.FindFirst();
        Message('>>%1<<', format(Rec.RecordId(), 0, 2));
        Evaluate(x, format(Rec.RecordId));
    end;
}