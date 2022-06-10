using Newtonsoft.Json.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace S2S
{
    class Program
    {
        static async Task Main(string[] args)
        {
            //AskForDeviceCode();
            await GetS2SToken();
            Console.ReadLine();
        }
        static async Task GetS2SToken()
        { 
            string ClientId = "a6571b4b-dee9-4480-a584-190ffba02785";
            string ClientSecret = "tVn8Q~lZ5xeLQhzgzMwU3w7V1HO74Zlr_3I9kciQ";
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

                string URL2 = "https://api.businesscentral.dynamics.com/v2.0/c1f19d2f-252e-4d89-a7c7-5bb9042d59eb/acs/ODataV4/Company('CRONUS%20Canada%2C%20Inc.')/Chart_of_Accounts";
                HttpClient testclient = new HttpClient();
                testclient.DefaultRequestHeaders.Add("Authorization", "Bearer " + BearerToken);
                var result = await testclient.GetAsync(URL2); 
                if (result.IsSuccessStatusCode)
                {
                    Console.WriteLine(await result.Content.ReadAsStringAsync());
                }
                else
                {
                    Console.WriteLine(result.StatusCode.ToString());
                }

                HttpClient testclient2 = new HttpClient();
                testclient2.DefaultRequestHeaders.Add("Authorization", "Bearer " + BearerToken);
                var result2 = await testclient2.GetAsync(URL2);
                if (result2.IsSuccessStatusCode)
                {
                    Console.WriteLine(await result2.Content.ReadAsStringAsync());
                }
                else
                {
                    Console.WriteLine(result2.StatusCode.ToString());
                }


            }
            else
            {
                Console.WriteLine(response.StatusCode.ToString());
            }
        }
        private static bool AskForDeviceCode()
        { 
            string postData = "client_id=38ff8e09-04a5-4af9-8153-793418879bde&scope=https://api.businesscentral.dynamics.com/user_impersonation&tenant=Common";
            byte[] byteArray = Encoding.UTF8.GetBytes(postData);

            HttpWebRequest request = HttpWebRequest.CreateHttp("https://login.microsoftonline.com/Common/oauth2/v2.0/devicecode");
            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            if (response != null)
            {
                if (response.StatusCode == HttpStatusCode.OK)
                    using (dataStream = response.GetResponseStream())
                    {
                        StreamReader reader = new StreamReader(dataStream);
                        string responseFromServer = reader.ReadToEnd();
                        JObject Result = JObject.Parse(responseFromServer);
                        if (Result.ContainsKey("device_code"))
                        {
                            Console.WriteLine("{0}", Result["message"]);
                            if (WaitForDeviceCode(Result["device_code"].ToString()))
                                return true;
                        }
                        else
                            Console.WriteLine("Failed!");
                    }
                response.Close();
            }
            return false;
        }
        private static bool WaitForDeviceCode(string DeviceCode)
        {
            string Tenant = "Common";
            bool Waiting = true;
            int TimeOutCounter = 100;
            while (Waiting)
            {
                Thread.Sleep(5000);
                TimeOutCounter--;
                if (TimeOutCounter <= 0)
                {
                    Console.WriteLine("Login request timed out, aborting.");
                    return false;
                }
                // " + o.TenantId + "
                string postData = "tenant=" + Tenant + "&grant_type=urn:ietf:params:oauth:grant-type:device_code&client_id=38ff8e09-04a5-4af9-8153-793418879bde&scope=https://api.businesscentral.dynamics.com/user_impersonation&device_code=" + DeviceCode;
                byte[] byteArray = Encoding.UTF8.GetBytes(postData);

                HttpWebRequest request = HttpWebRequest.CreateHttp("https://login.microsoftonline.com/" + Tenant + "/oauth2/v2.0/token");
                request.Method = "POST";
                request.ContentType = "application/x-www-form-urlencoded";
                Stream dataStream = request.GetRequestStream();
                dataStream.Write(byteArray, 0, byteArray.Length);
                dataStream.Close();

                try
                {
                    HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                    if (response != null)
                    {
                        if (response.StatusCode == HttpStatusCode.OK)
                            using (dataStream = response.GetResponseStream())
                            {
                                StreamReader reader = new StreamReader(dataStream);
                                string responseFromServer = reader.ReadToEnd();
                                JObject result = JObject.Parse(responseFromServer);

                                if (result.ContainsKey("token_type"))
                                    if (result["token_type"].ToString() == "Bearer")
                                    {
                                        var bearerToken = result["access_token"].ToString();
                                        Console.WriteLine();
                                        Console.WriteLine("token {0}", bearerToken);
                                        return true;
                                    }
                            }
                    }
                }
                catch (WebException e)
                {
                    if (e.Status == WebExceptionStatus.ProtocolError)
                    {
                        //using (WebResponse response = e.Response)
                        //{
                        //    HttpWebResponse httpResponse = (HttpWebResponse)response;
                        //    Console.WriteLine("Error code: {0}", httpResponse.StatusCode);
                        //    using (Stream data = response.GetResponseStream())
                        //    using (var reader = new StreamReader(data))
                        //    {
                        //        string text = reader.ReadToEnd();
                        //        Console.WriteLine(text);
                        //    }
                        //}
                        Console.SetCursorPosition(0, Console.CursorTop);
                        Console.Write("Waiting {0} ", TimeOutCounter);

                    }
                }
            }
            return false;
        }

    }
}