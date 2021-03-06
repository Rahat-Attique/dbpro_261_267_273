﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LMS.Models;
using System.Net;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;

namespace LMS.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult AdminReports()
        {
            return View();

        }
        public ActionResult Allstt()
        {
            DB49Entities db = new DB49Entities();
            return View(db.Students.ToList());
        }
        public ActionResult Allmpp()
        {
            DB49Entities db = new DB49Entities();
            return View(db.Employees.ToList());
        }
        public ActionResult Courses()
        {
            DB49Entities db = new DB49Entities();
            List<Department> departments = db.Departments.ToList();
            ViewBag.DepartmentList = new SelectList(departments, "DepartmentID", "DepartmentName");

            List<Session> sessions = db.Sessions.ToList();
            ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");
            return View();
        }
        [HttpPost]
        public ActionResult Courses(Course obj)
        {
            try
            {
                string message;
                DB49Entities db = new DB49Entities();
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
                c.Semester = obj.Semester;


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
            DB49Entities db = new DB49Entities();
            List<Course> co = db.Courses.ToList();
            ViewBag.courseList = new SelectList(co, "CourseID", "CourseName");

            List<Session> sessions = db.Sessions.ToList();
            ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");

            List<Department> departments = db.Departments.ToList();
            ViewBag.DepartmentList = new SelectList(departments, "DepartmentId", "DepartmentName");

            return View();





        }
        [HttpPost]
        public ActionResult Exam(Exam obj)
        {
            try
            {
                string message;
                DB49Entities r = new DB49Entities();
                List<Course> co = r.Courses.ToList();
                ViewBag.courseList = new SelectList(co, "CourseID", "CourseName");

                List<Session> sessions = r.Sessions.ToList();
                ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");


                List<Department> departments = r.Departments.ToList();
                ViewBag.DepartmentList = new SelectList(departments, "DepartmentId", "DepartmentName");


                Exam ex = new Exam();
                Course c = new Course();

                Session n = new Session();


                ex.ExamDate = obj.ExamDate;
                ex.CourseID = obj.CourseID;
                ex.SessionID = obj.SessionID;
                ex.DepartmentId = obj.DepartmentId;

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
            DB49Entities db = new DB49Entities();
          
            List<RegisteredCours> q = db.RegisteredCourses.ToList();
            ViewBag.r = new SelectList(q, "RegisteredCourseID", "CourseID");
            List<Student> b = db.Students.ToList();
            ViewBag.u = new SelectList(b, "StudentId", "Name");
         

            return View();


        }
        [HttpPost]
        public ActionResult Result(Result obj)
        {
            try
            {

                DB49Entities db = new DB49Entities();
                Course f = new Course();
                int y = f.CourseID;


                List<RegisteredCours> q = db.RegisteredCourses.ToList();
                ViewBag.r = new SelectList(q, "RegisteredCourseID", "CourseID");
                List<Student> b = db.Students.ToList();
                ViewBag.u = new SelectList(b, "StudentId", "Name");



                Result r = new Result();


                r.Grade = obj.Grade;
                r.CreditHours = obj.CreditHours;

                r.Date = obj.Date;
                r.RegisteredCourseID = obj.RegisteredCourseID;
                r.StudentID = obj.StudentID;
                db.Results.Add(r);
                db.SaveChanges();

                var m = db.Results.Where(n => n.StudentID == obj.StudentID).ToList();

                foreach (var item in m)

                {
                    // var k = db.Students.Select(new Student { EmailId = l.Email  }).ToList();

                    if (item != null)
                    {

                        Session["ResultID"] = r.ResultID.ToString();
                        Session["Grade"] = r.Grade.ToString();
                        Session["CreditHours"] = r.CreditHours.ToString();
                        Session["Date"] = r.Date.ToString();
                        Session["RegisteredCourseID"] = r.RegisteredCourseID.ToString();
                        Session["StudentID"] = r.StudentID.ToString();
                        return RedirectToAction("ShowStuResult", "Student");
                        // message = " Course Registered Successfully.\\nRegisteredCourse Id:" + r.RegisteredCourseID.ToString();
                        //ViewBag.Message = message;




                    }

                }
            }

            catch (DbEntityValidationException e)
            {
                Console.WriteLine(e.ToString());

            }
            return View(obj);



        }


        public ActionResult ShowResult()
        {
            DB49Entities db = new DB49Entities();
            List<Result> p = new List<Result>();
            Result o = new Result();
            p = db.Results.ToList();
            return View(p);


        
        }
        public ActionResult StudentResult()
        {
            return View();
        }
        public ActionResult ShowCourses()
        {
            DB49Entities db = new DB49Entities();
            // List<Course> p = new List<Course>();
            //Course o = new Course();
            //p = db.Courses.ToList();
            //  return View(p);
            return View(db.Courses.ToList());

        }


        public ActionResult ReportCourses()
        {
            DB49Entities db = new DB49Entities();

            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "CrystalReport.rpt"));
            rd.SetDataSource(db.Courses.ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "Course_list.pdf");

            }
            catch
            {
                throw;
            }
        }

        public ActionResult Re()
        {
            DB49Entities db = new DB49Entities();

            var ResultList = db.Results.ToList();
            return View(ResultList);
        }


        public ActionResult ResultReport()
        {
            DB49Entities db = new DB49Entities();
            List<Result> allResults = new List<Result>();
            allResults = db.Results.ToList();


            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "CrystalReportResult.rpt"));

            rd.SetDataSource(allResults);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "ResultList.pdf");



        }


        public ActionResult Ex()
        {
            DB49Entities db = new DB49Entities();

            var ex = db.Exams.ToList();
            return View(ex);
        }


        public ActionResult ExamReport()
        {
            DB49Entities db = new DB49Entities();
            List<Exam> exam = new List<Exam>();
            exam = db.Exams.ToList();


            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "CrystalReportExam.rpt"));

            rd.SetDataSource(exam);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "ExamList.pdf");
        }










        public ActionResult ReportStudent()
        {
            DB49Entities db = new DB49Entities();

            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "CrystalReportStudent.rpt"));
            rd.SetDataSource(db.Students.ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "Student_list.pdf");

            }
            catch
            {
                throw;
            }
        }
        public ActionResult ReportEmp()
        {
            DB49Entities db = new DB49Entities();

            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "CrystalReportEmployee.rpt"));
            rd.SetDataSource(db.Employees.ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "Employee_list.pdf");

            }
            catch
            {
                throw;
            }
        }
        [HttpGet]
        public ActionResult EditCourse(int id)
        {
            using (DB49Entities db = new DB49Entities())
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

            using (DB49Entities db = new DB49Entities())
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
            DB49Entities db = new DB49Entities();
            List<Exam> p = new List<Exam>();
            Exam o = new Exam();
            p = db.Exams.ToList();
            return View(p);
        }
        public ActionResult RegisterStudent()
        {
            DB49Entities k = new DB49Entities();
           
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
                DB49Entities db = new DB49Entities();

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
                    k.Type = "stu";
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
        public ActionResult Reg()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Reg(Employee obj)
        {
            try
            {
                DB49Entities db = new DB49Entities();

                Employee k = new Employee();

                Login site = new Login();
                site.Email = obj.EmailID;
                site.Password = obj.Password;
                site.Type = "emp";
                string message = string.Empty;
                // using (HMSEntities k = new HMSEntities())
                if (db.Logins.Any(x => x.Email == obj.EmailID))
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
                    k.EmailID = obj.EmailID;
                    k.Password = obj.Password;
                    k.FatherName = obj.FatherName;
                    k.Address = obj.Address;
                    k.ContactNumber = obj.ContactNumber;
                    k.DOB = obj.DOB;
                    k.MonthlySalary = obj.MonthlySalary;
                    k.Designation = obj.Designation;

                    k.CNIC = obj.CNIC;
                    k.Type = "emp";
                    //    k.Login.Type = "stu";
                    k.LoginID = obj.LoginID;



                    int latestid = site.LoginID;

                    k.LoginID = site.LoginID;






                    db.Employees.Add(k);
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
            if (l.Email == "Admin@gmail" && l.Password == "A123")
            {
                return RedirectToAction("Result", "Admin");
            }

            else
            {
                using (DB49Entities db = new DB49Entities())
                {

                    var v = db.Logins.Any(x => x.Email == l.Email && x.Password == l.Password);//.ToList();// (from Login in db.Logins where Login.Email == l.Email && Login.Password == l.Password select Login.Type);
                                                                                               //  var v = j.FirstOrDefault();

                    //var v = db.Logins.Where(x => x.Email == l.Email && x.Password == l.Password).FirstOrDefault();



                    //var v = db.Logins.Any(x => x.Email == l.Email && x.Password == l.Password && x.Type == l.Type);
                    var k = db.Students.Where(d => d.Type == "stu" && d.EmailId == l.Email).ToList();
                    if (k != null)
                    {
                        foreach (var item in k)

                        {  //  var k = db.Students.Select(new Student { EmailId = l.Email  }).ToList();

                            if (item != null)
                            {

                                Session["LoginID"] = item.LoginID.ToString();
                                Session["Name"] = item.Name.ToString();
                                Session["StudentID"] = item.StudentId.ToString();
                                Session["RegistrationNumber"] = item.RegistrationNumber.ToString();
                                Session["PhoneNumber"] = item.PhoneNumber.ToString();
                                Session["Session"] = item.SessionId.ToString();
                                Session["Address"] = item.Address.ToString();
                                Session["DOB"] = item.DOB.ToString();
                                Session["Department"] = item.Department.DepartmentID.ToString();
                                return RedirectToAction("StudentDetails", "Student");
                            }
                            //else if (item == null)
                            //{
                            //    return RedirectToAction("Result", "Admin");
                            //}


                        }
                    }
                    //else
                    {
                        var p = db.Employees.Where(d => d.Type == "emp" && d.EmailID == l.Email).ToList();

                        foreach (var item in p)

                        {  //  var k = db.Students.Select(new Student { EmailId = l.Email  }).ToList();

                            if (item != null)
                            {

                                Session["LoginID"] = item.LoginID.ToString();
                                Session["EmailID"] = item.EmailID.ToString();
                                Session["EmployeeID"] = item.EmployeeID.ToString();
                                Session["Designation"] = item.Designation.ToString();
                                //Session["PhoneNumber"] = k.PhoneNumber.ToString();
                                //Session["Session"] = k.Session.ToString();
                                //Session["Address"] = k.Address.ToString();
                                //Session["DOB"] = k.DOB.ToString();
                                //Session["Department"] = k.Department.DepartmentID.ToString();
                                return RedirectToAction("EmployeDetails", "Employee");
                            }

                        }
                        //  return RedirectToAction("Result", "Admin");
                        //}


                        //else
                        //{
                        //    string message;
                        //    message = ("Invalid Login Attempt");
                        //    ViewBag.Message = message;


                        //}



                    }
                }
                return View(l);


            }
        }

        public ActionResult AddFee()
        {
            DB49Entities db = new DB49Entities();
            return View();
        }

        [HttpPost]
        public ActionResult AddFee(Fee obj)
        {
            try
            {
                string message;
                DB49Entities db = new DB49Entities();

                // Student l = new Student();
                Fee c = new Fee();


                c.Fees = obj.Fees;
                c.Semester = obj.Semester;
                c.Date = obj.Date;


                db.Fees.Add(c);
                db.SaveChanges();
                // Session[" CourseID"] = c.CourseID.ToString();
                message = " Fee Added Successfully.\\nFee Id:" + c.FeeId.ToString();
                ViewBag.Message = message;
            }

            catch (DbEntityValidationException e)
            {


                Console.WriteLine(e.ToString());

            }
            return View(obj);
        }



        public ActionResult AddScholarship()
        {

            DB49Entities k = new DB49Entities();

            List<Student> students = k.Students.ToList();
            ViewBag.StudentList = new SelectList(students, "StudentID", "Name");

            List<Scholarshipss> scholarships = k.Scholarshipsses.ToList();
            ViewBag.ScholarshipList = new SelectList(scholarships, "ScholarshipID", "Scholarship");
            return View();
        }

        public ActionResult ShowScholarship()
        {
            DB49Entities db = new DB49Entities();
            List<Scholar> p = new List<Scholar>();
            Scholar o = new Scholar();
            p = db.Scholars.ToList();
            return View(p);
        }

        [HttpPost]
        public ActionResult AddScholarship(Scholar obj)
        {
            try
            {
                string message;
                DB49Entities k = new DB49Entities();

                List<Student> students = k.Students.ToList();
                ViewBag.StudentList = new SelectList(students, "StudentID", "Name");

                List<Scholarshipss> scholarships = k.Scholarshipsses.ToList();
                ViewBag.ScholarshipList = new SelectList(scholarships, "ScholarshipID", "Scholarship");


                Student s = new Student();
                Scholarshipss t = new Scholarshipss();

                Scholar d = new Scholar();

                d.StudentID = obj.StudentID;

                d.ScholarshipID = obj.ScholarshipID;
                d.ScholarID = obj.ScholarID;

                k.Scholars.Add(d);
                k.SaveChanges();



            }

            catch (DbEntityValidationException e)
            {
                Console.WriteLine(e.ToString());

            }
            return View(obj);


        }

        public ActionResult UpdateFee()
        {
            DB49Entities k = new DB49Entities();

            List<Student> students = k.Students.ToList();
            ViewBag.StudentList = new SelectList(students, "StudentID", "Name");

            List<Scholarshipss> scholarships = k.Scholarshipsses.ToList();
            ViewBag.ScholarshipList = new SelectList(scholarships, "ScholarshipID", "Scholarship");
            List<Lookup> lookups = k.Lookups.ToList();
            ViewBag.LookupList = new SelectList(lookups, "LookupID", "Name");
            return View();
        }

        [HttpPost]
        public ActionResult UpdateFee(Fe obj)
        {
            try
            { 

            DB49Entities k = new DB49Entities();

            List<Student> students = k.Students.ToList();
            ViewBag.StudentList = new SelectList(students, "StudentID", "Name");

                List<Scholarshipss> scholarships = k.Scholarshipsses.ToList();
                ViewBag.ScholarshipList = new SelectList(scholarships, "ScholarshipID", "Scholarship");

                List<Lookup> lookups = k.Lookups.ToList();
            ViewBag.LookupList = new SelectList(lookups, "LookupID", "Name");



            Student s = new Student();
            Scholarshipss  t = new Scholarshipss();
            Lookup p = new Lookup();

            Fe d = new Fe();

            d.StudentID = obj.StudentID;

            d.ScholarshipID = obj.ScholarshipID;
            d.LookupID = obj.LookupID;
                d.LookupID = obj.LookupID;
                d.NewFee = obj.NewFee;
               

            k.Fes.Add(d);
            k.SaveChanges();

               var m = k.Fes.Where(n => n.StudentID == obj.StudentID).ToList();

                foreach (var item in m)

                {
                    // var k = db.Students.Select(new Student { EmailId = l.Email  }).ToList();

                    if (item != null)
                    {

                        Session["FeeID"] = d.FeeID.ToString();
                        Session["ScholarshipID"] = d.ScholarshipID.ToString();
                        Session["LookupID"] = d.LookupID.ToString();
                        Session["NewFee"] = d.NewFee.ToString();
                        Session["StudentID"] = d.StudentID.ToString();
                        return RedirectToAction("UpFeeChallan", "Student");
                        // message = " Course Registered Successfully.\\nRegisteredCourse Id:" + r.RegisteredCourseID.ToString();
                        //ViewBag.Message = message;




                    }
                }



            }

            catch (DbEntityValidationException e)
            {
                Console.WriteLine(e.ToString());

            }

            return View(obj);
        }

        public ActionResult AdminShowUpFeeChallan()
        {
            DB49Entities db = new DB49Entities();
            return View(db.Fes.ToList());
        }

        public ActionResult ReportScholarshipFee()
        {
            DB49Entities db = new DB49Entities();

            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "CrystalReportNewFee.rpt"));
            rd.SetDataSource(db.Fes.ToList());
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


        public ActionResult ShowStudnet()
        {
            return View();
        }
        public ActionResult ShowEmployee()
        {
            return View();
        }

        [HttpGet]
        public ActionResult EditStu(int id)
        {
            using (DB49Entities db = new DB49Entities())
            {

                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

                }
                Login user = db.Logins.Find(id);
                if (user == null)
                {
                    return HttpNotFound();
                }
                return View(user);
            }
        }

        [HttpPost, ActionName("EditStu")]
        public ActionResult Editstu(Login obj, int id)
        {

            using (DB49Entities db = new DB49Entities())
            {

                Login user = db.Logins.Where(a => a.LoginID == id).FirstOrDefault();
                user.LoginID = obj.LoginID;


                //  k.Complain.StatusID = obj.StatusID;



                //db.Comments.Add(k);
                db.SaveChanges();


            }
            return View(obj);
        }
        [HttpGet]
        public ActionResult Editemp(int id)
        {
            using (DB49Entities db = new DB49Entities())
            {

                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

                }
                Login user = db.Logins.Find(id);
                if (user == null)
                {
                    return HttpNotFound();
                }
                return View(user);
            }
        }

        [HttpPost, ActionName("Editemp")]
        public ActionResult Editemp(Login obj, int id)
        {

            using (DB49Entities db = new DB49Entities())
            {

                Login user = db.Logins.Where(a => a.LoginID == id).FirstOrDefault();
                user.LoginID = obj.LoginID;


                //  k.Complain.StatusID = obj.StatusID;



                //db.Comments.Add(k);
                db.SaveChanges();


            }
            return View(obj);
        }

    }
}

    
