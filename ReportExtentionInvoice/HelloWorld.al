reportextension 50100 "My Invoice" extends "Sales Invoice NA"
{
    dataset
    {
        // Frist try
        // add("Sales Invoice Line")
        // {
        //     column(Description_2; "Description 2")
        //     { }
        // }
        // Second try
        // add(SalesInvLine)
        // {
        //     column(Description2; "Sales Invoice Line"."Description 2")
        //     { }
        // }
        // Third try
        // add(SalesInvLine)
        // {
        //     column(Description2; TempSalesInvoiceLine."Description 2")
        //     { }
        // }
        modify("Sales Invoice Header")
        {
            trigger OnBeforeAfterGetRecord()
            begin
                clear(D2List);
            end;
        }
        modify(SalesInvLine)
        {
            trigger OnAfterAfterGetRecord()
            begin
                Description2 := D2List.Get(Number);
            end;
        }
        add(SalesInvLine)
        {
            column(Description2; Description2)
            { }
        }
        modify("Sales Invoice Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                D2List.Add("Description 2");
            end;
        }
        modify("Sales Comment Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                D2List.Add('');
            end;

            trigger OnBeforePreDataItem()
            begin
                D2List.Add('');
            end;
        }
        modify(SalesLineComments)
        {
            trigger OnAfterAfterGetRecord()
            begin
                D2List.Add('');
            end;
        }
    }
    rendering
    {
        layout(Excel)
        {
            Caption = 'Data in Excel for testing';
            Type = Excel;
            LayoutFile = 'invoice.xlsx';
        }
    }
    var
        Description2: Text;
        D2List: List of [Text];
}