// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.JPathSelectToken;

using Microsoft.Sales.Customer;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        jtxt: Text;
        j: JsonObject;
    begin
        jtxt := '{ "company": {"employees": [{ "id": "Marcy","salary": 8.95},{ "id": "John","salary": 7},{ "id": "Diana","salary": 10.95}]}}';

        j.ReadFrom(jtxt);

        message('%1', SelectEmployeeSalary(j.AsToken(), 'John'));
    end;

    local procedure SelectEmployeeSalary(companyData: JsonToken; employeeId: Text) salary: Decimal;
    var
        query: Text;
        salaryToken: JsonToken;
    begin
        query := '$.company.employees[?(@.id==''' + employeeId + ''')].salary';
        companyData.SelectToken(query, salaryToken);

        salary := salaryToken.AsValue().AsDecimal();
    end;
}