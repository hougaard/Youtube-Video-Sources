// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        DateTimeDialog: Page "Date-Time Dialog";
    begin
        //DateTimeDialog.UseDateOnly();
        DateTimeDialog.Caption('What date do you go on vacation?');
        DateTimeDialog.SetDateTime(CurrentDateTime());
        if DateTimeDialog.RunModal() = Action::OK then begin
            message('You selected %1', DateTimeDialog.GetDateTime());
        end;
    end;
}