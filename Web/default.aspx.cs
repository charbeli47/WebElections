using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class _default2 : System.Web.UI.Page
    {
        protected IQueryable<string> streets;
        protected List<WebUsersSearchList> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
                Response.Redirect("login.aspx");
            else
            {
                int userId = int.Parse(HttpContext.Current.User.Identity.Name);
                DCEntities db = new DCEntities();
                var usr = db.WebUsers.Where(x => x.id == userId).SingleOrDefault();
                if (usr != null)
                {
                    streets = db.SearchLists.Select(m => m.street).Distinct();
                    //segels = db.SearchLists.Select(x => x.segel).Distinct();
                    // firstnames = db.SearchLists.Select(x => x.FirstName).Distinct();
                    //lastnames = db.SearchLists.Select(x => x.LastName).Distinct();
                    //middlenames = db.SearchLists.Select(x => x.MiddleName).Distinct();
                    //mothernames = db.SearchLists.Select(x => x.MotherName).Distinct();
                    list = db.WebUsersSearchLists.Where(x => x.WebUserId == usr.id).ToList();
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }
    }
}