using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.system.resources
{
    /// <summary>
    /// Summary description for editCMSUser
    /// </summary>
    public class editCMSUser : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int userId = int.Parse(context.Request["userId"]);
            int groupId = int.Parse(context.Request["groupId" + userId]);
            int zoneId = int.Parse(context.Request["zoneId" + userId]);
            DCEntities db = new DCEntities();
            var user = db.cms_user.Where(x => x.id == userId).SingleOrDefault();
            user.groupId = groupId;
            user.ZoneId = zoneId;
            db.SaveChanges();
            context.Response.Write("success");
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