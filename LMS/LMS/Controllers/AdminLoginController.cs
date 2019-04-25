using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LMS.Controllers
{
    public class AdminLoginController : Controller
    {
        // GET: AdminLogin
        public ActionResult AdminLogin()
        {
            return View();
        }
        public ActionResult StudentLogin()
        {
            return View();
        }
        public ActionResult EmployeeLogin()
        {
            return View();
        }
    }
}