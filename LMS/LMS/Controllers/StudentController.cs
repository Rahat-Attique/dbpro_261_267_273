using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LMS.Models;
using System.Net;
using System.Data.Entity.Validation;


namespace LMS.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        public ActionResult Index()
        {
            return View();
        }
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
            DB49Entities4 db = new DB49Entities4();
            List<Fee> p = new List<Fee>();
            Fee o = new Fee();
            p = db.Fees.ToList();
            return View(p);
        }

        public ActionResult UpFeeChallan()
        {
            DB49Entities4 db = new DB49Entities4();
            List<Fe> p = new List<Fe>();
            Fe o = new Fe();
            p = db.Fes.ToList();
            return View(p);
        }





    }
}