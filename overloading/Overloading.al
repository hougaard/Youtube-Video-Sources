codeunit 50214 "Overloading"
{
    procedure CreateCustomer(var Customer: Record Customer)
    begin
        Customer.Init();
        Customer.Insert(true);
    end;

    procedure CreateCustomer(Name: Text; var Customer: Record Customer)
    begin
        CreateCustomer(Name, '', '', Customer);
    end;

    procedure CreateCustomer(Name: Text; PostingGrp: Code[20]; PhoneNo: Text; var Customer: Record Customer)
    begin
        Customer.Init();
        Customer.Insert(true);
        Customer.Validate(Name, Name);
        Customer.Validate("Phone No.", PhoneNo);
        if PostingGrp <> '' then
            Customer.Validate("Customer Posting Group", PostingGrp);
        Customer.Modify(true);
    end;
}