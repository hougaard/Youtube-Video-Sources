query 50100 JOBS
{
    QueryCategory = 'test';
    QueryType = API;
    EntitySetName = 'jobs';
    EntityName = 'job';
    APIGroup = 'SOD';
    APIPublisher = 'hougaard';
    APIVersion = 'v2.0';
    UsageCategory = ReportsAndAnalysis;
    elements
    {
        dataitem(job; Job)
        {
            filter(no__filter; "No.") { }
            filter(billtocustomerno__filter; "Bill-to Customer No.") { }
            filter(no_; "No.")
            {
            }
            column(description; Description)
            {
            }
            filter(billtocustomerno_; "Bill-to Customer No.")
            {
            }
            column(startingdate; "Starting Date")
            {
            }
            column(endingdate; "Ending Date")
            {
            }
            dataitem(task; "Job Task")
            {
                SqlJoinType = RightOuterJoin;
                DataItemLink = "Job No." = job."No.";
                filter(jobtasktype_filter; "Job Task Type") { }
                column(jobno_; "Job No.")
                {
                }
                column(jobtaskno_; "Job Task No.")
                {
                }
                column(description2; Description)
                {
                }
                filter(jobtasktype; "Job Task Type")
                {
                }
                column(schedule_totalcost_; "Schedule (Total Cost)")
                {
                }
                column(schedule_totalprice_; "Schedule (Total Price)")
                {
                }
                column(usage_totalcost_; "Usage (Total Cost)")
                {
                }
                column(usage_totalprice_; "Usage (Total Price)")
                {
                }
                column(contract_totalcost_; "Contract (Total Cost)")
                {
                }
                column(contract_totalprice_; "Contract (Total Price)")
                {
                }
                column(contract_invoicedprice_; "Contract (Invoiced Price)")
                {
                }
                dataitem(plan; "Job Planning Line")
                {
                    SqlJoinType = RightOuterJoin;
                    DataItemLink = "Job No." = task."Job No.", "Job Task No." = task."Job Task No.";
                    filter(planningdate_filter; "Planning Date") { }
                    column(lineno_; "Line No.")
                    {
                    }
                    filter(planningdate; "Planning Date")
                    {
                    }
                    column(type; Type)
                    {
                    }
                    column(no_2; "No.")
                    {
                    }
                    column(description3; Description)
                    {
                    }
                    column(quantity; Quantity)
                    {
                    }
                    column(unitofmeasurecode; "Unit of Measure Code")
                    {
                    }
                }
            }
        }

    }
}
