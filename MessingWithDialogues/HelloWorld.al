// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50143 CustomerListExt extends "Customer List"
{
    layout
    {
        addlast(content)
        {
            usercontrol(hack; jshacks)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                CAption = 'Test';
                ApplicationArea = all;
                trigger OnAction()
                var
                    d: Dialog;
                    i: Integer;
                begin
                    CurrPage.Hack.Update(123);
                    d.open('Progess #1##########');
                    for i := 1 to 10 do begin
                        sleep(300);
                        d.Update(1, i);
                        CurrPage.hack.Update(i);
                    end;
                    d.close();
                end;
            }
        }
    }
}