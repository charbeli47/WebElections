using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.resources
{
    public partial class useractivity : System.Web.UI.Page
    {
        protected List<WebUsersSearchList> results;
        protected WebUser user;
        protected void Page_Load(object sender, EventArgs e)
        {
            DCEntities db = new DCEntities();
            int opId = int.Parse(Request["opId"]);
            int pageId = int.Parse(Request["pageId"]);
            bool perm = Permissions.Check(opId, "Web Users", "view");
            if (!perm)
                Response.Write("<script>getContent('accessdenied.html');</script>");
            else
            {
                results = db.WebUsersSearchLists.Where(x=>x.WebUserId == pageId).OrderByDescending(x=>x.id).ToList();
                user = db.WebUsers.Where(x => x.id == pageId).SingleOrDefault();
            }
        }
    }
}