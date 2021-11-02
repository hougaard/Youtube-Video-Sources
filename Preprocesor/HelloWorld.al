// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50112 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
#if something
        Message('App published: Hello world !!!');
#else
        Message('Something else!');
#endif
    end;
}