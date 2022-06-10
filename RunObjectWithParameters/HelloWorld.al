// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(TestCall)
            {
                Caption = 'Test Call';
                ApplicationArea = all;
                // RunObject = Page "Customer Card Info EH";
                // RunPageLink = Address = filter('*Road*');
                trigger OnAction()
                var
                    Customer: Record Customer;
                    ThePage: Page "Customer Card Info EH";
                begin
                    ThePage.SetupPage('Youtube', 123.345);
                    ThePage.RunModal();
                end;
            }
        }
    }
    trigger OnOpenPage();
    var
        Customer: Record Customer;
    begin
        // Customer.Setfilter(Address,'*Road*');
        // Page.Run(22,Customer);
    end;
}