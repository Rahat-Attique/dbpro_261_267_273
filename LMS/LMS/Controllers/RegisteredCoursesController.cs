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
    public class RegisteredCoursesController : Controller
    {
        // GET: RegisteredCourses
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CourseRegister()
        {
            DB49Entities7 db = new DB49Entities7();

            List<Course> co = db.Courses.ToList();
            ViewBag.courseList = new SelectList(co, "CourseID", "CourseName");
            List<Student> students = db.Students.ToList();
            ViewBag.StudentList = new SelectList(students, "StudentID", "Name");

            List<Sectionss> sections = db.Sectionsses.ToList();
            ViewBag.SectionList = new SelectList(sections, "SectionID", "SectionName");
            return View();
        }
        [HttpPost]
        public ActionResult CourseRegister(RegisteredCours obj)
        {




            //
            try
            {
                // string message;
                DB49Entities7 db = new DB49Entities7();

                List<Course> co = db.Courses.ToList();
                ViewBag.courseList = new SelectList(co, "CourseID", "CourseName");
                List<Student> students = db.Students.ToList();
                ViewBag.StudentList = new SelectList(students, "StudentID", "Name");

                List<Sectionss> sections = db.Sectionsses.ToList();
                ViewBag.SectionList = new SelectList(sections, "SectionID", "SectionName");

                Student s = new Student();
                Course t = new Course();

                Sectionss d = new Sectionss();
                RegisteredCours r = new RegisteredCours();

                r.StudentID = obj.StudentID;

                r.CourseID = obj.CourseID;
                r.SectionID = obj.SectionID;
                r.Semester = obj.Semester;

                db.RegisteredCourses.Add(r);
                db.SaveChanges();
               // Student s = new Student();

                //  var p = db.Employees.Where(d => d.Type == "emp" && d.EmailID == l.Email).ToList();
                var p = db.RegisteredCourses.Where(n => n.StudentID == obj.StudentID).ToList();

                foreach (var item in p)

                {  
                    // var k = db.Students.Select(new Student { EmailId = l.Email  }).ToList();

                    if (item != null)
                    {

                        Session["RegisteredCourseID"] = r.RegisteredCourseID.ToString();
                        Session["Semester"] = r.Semester.ToString();
                        Session["SectionID"] = r.SectionID.ToString();
                        Session["CourseID"] = r.CourseID.ToString();
                        Session["StudentID"] = r.CourseID.ToString();
                        return RedirectToAction("ShowRegisteredCourses", "ShowRegisteredCourses");
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




    }
}