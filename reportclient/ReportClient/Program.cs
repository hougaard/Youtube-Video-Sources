using System;
using System.IO;
using System.ServiceModel;
using System.Threading.Tasks;
using ReportService;

namespace ReportClient
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var binding = new BasicHttpBinding();
            binding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
            binding.MaxReceivedMessageSize = 9999999;
            binding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;

            var ep = new EndpointAddress("http://bc18:7047/BC/WS/CRONUS%20Canada%2C%20Inc./Codeunit/report");

            var client = new report_PortClient(binding, ep);
            client.ClientCredentials.UserName.UserName = "demo";    
            client.ClientCredentials.UserName.Password = "demo";

            var result = await client.RunReportAsync(111, "<?xml version=\"1.0\" standalone=\"yes\"?><ReportParameters name=\"Customer - Top 10 List\" id=\"111\"><Options><Field name=\"ShowType\">0</Field><Field name=\"NoOfRecordsToPrint\">3</Field><Field name=\"ChartType\">0</Field></Options><DataItems><DataItem name=\"Customer\">VERSION(1) SORTING(Field1)</DataItem><DataItem name=\"Integer\">VERSION(1) SORTING(Field1)</DataItem></DataItems></ReportParameters>");

            File.WriteAllBytes("report111.pdf", Convert.FromBase64String(result.return_value));
        }
    }
}
