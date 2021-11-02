// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Customer: Record Customer;
        Customer2: Record Customer temporary; // Context
        Customer3: Record Customer;
    begin
        // The Record (Pointer to a specific record)
        Customer.Name := 'Erik';
        Customer.Validate(Name, 'Erik');

        // The DataSet
        Customer.SetFilter(Name, 'Peter*');
        Customer.SetFilter(Address, '*9*');
        Customer.SetRange(Blocked, Customer.Blocked::Invoice);
        message('Count = %1', Customer.Count());

        // Context
        Customer3.ChangeCompany('My Company');
        message('Count = %1', Customer3.Count());
        Customer3.ChangeCompany(CompanyName());
        message('Count = %1', Customer3.Count());



    end;
}