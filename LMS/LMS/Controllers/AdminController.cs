using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LMS.Models;

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
        public ActionResult RegisterStudent()
        {
            DB49Entities1 k = new DB49Entities1();
           
            List<Department> departments = k.Departments.ToList();
            ViewBag.DepartmentList = new SelectList(departments, "DepartmentID", "DepartmentName ");
            List<Session> sessions = k.Sessions.ToList();
            ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");


            return View();
        }
        [HttpPost]
        public ActionResult RegisterStudent(Student obj)
        {

            try
            {
                DB49Entities1 db = new DB49Entities1();

                List<Department> list = db.Departments.ToList();
                ViewBag.DepartmentList = new SelectList(list, "DepartmentID", "DepartmentName");
                List<Session> list2 = db.Sessions.ToList();
                ViewBag.SessionList = new SelectList(list2, "SessionID", "Session1");
                Student k = new Student();
                Login site = new Login();
                site.Email = obj.EmailId;
                site.Password = obj.Password;
                site.Type = "stu";
                string message = string.Empty;
               // using (HMSEntities k = new HMSEntities())
                    if (db.Logins.Any(x => x.Email == obj.EmailId))
                    {  //{
                       //  ViewData["error"] = "User Already exits";

                        message = "Email is already taken register with another EmailID";
                        //   // return View("StuRegister",)
                        // return RedirectToAction("Login");
                        //    ViewBag.ErrorMessage = "Email not found or matched"
                        //return View();
                    }
                    else
                    {
                        db.Logins.Add(site);
                        db.SaveChanges();

                        k.Name = obj.Name;
                    k.EmailId = obj.EmailId;
                    k.Password = obj.Password;
                        k.FatherName = obj.FatherName;
                        k.Address = obj.Address;
                        k.PhoneNumber = obj.PhoneNumber;
                        k.DOB = obj.DOB;
                        k.DepartmentID = obj.DepartmentID;
                        k.PhoneNumber = obj.PhoneNumber;
                        k.RegistrationNumber = obj.RegistrationNumber;
                        k.CNIC = obj.CNIC;
                    //    k.Login.Type = "stu";
                    k.LoginID = obj.LoginID;



                        int latestid = site.LoginID;

                        k.LoginID = site.LoginID;


                        k.Address = obj.Address;
                        //  k.DOB = obj.Address;

                        k.SessionId = obj.SessionId;
                        //    k.Designation = obj.Designation;


                        //  k.Login.LoginID = obj.LoginID;
                        //k.StudentID = latestid;



                        db.Students.Add(k);
                        db.SaveChanges();
                        message = "Registration successful.\\nUser Id: " + site.LoginID.ToString();
                        //    return RedirectToAction("Login");

                        ////  int lateststuID = k.StudentID;

                        //  }

                        ViewBag.Message = message;
                    }
            }
            catch (DbEntityValidationException e)
            {


                Console.WriteLine(e.ToString());

            }


            return View(obj);
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Login l)

        {
            if (l.Email == "Admin" && l.Password == "A123")
            {
                return RedirectToAction("Result", "Admin");
            }
           
            else
            {
                using (DB49Entities1 db = new DB49Entities1())
                {
                    var s = Login.GetCBLoginInfo(model.UserName, model.Password);

                    var item = s.FirstOrDefault();
                    // var j = db.Logins.Where(x => x.Email == l.Email && x.Password == l.Password);// (from Login in db.Logins where Login.Email == l.Email && Login.Password == l.Password select Login.Type);
                    var v =j.FirstOrDefault();

                    //var v = db.Logins.Where(x => x.Email == l.Email && x.Password == l.Password).FirstOrDefault();
                    if (v != null)

                    {

                        var k = db.Students.Where(d => d.Login.Type == l.Type && d.EmailId == l.Email).FirstOrDefault();


                        if (k != null)
                        {

                            //Session["LoginID"] = k.LoginID.ToString();
                            //Session["Name"] = k.Name.ToString();
                            //Session["StudentID"] = k.StudentId.ToString();
                            //Session["RegistrationNumber"] = k.RegistrationNumber.ToString();
                            //Session["PhoneNumber"] = k.PhoneNumber.ToString();
                            //Session["Session"] = k.Session.ToString();
                            //Session["Address"] = k.Address.ToString();
                            //Session["DOB"] = k.DOB.ToString();
                            //Session["Department"] = k.Department.DepartmentID.ToString();
                            return RedirectToAction("Exam", "Admin");
                        }
                        else if (k == null)
                        {
                            return RedirectToAction("Result", "Admin");
                        }
                        else
                        {
                            string message;
                            message = ("Invalid Login Attempt");
                            ViewBag.Message = message;

                        }
                    }
                    else
                    {
                        return RedirectToAction("Result", "Admin");
                    }

                }
            }
            return View(l);
        }

    }
}
    
