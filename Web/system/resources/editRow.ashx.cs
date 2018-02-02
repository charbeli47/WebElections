using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Web.resources
{
    /// <summary>
    /// Summary description for editRow
    /// </summary>
    public class editRow : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string name = context.Request.Form["name"];
            string value = context.Request.Form["value"];
            int pk = int.Parse(context.Request.Form["pk"]);
            string success = "";
            string table = context.Request.QueryString["table"];
            if (table == null)
                table = context.Request.Form["table"];
            DCEntities db = new DCEntities();
            switch (table)
            {
                case "cms_user":
                    var user = db.cms_user.Where(x => x.id == pk).SingleOrDefault();
                    if (name.Contains("username"))
                        user.username = value;
                    else if (name.Contains("cmsgroup"))
                        user.groupId = int.Parse(value);
                    else if (name.Contains("status"))
                        user.status = int.Parse(value);
                    else if (name.Contains("password"))
                        user.password = MD5Hash(value);
                    else if (name.Contains("firstname"))
                        user.firstname = value;
                    else if (name.Contains("lastname"))
                        user.lastname = value;
                    else if (name.Contains("email"))
                        user.email = value;
                    else if (name.Contains("phone"))
                        user.phone = value;
                    else if (name.Contains("address"))
                        user.address = value;
                    else if (name.Contains("parentId"))
                        user.parentId = int.Parse(value);
                    success = "success";
                    break;
                case "cms_groups":
                    var group = db.cms_groups.Where(x => x.id == pk).SingleOrDefault();
                    group.name = value;
                    success = "success";
                    break;
                case "WebUsers":
                    var webuser = db.WebUsers.Where(x => x.id == pk).SingleOrDefault();
                    if (name.Contains("FirstName"))
                        webuser.FirstName = value;
                    else if (name.Contains("LastName"))
                        webuser.LastName = value;
                    else if (name.Contains("Username"))
                        webuser.Username = value;
                    else if (name.Contains("Password"))
                        webuser.Password = value;
                    else if (name.Contains("Phone"))
                        webuser.Password = value;
                    else if (name.Contains("Type"))
                        webuser.UserType = value;
                    else if (name.Contains("Zone"))
                    {
                        int zoneId = int.Parse(value);
                        if (webuser.ZoneId!=zoneId)
                        {
                            var zonemember = db.WebUsers.Where(x => x.ZoneId == zoneId).ToList();
                            long memberId = zonemember.Count + 1;
                            webuser.MemberId = memberId;
                        }
                        webuser.ZoneId = zoneId;
                    }
                    else if (name.Contains("parentId"))
                        webuser.parentId = int.Parse(value);
                    break;


            }
            db.SaveChanges();
            context.Response.Write(success);
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
    }
}