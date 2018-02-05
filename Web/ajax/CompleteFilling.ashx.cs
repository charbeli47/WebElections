using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Web.ajax
{
    /// <summary>
    /// Summary description for CompleteFilling
    /// </summary>
    public class CompleteFilling : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            string segel = context.Request["segel"];
            string FirstName = context.Request["FirstName"];
            string MiddleName = context.Request["MiddleName"];
            string LastName = context.Request["LastName"];
            DCEntities db = new DCEntities();
            JavaScriptSerializer js = new JavaScriptSerializer();
            var searchLists = db.SearchLists.AsQueryable();
            if (!string.IsNullOrEmpty(segel))
            {
                searchLists = searchLists.Where(x => x.segel.ToLower().Contains(segel));
            }
            if (!string.IsNullOrEmpty(FirstName))
            {
                searchLists = searchLists.Where(x => x.FirstName.ToLower().Contains(FirstName));
            }
            if (!string.IsNullOrEmpty(MiddleName))
            {
                searchLists = searchLists.Where(x => x.MiddleName.ToLower().Contains(MiddleName));
            }
            if (!string.IsNullOrEmpty(LastName))
            {
                searchLists = searchLists.Where(x => x.LastName.ToLower().Contains(LastName));
            }
            List<CompleteFillingObj> results = new List<CompleteFillingObj>();
            foreach(var row in searchLists)
            {
                results.Add(new CompleteFillingObj { DOB = string.Format("{0:dd/MM/yyyy}", row.DOB), FirstName = row.FirstName.Replace("\r\n",""), Gender = row.Gender.Replace("\r\n", ""), id = row.id, LastName = row.LastName.Replace("\r\n", ""), MiddleName = row.MiddleName.Replace("\r\n", ""), MotherName = row.MotherName.Replace("\r\n", ""), segel = row.segel.Replace("\r\n", ""), street = row.street.Replace("\r\n",""), ta2ifa = row.ta2ifa.Replace("\r\n", ""), VoterID = row.VoterID });
            }
            context.Response.Write(js.Serialize(results));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
    public class CompleteFillingObj
    {
        public int id { get; set; }
        public string ta2ifa { get; set; }
        public string street { get; set; }
        public string segel { get; set; }
        public string Gender { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string MotherName { get; set; }
        public string DOB { get; set; }
        public string VoterID { get; set; }
    }
}