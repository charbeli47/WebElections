using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.resources
{
    public partial class gs : System.Web.UI.Page
    {
        protected List<cms_user> husers;
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
                husers = db.cms_user.Where(x => x.cms_groups.name.ToLower().Contains("gs") && x.parentId == user.id).ToList();
            }
        }
    }
}