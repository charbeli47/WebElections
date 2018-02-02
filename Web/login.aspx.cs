using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DCEntities db = new DCEntities();
            if (IsPostBack)
            {
                string user = Request.Form["user"];
                string pass = Request.Form["pass"];
                if (!string.IsNullOrEmpty(user) && !string.IsNullOrEmpty(pass))
                {
                    string loweruser = user.ToLower();
                    var usr = db.WebUsers.Where(x => x.Username.ToLower() == loweruser && x.Password == pass).SingleOrDefault();
                    if (usr != null)
                    {
                        FormsAuthentication.SetAuthCookie(usr.id.ToString(), true);
                        Response.Redirect("~/");
                    }
                    else
                    {
                        respMsg.Text = "<script>$(\"#output\").removeClass(' alert alert-success');$(\"#output\").addClass(\"alert alert-danger animated fadeInUp\").html(\"اسم مستخدم غير صالح أو كلمة مرور غير صالحة\");</script>";
                    }
                }
                else
                {
                    respMsg.Text = "<script>$(\"#output\").removeClass(' alert alert-success');$(\"#output\").addClass(\"alert alert-danger animated fadeInUp\").html(\"يرجى ملء اسم المستخدم وكلمة المرور \");</script>";
                }
            }
        }
    }
}