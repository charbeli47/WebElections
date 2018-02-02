using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.resources
{
    public partial class subs : System.Web.UI.Page
    {
        protected List<WebUser> results;
        protected cms_user user;
        protected string zonesList;
        protected List<Zone> zones;

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
                results = db.WebUsers.Where(x => x.UserType == "S" && x.parentId == pageId).OrderByDescending(x => x.id).ToList();
                user = db.cms_user.Where(x => x.id == pageId).SingleOrDefault();
                zones = db.Zones.ToList();
                selectzone.DataSource = zones;
                selectzone.DataTextField = "ZoneName";
                selectzone.DataValueField = "id";
                selectzone.DataBind();
                foreach (Zone z in zones)
                {
                    zonesList += ",{ value: " + z.id + ", text: '" + z.ZoneName.Replace("\r\n", "").Replace("\n", "") + "' }";
                }
                if (zonesList.Length > 0)
                    zonesList = zonesList.Substring(1);
            }
        }
    }
}