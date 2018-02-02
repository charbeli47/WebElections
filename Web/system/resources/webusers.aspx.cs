using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.resources
{
    public partial class webusers : System.Web.UI.Page
    {
        protected List<WebUser> results;
        protected string zonesList, parentsList;
        protected List<Zone> zones;
        protected List<cms_user> parents;
        protected void Page_Load(object sender, EventArgs e)
        {
            DCEntities db = new DCEntities();
            int opId = int.Parse(Request["opId"]);
            bool perm = Permissions.Check(opId, "S Users", "view");
            if (!perm)
                Response.Write("<script>getContent('accessdenied.html');</script>");
            else
            {
                results = db.WebUsers.Where(x => x.UserType == "S").OrderByDescending(x=>x.id).ToList();
                parents = db.cms_user.Where(x => x.cms_groups.name.ToLower().Contains("gs")).ToList();
                zones = db.Zones.ToList();
                selectzone.DataSource = zones;
                selectzone.DataTextField = "ZoneName";
                selectzone.DataValueField = "id";
                selectzone.DataBind();
                selectparent.DataSource = parents;
                selectparent.DataTextField = "username";
                selectparent.DataValueField = "id";
                selectparent.DataBind();
                foreach (Zone z in zones)
                {
                    zonesList += ",{ value: " + z.id + ", text: '" + z.ZoneName.Replace("\r\n","").Replace("\n","") + "' }";
                }
                if (zonesList.Length > 0)
                    zonesList = zonesList.Substring(1);
                foreach (cms_user u in parents)
                {
                    parentsList += ",{ value: " + u.id + ", text: '" + u.username + "' }";
                }
                if (parentsList.Length > 0)
                    parentsList = parentsList.Substring(1);
            }
        }
    }
}