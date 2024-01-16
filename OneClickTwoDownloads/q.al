query 50200 Test
{
    QueryCategory = 'sales';
    QueryType = API;
    EntitySetName = 'orderlists';
    EntityName = 'orderlist';
    APIGroup = 'SOD';
    APIPublisher = 'hougaard';
    APIVersion = 'v2.0';
    elements
    {
        dataitem(header; "Sales Header")
        {
            filter = 
            column(documenttype; "Document Type") { }
            column(no_; "No.") { }
            column(billtocustomerno_; "Bill-to Customer No.") { }
            column(billtoname; "Bill-to Name") { }
            column(yourreference; "Your Reference") { }
            dataitem(line; "Sales Line")
            {
                SqlJoinType = RightOuterJoin;
                DataItemLink = "Document Type" = header."Document Type", "Document No." = header."No.";
                column(documenttype2; "Document Type") { }
                column(documentno_; "Document No.") { }
                column(lineno_; "Line No.") { }
                column(type; Type) { }
                column(no_2; "No.") { }
                column(locationcode; "Location Code") { }
                column(description; Description) { }
                column(quantity; Quantity) { }
                column(unitprice; "Unit Price") { }
                column(amount; Amount) { }
            }
        }

    }
}
