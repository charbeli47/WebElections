using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.system.resources
{
    /// <summary>
    /// Summary description for downloadExcel
    /// </summary>
    public class downloadExcel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/ms-excel";
            string attach = "attachment;filename=transactions.xls";
            context.Response.ClearContent();
            context.Response.AddHeader("content-disposition", attach);
            string headers = "الاسم\tاسم الاب\tالشهرة\tاسم الام\tطائفة اللائحة\tالبلدة او الحي\tرقم السجل\tالجنس\tتاريخ الولادة\tرقم الهاتف\tالبريد الإلكتروني\tعنوان السكن\tالمرجع\tالخصائص";
            context.Response.Write(headers);
            context.Response.Write(System.Environment.NewLine);
            DCEntities db = new DCEntities();
            if (!string.IsNullOrEmpty(context.Request["userId"]))
            {
                int userId = int.Parse(context.Request["userId"]);
                
                var results = db.WebUsersSearchLists.Where(x => x.WebUserId == userId).OrderByDescending(x => x.id).ToList();
                foreach (var row in results)
                {
                    context.Response.Write(row.SearchList.ta2ifa + "\t" + row.SearchList.street + "\t" + row.SearchList.segel + "\t" + row.SearchList.Gender + "\t" + row.SearchList.FirstName + "\t" + row.SearchList.LastName + "\t" + row.SearchList.MiddleName + "\t" + row.SearchList.MotherName + "\t" + string.Format("{0:dd/MM/yyyy}", row.SearchList.DOB) + "\t" + row.Phone + "\t" + row.Email + "\t" + row.sakan + "\t" + row.marga3 + "\t" + row.Khasa2iss + "\n");
                }
            }
            else
            {
                var results = db.WebUsersSearchLists.OrderByDescending(x => x.id).ToList();
                foreach (var row in results)
                {
                    context.Response.Write(row.SearchList.ta2ifa + "\t" + row.SearchList.street + "\t" + row.SearchList.segel + "\t" + row.SearchList.Gender + "\t" + row.SearchList.FirstName + "\t" + row.SearchList.LastName + "\t" + row.SearchList.MiddleName + "\t" + row.SearchList.MotherName + "\t" + string.Format("{0:dd/MM/yyyy}", row.SearchList.DOB) + "\t" + row.Phone + "\t" + row.Email + "\t" + row.sakan + "\t" + row.marga3 + "\t" + row.Khasa2iss + "\n");
                }
            }
            context.Response.End();
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