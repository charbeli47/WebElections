using Microsoft.Web.Administration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Web.resources
{
    /// <summary>
    /// Summary description for deleteRow
    /// </summary>
    public class deleteRow : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string table = context.Request.Form["table"];
            string ips = context.Request.Form["ips"];
            int tableId = int.Parse(context.Request.Form["tableId"]);
            DCEntities db = new DCEntities();
            string success = "";
            switch (table)
            {
                case "cms_user":
                    cms_user user = db.cms_user.Where(x=>x.id == tableId).SingleOrDefault();
                    db.cms_user.Remove(user);
                    success = "success";
                    break;
                case "cms_groups":
                    cms_groups group = db.cms_groups.Where(x => x.id == tableId).SingleOrDefault();
                    db.cms_groups.Remove(group);
                    success = "success";
                    break;
                case "WebUser":
                    WebUser webuser = db.WebUsers.Where(x => x.id == tableId).SingleOrDefault();
                    db.WebUsers.Remove(webuser);
                    success = "success";
                    break;
                case "IPs":
                    AllowIP(ips);
                    break;
            }
            db.SaveChanges();
            context.Response.Write(success);
        }
        static void AllowIP(string IP)
        {
            using (ServerManager serverManager = new ServerManager())
            {
                Microsoft.Web.Administration.Configuration config = serverManager.GetApplicationHostConfiguration();
                Microsoft.Web.Administration.ConfigurationSection ipSecuritySection = config.GetSection("system.webServer/security/ipSecurity", "BrandsMarketing");
                ConfigurationElementCollection ipSecurityCollection = ipSecuritySection.GetCollection();
                var ipAddress = ipSecurityCollection.Where(x => x["ipAddress"].ToString() == IP).SingleOrDefault();
                ipSecurityCollection.Remove(ipAddress);
                serverManager.CommitChanges();
            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}