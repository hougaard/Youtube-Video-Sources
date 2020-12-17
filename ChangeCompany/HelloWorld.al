// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50139 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        Company: Record Company;
        Customer: Record Customer;
        Customer2: Record Customer;
    begin
        Company.setfilter(Name, '<>%1', CompanyName());
        if Company.FindSet() then
            repeat
                Customer.ChangeCompany(Company.Name);
                Customer.FindFirst();
                Message('%1', Customer.Name);
            until Company.Next() = 0;
    end;
}