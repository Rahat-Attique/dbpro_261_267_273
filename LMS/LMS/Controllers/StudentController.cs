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
        DB49Entities1 db = new DB49Entities1();
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
        public ActionResult viewattendance(int id)
        {
            List<string> StudentList = new List<string>();
            ClassAttendance a = new ClassAttendance();
            foreach (ClassAttendance s in db.ClassAttendances)
            {
                var v = db.ClassAttendances.Where(x => x.StudentID == id).ToList();
                foreach (var item in v)
                {
                    a.StudentList.Add(item);
                }

            }

            return View(a);
        }
        public ActionResult ShowFee()
        {
            DB49Entities1 db = new DB49Entities1();
            //  List<Fee> p = new List<Fee>();
            //Fee o = new Fee();
            //p = db.Fees.ToList();
            return View(db.Fees.ToList());
        }


        public ActionResult ReportFee()
        {
            DB49Entities1 db = new DB49Entities1();
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