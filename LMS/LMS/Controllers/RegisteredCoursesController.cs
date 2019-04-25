using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LMS.Controllers
{
    public class RegisteredCoursesController : Controller
    {
        // GET: RegisteredCourses
        public ActionResult Index()
        {
            return View();
        }
    }
}