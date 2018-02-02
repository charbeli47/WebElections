using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Web.ajax
{
    /// <summary>
    /// Summary description for AddRow
    /// </summary>
    public class AddRow : IHttpHandler, IRequiresSessionState, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            DCEntities db = new DCEntities();
            var street = context.Request["street"];
            var segel = context.Request["segel"];
            var Gender = context.Request["Gender"];
            var FirstName = context.Request["FirstName"];
            var MiddleName = context.Request["MiddleName"];
            var LastName = context.Request["LastName"];
            var MotherName = context.Request["MotherName"];
            string Phone = context.Request["Phone"];
            //string VoterID = context.Request["VoterID"];
            string Email = context.Request["Email"];
            string Khasa2iss = context.Request["Khasa2iss"];
            string sakan = context.Request["sakan"];
            string marga3 = context.Request["marga3"];
            int userId = int.Parse(HttpContext.Current.User.Identity.Name);
            var usr = db.WebUsers.Where(x => x.id == userId).SingleOrDefault();
            if (!string.IsNullOrEmpty(context.Request["DOB"]))
            {
                var DOB = DateTime.Parse(context.Request["DOB"]);
                var result = db.SearchLists.Where(x=>x.DOB == DOB && x.LastName == LastName && x.FirstName == FirstName && x.Gender == Gender && x.MiddleName == MiddleName && x.MotherName == MotherName && x.segel == segel && x.street == street).FirstOrDefault();
                if(result!=null)
                {
                    db.WebUsersSearchLists.Add(new WebUsersSearchList { SearchListId = result.id, WebUserId = usr.id, Email = Email, Khasa2iss = Khasa2iss, Phone = Phone, sakan = sakan, marga3 = marga3 });
                    db.SaveChanges();
                    context.Response.Write("success");
                }
                else
                    context.Response.Write("failure");
            }
            else
            {
                context.Response.Write("failure");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}