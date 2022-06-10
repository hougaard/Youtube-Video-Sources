using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using wcftest_in_charp.wcftest;

namespace wcftest_in_charp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            wcftest_PortClient portClient = new wcftest_PortClient();
            portClient.ClientCredentials.UserName.UserName = "erik";
            portClient.ClientCredentials.UserName.Password = "0+1V4IZRPtYW1pf4IX9lFFjuvHHFo769pxY5IRioS9A=";

            portClient.Endpoint.EndpointBehaviors.Add(new AddAuthTokenEndpointBehavior(GetToken().Result));
            
            try
            {
                Console.WriteLine(portClient.Ping("hello youtube"));
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.ReadLine();
        }
        static async Task<string> GetToken()
        {
            string URL = "https://login.microsoftonline.com/c1f19d2f-252e-4d89-a7c7-5bb9042d59eb/oauth2/v2.0/token";

            HttpClient client = new HttpClient();
            var content = new StringContent("grant_type=client_credentials" +
                                            "&scope=https://api.businesscentral.dynamics.com/.default" +
                                            "&client_id=" + HttpUtility.UrlEncode("08465913-b99c-4086-a4c3-d73ec628aab5") +
                                            "&client_secret=" + HttpUtility.UrlEncode("4Hq7Q~UcXKjLvbLVBDwiKlitHBTRkHaj-fc_B"));
            content.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/x-www-form-urlencoded");
            var response = await client.PostAsync(URL, content);
            if (response.IsSuccessStatusCode)
            {
                JObject Result = JObject.Parse(await response.Content.ReadAsStringAsync());
                return Result["access_token"].ToString();
            }
            return null;
        }
    }
}
