using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.resources
{
    public partial class hcmsusers : System.Web.UI.Page
    {
        protected List<cms_user> users;
        protected List<cms_groups> groups;
        protected string zonesList;
        protected List<Zone> zones;
        protected void Page_Load(object sender, EventArgs e)
        {
            DCEntities db = new DCEntities();
            int opId = int.Parse(Request["opId"]);
            bool perm = Permissions.Check(opId, "H Users", "view");
            if (!perm)
                Response.Write("<script>getContent('accessdenied.html');</script>");
            else
            {
                var user = db.cms_user.Where(x => x.id == opId).SingleOrDefault();
                string groupname = db.cms_groups.Where(x => x.id == user.groupId).Single().name.ToLower();
                users = db.cms_user.Where(x => x.cms_groups.name.ToLower().Contains("h")).ToList();
                if (!groupname.ToLower().Contains("admin"))
                {
                    
                    groups = db.cms_groups.Where(x => !x.name.ToLower().Contains("admin")).ToList();
                }
                else
                {
                    groups = db.cms_groups.ToList();
                }
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