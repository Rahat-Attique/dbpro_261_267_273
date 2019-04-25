using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LMS.Controllers
{
    public class ShowRegisteredCoursesController : Controller
    {
        // GET: ShowRegisteredCourses
        public ActionResult Index()
        {
            return View();
        }
    }
}