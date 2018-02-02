using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.resources
{
    public partial class vlist : System.Web.UI.Page
    {
        protected List<WebUsersSearchList> results;
        protected WebUser user;
        protected void Page_Load(object sender, EventArgs e)
        {
            DCEntities db = new DCEntities();
            int opId = int.Parse(Request["opId"]);
            bool perm = Permissions.Check(opId, "V List", "view");
            if (!perm)
                Response.Write("<script>getContent('accessdenied.html');</script>");
            else
            {
                results = db.WebUsersSearchLists.OrderByDescending(x=>x.id).ToList();
            }
        }
    }
}