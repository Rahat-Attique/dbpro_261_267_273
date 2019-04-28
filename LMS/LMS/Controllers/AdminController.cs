using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LMS.Models;
using System.Net;

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
            //DB49Entities4 db = new DB49Entities4();
            //List<Department> departments = db.Departments.ToList();
            //ViewBag.DepartmentList = new SelectList(departments, "DepartmentID", "DepartmentName");

            //List<Session> sessions = db.Sessions.ToList();
            //ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");
            return View();
        }
        [HttpPost]
        public ActionResult Courses(Course obj)
        {
            try
            {
                string message;
                DB49Entities4 db = new DB49Entities4();
                List<Department> departments = db.Departments.ToList();
                ViewBag.DepartmentList = new SelectList(departments, "DepartmentID", "DepartmentName");

                List<Session> sessions = db.Sessions.ToList();
                ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");
                // Student l = new Student();
                Course c = new Course();
                Department s = new Department();
                Session n = new Session();
                //c.StatusID = 1;
                // s.Date = DateTime.Now;
                db.Sessions.Add(n);
                db.Departments.Add(s);
                db.SaveChanges();
                c.CourseName = obj.CourseName;
                c.DepartmentID = obj.DepartmentID;
                c.SessionID = obj.SessionID;
                c.CreditHours = obj.CreditHours;


                db.Courses.Add(c);
                db.SaveChanges();
                Session[" CourseID"] = c.CourseID.ToString();
                message = " Course Added Successfully.\\nCourse Id:" + c.CourseID.ToString();
                ViewBag.Message = message;
            }

            catch (DbEntityValidationException e)
            {


                Console.WriteLine(e.ToString());

            }
            return View(obj);
        }

        public ActionResult Exam()
        {
            DB49Entities4 db = new DB49Entities4();
            List<Course> co = db.Courses.ToList();
            ViewBag.courseList = new SelectList(co, "CourseID", "CourseName");

            List<Session> sessions = db.Sessions.ToList();
            ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");
            return View();





        }
        [HttpPost]
        public ActionResult Exam(Exam obj)
        {
            try
            {
                string message;
                DB49Entities4 r = new DB49Entities4();
                List<Course> co = r.Courses.ToList();
                ViewBag.courseList = new SelectList(co, "CourseID", "CourseName");

                List<Session> sessions = r.Sessions.ToList();
                ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");

             
                Exam ex = new Exam();
                Course c = new Course();
              
                Session n = new Session();
                
                r.Sessions.Add(n);
                r.Courses.Add(c);
                r.SaveChanges();

                ex.ExamDate = obj.ExamDate;
                ex.CourseID = obj.CourseID;
                ex.SessionID = obj.SessionID;

                r.Exams.Add(ex);
                r.SaveChanges();


                Session[" ExamID"] = ex.ExamID.ToString();
                message = " Course Added Successfully.\\nExam Id:" + ex.ExamID.ToString();
                ViewBag.Message = message;
            }

            catch (DbEntityValidationException e)
            {


                Console.WriteLine(e.ToString());

            }
            return View(obj);


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
            DB49Entities4 db = new DB49Entities4();
            List<Course> p = new List<Course>();
            Course o = new Course();
            p = db.Courses.ToList();
            return View(p);
           
        }


        [HttpGet]
        public ActionResult EditCourse(int id)
        {
            using (DB49Entities4 db = new DB49Entities4())
            {
                List<Department> departments = db.Departments.ToList();
                ViewBag.DepartmentList = new SelectList(departments, "DepartmentID", "DepartmentName");

                List<Session> sessions = db.Sessions.ToList();
                ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    
                }
                Course user = db.Courses.Find(id);
                if (user == null)
                {
                    return HttpNotFound();
                }
                return View(user);
            }
        }

        [HttpPost, ActionName("EditCourse")]
        public ActionResult EditCourse(Course obj, int id)
        {

            using (DB49Entities4 db = new DB49Entities4())
            {
                List<Department> departments = db.Departments.ToList();
                ViewBag.DepartmentList = new SelectList(departments, "DepartmentID", "DepartmentName");

                List<Session> sessions = db.Sessions.ToList();
                ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");
                Course user = db.Courses.Where(a => a.CourseID == id).FirstOrDefault();
                user.CourseName = obj.CourseName;
                user.DepartmentID = obj.DepartmentID;
                user.SessionID = obj.SessionID;
                user.CreditHours = obj.CreditHours;


                //  k.Complain.StatusID = obj.StatusID;



                //db.Comments.Add(k);
                db.SaveChanges();


            }
            return View(obj);
        }


        public ActionResult ShowExam()
        {
            return View();
        }
        public ActionResult RegisterStudent()
        {
            DB49Entities4 k = new DB49Entities4();
           
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
                DB49Entities4 db = new DB49Entities4();

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
                using (DB49Entities4 db = new DB49Entities4())
                {
                   
                     var j = db.Logins.Where(x => x.Email == l.Email && x.Password == l.Password);// (from Login in db.Logins where Login.Email == l.Email && Login.Password == l.Password select Login.Type);
                    var v = j.FirstOrDefault();

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
        public ActionResult AddScholarship()
        {
            return View();
        }
        public ActionResult ShowStudnet()
        {
            return View();
        }
        public ActionResult ShowEmployee()
        {
            return View();
        }



    }
}
    
