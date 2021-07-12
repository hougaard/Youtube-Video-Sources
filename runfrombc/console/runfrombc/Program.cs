using System;
using System.Web;

namespace runfrombc
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello Business Central!");
            foreach (var s in args)
            {
                Console.WriteLine("Parameter Length {0} (decoded={1}", s.Length, HttpUtility.UrlDecode(s).Length);
                Console.WriteLine("Parameter: {0}", HttpUtility.UrlDecode(s));
            }
            Console.ReadLine();
        }
    }
}
