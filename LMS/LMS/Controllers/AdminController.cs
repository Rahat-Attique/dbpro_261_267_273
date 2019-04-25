using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LMS.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult AdminReports()
        {
            return View();
        }
        public ActionResult Courses()
        {
            return View();
        }
        public ActionResult Exam()
        {
            return View();
        }
        public ActionResult Result()
        {
            return View();
        }
        public ActionResult ShowResult()
        {
            return View();
        }
        public ActionResult StudentResult()
        {
            return View();
        }
        public ActionResult ShowCourses()
        {
            return View();
        }
        public ActionResult ShowExam()
        {
            return View();
        }
    }
}