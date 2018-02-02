using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
namespace Web
{
    public static class Utils
    {
        public static decimal Convert(decimal amount, decimal rate)
        {
            decimal t = 0;
            try
            {
                t = decimal.Parse((rate * amount).ToString("N2"));
                //WebClient c = new WebClient();
                //string address = String.Format("https://www.google.com/finance/converter?a={0}&from={1}&to={2}&meta={3}", amount, from_Currency, to_Currency, Guid.NewGuid().ToString());
                //string get = c.DownloadString(address);
                //string resp = get.Substring(get.LastIndexOf("<span class=bld>") + 16);
                //resp = Regex.Replace(resp, @"<[^>]+>|&nbsp;", "").Replace(" " + to_Currency, "");
                //t = decimal.Parse(resp);
                //t = Math.Round(t, 2);
            }
            catch(Exception ex)
            {
                t = 0;
            }
            return t;
        }
        public static void SetWebSettings()
        {
            HttpCookie LoginCookie = HttpContext.Current.Request.Cookies.Get("Credentials");
            if (LoginCookie != null)
            {
                string userId = LoginCookie["WebUserId"].ToString();
                if (!string.IsNullOrEmpty(userId))
                {
                    long u = long.Parse(userId);
                    if (HttpContext.Current.Session["WebUserId"] == null)
                        HttpContext.Current.Session.Add("WebUserId", u);
                }
            }

        }
        
    }
}