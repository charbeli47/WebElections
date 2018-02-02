using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.resources
{
    public partial class s : System.Web.UI.Page
    {
        protected List<WebUser> results;
        protected string zonesList;
        protected List<Zone> zones;
        protected cms_user user;
        protected void Page_Load(object sender, EventArgs e)
        {
            DCEntities db = new DCEntities();
            int opId = int.Parse(Request["opId"]);
            int pageId = int.Parse(Request["pageId"]);
            bool perm = Permissions.Check(opId, "Analytics", "view");
            if (!perm)
                Response.Write("<script>getContent('accessdenied.html');</script>");
            else
            {
                user = db.cms_user.Where(x => x.id == pageId).SingleOrDefault();
                var me = db.cms_user.Where(x => x.id == opId).SingleOrDefault();
                
                results = db.WebUsers.Where(x => x.UserType == "S" && x.parentId == user.id).OrderByDescending(x=>x.id).ToList();
                if (me.cms_groups.name.Contains("h"))
                {
                    results = results.Where(x => x.cms_user.parentId == user.id).ToList();
                }
                else if (me.cms_groups.name.Contains("gs"))
                {
                    results = results.Where(x => x.parentId == user.id).ToList();
                }
            }
        }
    }
}