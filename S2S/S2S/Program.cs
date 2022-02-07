using Newtonsoft.Json.Linq;
using System.Web;

namespace S2S
{
    class Program
    {
        static async Task Main(string[] args)
        {
            string ClientId = "4f8fbebf-7ac5-4614-b083-2a19abe55aef";
            string ClientSecret = "4Gp7Q~EKu3c28zCzeClcWE8L3gb1C-srM93WQ";
            string TenantId = "c1f19d2f-252e-4d89-a7c7-5bb9042d59eb";

            string URL = "https://login.microsoftonline.com/" + TenantId + "/oauth2/v2.0/token";

            HttpClient client = new HttpClient();
            var content = new StringContent("grant_type=client_credentials" +
                                            "&scope=https://api.businesscentral.dynamics.com/.default" +
                                            "&client_id=" + HttpUtility.UrlEncode(ClientId) +
                                            "&client_secret=" + HttpUtility.UrlEncode(ClientSecret));
            content.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/x-www-form-urlencoded");
            var response = await client.PostAsync(URL, content);
            if (response.IsSuccessStatusCode)
            {
                JObject Result = JObject.Parse(await response.Content.ReadAsStringAsync());
                string BearerToken = Result["access_token"].ToString();

                string URL2 = "https://api.businesscentral.dynamics.com/v2.0/c1f19d2f-252e-4d89-a7c7-5bb9042d59eb/acs/api/hougaard/PET/v2.0/pets?Company=CRONUS%20Canada,%20Inc.";
                HttpClient testclient = new HttpClient();
                testclient.DefaultRequestHeaders.Add("Authorization", "Bearer " + BearerToken);
                var result = await testclient.GetAsync(URL2);
                if (result.IsSuccessStatusCode)
                {
                    Console.WriteLine(await result.Content.ReadAsStringAsync());
                }
            }
        }
    }
}