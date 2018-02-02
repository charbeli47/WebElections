//using NPOI.HSSF.UserModel;
using System;
using System.Collections.Generic;
using System.DirectoryServices;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using Microsoft.Web.Administration;


namespace Web.resources
{
    /// <summary>
    /// Summary description for AddRow
    /// </summary>
    public class AddRow : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string table = context.Request.Form["table"];
            string Rows = context.Request.Form["Rows"];
            string[] split = Rows.Split('|');
            string success = "";
            DCEntities db = new DCEntities();

            switch (table)
            {
                case "cms_user":
                    int parentId = 0;
                    try
                    {
                        int.TryParse(split[10], out parentId);
                    }
                    catch
                    {

                    }
                    string cmsusername = split[0];
                    string cmslowerUsername = cmsusername.ToLower();
                    var cmsfound = db.WebUsers.Where(x => x.Username.ToLower() == cmslowerUsername).FirstOrDefault();
                    if (cmsfound == null)
                    {
                        var cmsfound1 = db.cms_user.Where(x => x.username.ToLower() == cmslowerUsername).FirstOrDefault();
                        if (cmsfound1 == null)
                        {
                            db.cms_user.Add(new cms_user() { username = cmsusername, password = MD5Hash(split[1]), status = int.Parse(split[2]), firstname = split[3], lastname = split[4], phone = split[5], email = split[6], address = split[7], groupId = int.Parse(split[8]), ZoneId = int.Parse(split[9]), parentId = parentId });
                            success = "success";
                        }
                        else
                        {
                            success = "The username you chose exists, please use another one";
                        }
                    }
                    else
                    {
                        success = "The username you chose exists, please use another one";
                    }
                    
                    break;
                case "cms_groups":
                    db.cms_groups.Add(new cms_groups() { name = split[0] });
                    success = "success";
                    break;
                case "WebUser":

                    string password = split[6];//System.Web.Security.Membership.GeneratePassword(6, 3);
                    string username = split[5];
                    int zoneId = int.Parse(split[3]);
                    var zonemember = db.WebUsers.Where(x => x.ZoneId == zoneId).ToList();
                    long memberId = zonemember.Count + 1;
                    string lowerUsername = username.ToLower();
                    var found = db.WebUsers.Where(x => x.Username.ToLower() == lowerUsername).FirstOrDefault();
                    if (found == null)
                    {
                        var found1 = db.cms_user.Where(x => x.username.ToLower() == lowerUsername).FirstOrDefault();
                        if (found1 == null)
                        {
                            db.WebUsers.Add(new WebUser { FirstName = split[0], LastName = split[1], Password = password, Username = username, PhoneNumber = split[2], ZoneId = zoneId, UserType = split[4], MemberId = memberId, parentId = int.Parse(split[7]) });
                            success = "success";
                        }
                        else
                        {
                            success = "The username you chose exists, please use another one";
                        }
                    }
                    else
                    {
                        success = "The username you chose exists, please use another one";
                    }
                    break;
            }
            
            db.SaveChanges();
            context.Response.Write(success);
        }
        static void BlockIP(string IP)
        {
            using (ServerManager serverManager = new ServerManager())
            {
                Microsoft.Web.Administration.Configuration config = serverManager.GetApplicationHostConfiguration();
                Microsoft.Web.Administration.ConfigurationSection ipSecuritySection = config.GetSection("system.webServer/security/ipSecurity", "BrandsMarketing");
                ConfigurationElementCollection ipSecurityCollection = ipSecuritySection.GetCollection();

                ConfigurationElement addElement = ipSecurityCollection.CreateElement("add");
                addElement["ipAddress"] = IP;
                addElement["allowed"] = false;
                ipSecurityCollection.Add(addElement);

               
                serverManager.CommitChanges();
            }
        }
        public static string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();

            //compute hash from the bytes of text
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

            //get hash result after compute it
            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                //change it into 2 hexadecimal digits
                //for each byte
                strBuilder.Append(result[i].ToString("x2"));
            }

            return strBuilder.ToString();
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public string  GetMonthName(int monthNum )
        {
            try
            {
                DateTime strDate = new DateTime(1, monthNum, 1);
                return strDate.ToString("MMM");
            }
            catch( Exception ex ) 
            {
                return "";
            }
        
        }
    }
}