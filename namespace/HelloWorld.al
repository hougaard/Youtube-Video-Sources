namespace Hougaard.Apps.ToolBox;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Posting;
using System.Azure.Functions;

// pageextension 50100 CustomerListExt extends "Customer List"
// {
//     trigger OnOpenPage();
//     var
//         Post: Codeunit "Sales-Post";
//     begin
//         Message('App published: Hello world');
//     end;
// }


















// table 50100 Customer
// {
//     fields
//     {
//         field(1; CustomerGuid; Guid)
//         { }
//         field(2; Name; Text[300])
//         {
//             Caption = 'Name';
//         }
//     }
//     keys
//     {
//         key(PK; CustomerGuid)
//         { }
//     }
// }

tableextension 50100 CustmerTableExt extends Customer
{
    fields
    {
        field(50100; Name; Text[500])
        {
            Caption = 'Long Name';
        }
    }
}

