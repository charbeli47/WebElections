using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.resources
{
    public partial class subgs : System.Web.UI.Page
    {
        protected List<cms_user> users;
        protected cms_user parentuser;
        protected List<cms_groups> groups;
        protected string zonesList, parentsList;
        protected List<Zone> zones;
        protected DCEntities db = new DCEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int opId = int.Parse(Request["opId"]);
            int pageId = int.Parse(Request["pageId"]);
            bool perm = Permissions.Check(opId, "GS Users", "view");
            if (!perm)
                Response.Write("<script>getContent('accessdenied.html');</script>");
            else
            {
                var me = db.cms_user.Where(x => x.id == opId).SingleOrDefault();
                string groupname = db.cms_groups.Where(x => x.id == me.groupId).Single().name.ToLower();
                users = db.cms_user.Where(x => x.cms_groups.name.ToLower().Contains("gs") && x.parentId == pageId).ToList();
                parentuser = db.cms_user.Where(x => x.id == pageId).SingleOrDefault();
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