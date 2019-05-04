using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LMS.Models;
using System.Net;
using System.Data.Entity.Validation;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;

namespace LMS.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
    
        public ActionResult StudentDetails()
        {
            if (Session["LoginID"] != null)
            {
                return View();

            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }

        }

        public ActionResult ShowFee()
        {
            DB49Entities db = new DB49Entities();
            //  List<Fee> p = new List<Fee>();
            //Fee o = new Fee();
            //p = db.Fees.ToList();
            return View(db.Fees.ToList());
        }


        public ActionResult ReportFee()
        {
            DB49Entities db = new DB49Entities();
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "CrystalReportFee.rpt"));
            rd.SetDataSource(db.Fees.ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "Fee_list.pdf");

            }
            catch
            {
                throw;
            }
        }

      

        public ActionResult UpFeeChallan()
        {

            if (Session["FeeID"] != null)
            {
                return View();

            }
            else
            {
                return RedirectToAction("UpdateFee", "Admin");
            }
        }


        public ActionResult ShowStuResult()
        {

            if (Session["ResultID"] != null)
            {
                return View();

            }
            else
            {
                return RedirectToAction("Result", "Admin");
            }
        }


    }
}