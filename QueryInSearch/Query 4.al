// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.QueryInSearch;

using Microsoft.Sales.Customer;

Query 50134 "Query in Search 4"
{
    UsageCategory = ReportsAndAnalysis;
    QueryType = Normal;
    Access = Public;
    QueryCategory = 'Category';
    Caption = 'Query in Search 4';
    Description = 'Query in Search 4';
    elements
    {
        dataitem(Customer; Customer)
        {

            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Name2; "Name 2")
            {
            }
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(City; City)
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(County; County)
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
        }
    }
}