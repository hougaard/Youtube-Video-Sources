using System;
using BC;

namespace ODataFromCSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            var serviceRoot = "http://bc18:7048/BC/ODataV4/Company('Hougaard')/";
            var context = new BC.NAV(new Uri(serviceRoot));
            context.BuildingRequest += Context_BuildingRequest;

            var data = context.Chart_of_Accounts.AddQueryOption("$filter","Net_Change gt 0");

            foreach(var account in data)
                Console.WriteLine("{0} {1} {2}", account.No, account.Name, account.Net_Change);

         }
        private static void Context_BuildingRequest(object sender, Microsoft.OData.Client.BuildingRequestEventArgs e)
        {
            //e.RequestUri = new Uri(e.RequestUri.ToString().Replace("ODataV4/", "ODataV4/Company('Hougaard')/"));
            e.Headers.Add("Authorization", "Basic ZGVtbzpkZW1v");
        }
    }
}
