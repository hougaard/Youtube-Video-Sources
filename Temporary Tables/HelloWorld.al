// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            Action(Test)
            {
                Caption = 'Temporary';
                ApplicationArea = all;
                trigger OnAction()
                var
                    TempCust: Record Customer temporary;
                begin
                    TempCust.Init();
                    TempCust."No." := '10000';
                    TempCust.Insert();
                    TempCust.Init();
                    TempCust."No." := '20000';
                    TempCust.Insert();
                    TempCust.Init();
                    TempCust."No." := '30000';
                    TempCust.Insert();
                    TempCust.Init();
                    TempCust."No." := '40000';
                    TempCust.Insert();
                    page.run(50110, TempCust);
                end;
            }
        }
    }
}