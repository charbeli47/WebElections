using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.resources
{
    public partial class analytics : System.Web.UI.Page
    {
        protected List<cms_user> husers;
        protected void Page_Load(object sender, EventArgs e)
        {
            DCEntities db = new DCEntities();
            int opId = int.Parse(Request["opId"]);
            bool perm = Permissions.Check(opId, "Analytics", "view");
            if (!perm)
                Response.Write("<script>getContent('accessdenied.html');</script>");
            else
            {
                var user = db.cms_user.Where(x => x.id == opId).SingleOrDefault();
                string groupname = db.cms_groups.Where(x => x.id == user.groupId).Single().name.ToLower();
                husers = db.cms_user.Where(x => x.cms_groups.name.ToLower().Contains("h")).ToList();
            }
        }
    }
}