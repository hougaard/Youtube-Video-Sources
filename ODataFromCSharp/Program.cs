using System;

namespace ODataFromCSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
             * Field Info	Field Value	ExtensionSource
               $systemId (2000000000, GUID)	d00aced7-6ec1-eb11-b388-da215ec232af	 
             */
            var serviceRoot = "http://bc18:7048/BC/api/v2.0/companies(d00aced7-6ec1-eb11-b388-da215ec232af)/";
            var context = new BCAPI.NAV(new Uri(serviceRoot));
            context.BuildingRequest += Context_BuildingRequest;
   

            var data = context.Vendors.Execute();
            foreach (var vendor in data)
                Console.WriteLine("{0} {1}", vendor.Number, vendor.DisplayName);

            var serviceRoot2 = "http://bc18:7048/BC/ODataV4/Company('Hougaard')/";
            var context2 = new BC18.NAV(new Uri(serviceRoot2)); 
            context2.BuildingRequest += Context_BuildingRequest;

            //var coa = BC18.Chart_of_Accounts.CreateChart_of_Accounts("100");
            //coa.Name = "Youtube demo from C#";
            //context.AddToChart_of_Accounts(coa);
            //context.SaveChanges();

            var data2 = context2.Chart_of_Accounts.AddQueryOption("$filter", "Net_Change gt 0");
            foreach (var account in data2)
                Console.WriteLine("{0} {1} {2}", account.No, account.Name, account.Net_Change);
         }
        private static void Context_BuildingRequest(object sender, Microsoft.OData.Client.BuildingRequestEventArgs e)
        {
            //e.RequestUri = new Uri(e.RequestUri.ToString().Replace("ODataV4/", "ODataV4/Company('Hougaard')/"));
            e.Headers.Add("Authorization", "Basic ZGVtbzpEZW1vMjAwNCE=");
        }
    }
}
