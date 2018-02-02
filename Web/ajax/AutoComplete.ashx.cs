using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Web.ajax
{
    /// <summary>
    /// Summary description for AutoComplete
    /// </summary>
    public class AutoComplete : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            string type = context.Request["type"];
            string query = context.Request["query"].ToLower();
            string segel = context.Request["segel"];
            string FirstName = context.Request["FirstName"];
            string MiddleName = context.Request["MiddleName"];
            string LastName = context.Request["LastName"];
            string MotherName = context.Request["MotherName"];
            IQueryable<string> result;
            DCEntities db = new DCEntities();
            JavaScriptSerializer js = new JavaScriptSerializer();
            var searchLists = db.SearchLists.AsQueryable();
            if(!string.IsNullOrEmpty(segel))
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
            if (!string.IsNullOrEmpty(MotherName))
            {
                searchLists = searchLists.Where(x => x.MotherName.ToLower().Contains(MotherName));
            }
            switch (type)
            {
                case "segels":
                    result = searchLists.Where(x => x.segel.ToLower().Contains(query)).Select(m => m.segel).Distinct();
                    context.Response.Write(js.Serialize(result));
                    break;
                case "firstnames":
                    result = searchLists.Where(x => x.FirstName.ToLower().Contains(query)).Select(m => m.FirstName).Distinct();
                    context.Response.Write(js.Serialize(result));
                    break;
                case "lastnames":
                    result = searchLists.Where(x => x.LastName.ToLower().Contains(query)).Select(m => m.LastName).Distinct();
                    context.Response.Write(js.Serialize(result));
                    break;
                case "middlenames":
                    result = searchLists.Where(x => x.MiddleName.ToLower().Contains(query)).Select(m => m.MiddleName).Distinct();
                    context.Response.Write(js.Serialize(result));
                    break;
                case "mothernames":
                    result = searchLists.Where(x => x.MotherName.ToLower().Contains(query)).Select(m => m.MotherName).Distinct();
                    context.Response.Write(js.Serialize(result));
                    break;
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