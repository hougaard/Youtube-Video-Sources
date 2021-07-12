// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50111 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        client: HttpClient;
        r: HttpRequestMessage;
        s: HttpResponseMessage;
        c: HttpContent;
        Customer: Record Customer;
    begin
        r.SetRequestUri('https://ptsv2.com/t/erik/post');
        r.Method := 'POST';
        c.WriteFrom('{"Code 🎅"'); //:"EUR","Last_Date_Modified@odata.type":"Edm.DateTime","Last_Date_Modified":"2021-07-07","Last_Date_Adjusted":"0001-01-01","ISO_Code":"EUR","ISO_Numeric_Code":"978","Unrealized_Gains_Acc_":"48100","Realized_Gains_Acc_":"48300","Unrealized_Losses_Acc_":"48200","Realized_Losses_Acc_":"48400","Invoice_Rounding_Precision@odata.type":"Edm.Double","Invoice_Rounding_Precision":0.01,"Invoice_Rounding_Type":0,"Amount_Rounding_Precision@odata.type":"Edm.Double","Amount_Rounding_Precision":0.01,"Unit_Amount_Rounding_Precision@odata.type":"Edm.Double","Unit_Amount_Rounding_Precision":0.00100000000000000000,"Description":"Euro","Amount_Decimal_Places":"2:2","Unit_Amount_Decimal_Places":"2:5","Realized_G_L_Gains_Account":"","Realized_G_L_Losses_Account":"","Appln__Rounding_Precision@odata.type":"Edm.Double","Appln__Rounding_Precision":0.0,"EMU_Currency":true,"Currency_Factor@odata.type":"Edm.Double","Currency_Factor":0.0,"Residual_Gains_Account":"","Residual_Losses_Account":"","Conv__LCY_Rndg__Debit_Acc_":"","Conv__LCY_Rndg__Credit_Acc_":"","Max__VAT_Difference_Allowed@odata.type":"Edm.Double","Max__VAT_Difference_Allowed":0.0,"VAT_Rounding_Type":0,"Payment_Tolerance__@odata.type":"Edm.Double","Payment_Tolerance__":0.0,"Max__Payment_Tolerance_Amount@odata.type":"Edm.Double","Max__Payment_Tolerance_Amount":0.0,"Symbol":"xx","Last_Modified_Date_Time":"2021-07-08T06:39:32.2570000Z","__Id":"{00000000-0000-0000-0000-000000000000}","Customer_Filter":"","Vendor_Filter":"","Global_Dimension_1_Filter":"","Global_Dimension_2_Filter":"","Date_Filter":"0001-01-01","Cust__Ledg__Entries_in_Filter":false,"Customer_Balance@odata.type":"Edm.Double","Customer_Balance":0.0,"Customer_Outstanding_Orders@odata.type":"Edm.Double","Customer_Outstanding_Orders":0.0,"Customer_Shipped_Not_Invoiced@odata.type":"Edm.Double","Customer_Shipped_Not_Invoiced":0.0,"Customer_Balance_Due@odata.type":"Edm.Double","Customer_Balance_Due":0.0,"Vendor_Ledg__Entries_in_Filter":false,"Vendor_Balance@odata.type":"Edm.Double","Vendor_Balance":0.0,"Vendor_Outstanding_Orders@odata.type":"Edm.Double","Vendor_Outstanding_Orders":0.0,"Vendor_Amt__Rcd__Not_Invoiced@odata.type":"Edm.Double","Vendor_Amt__Rcd__Not_Invoiced":0.0,"Vendor_Balance_Due@odata.type":"Edm.Double","Vendor_Balance_Due":0.0,"Customer_Balance__LCY_@odata.type":"Edm.Double","Customer_Balance__LCY_":0.0,"Vendor_Balance__LCY_@odata.type":"Edm.Double","Vendor_Balance__LCY_":0.0,"__CompanyName":"CRONUS Canada, Inc.","__CompanyName@odata.type":"Edm.String","PartitionKey":"CRONUS_Canada__Inc_","RowKey":"EUR"}');
        r.Content := c;
        if not client.send(r, s) then
            error('!!!!');

    end;
}
