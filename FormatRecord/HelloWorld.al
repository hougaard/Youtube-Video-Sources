// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Rec.FindFirst();
        Message(format(Rec, 0, 0));
        Message(format(Rec, 0, 1));
        Message(format(Rec, 0, 2));
        //Message(format(Rec, 0, 3));
        //Message(format(Rec, 0, 4));
        //Message(format(Rec, 0, 5));
        //Message(format(Rec, 0, 6));
        //Message(format(Rec, 0, 7));
        //Message(format(Rec, 0, 8));
        Message(format(Rec, 0, 9));
    end;
}