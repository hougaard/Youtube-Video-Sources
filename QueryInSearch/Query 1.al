// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.QueryInSearch;

using Microsoft.Sales.Customer;

Query 50131 "Query in Search"
{
    UsageCategory = ReportsAndAnalysis;
    QueryType = Normal;
    Caption = 'Query in Search';
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