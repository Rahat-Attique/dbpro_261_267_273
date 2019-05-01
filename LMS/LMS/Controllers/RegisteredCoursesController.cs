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
            DB49Entities1 db = new DB49Entities1();

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
                string message;
                DB49Entities1 db = new DB49Entities1();

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

                Session["RegisteredCourseID"] = r.RegisteredCourseID.ToString();
                message = " Course Registered Successfully.\\nRegisteredCourse Id:" + r.RegisteredCourseID.ToString();
                ViewBag.Message = message;



            }

            catch (DbEntityValidationException e)
            {
                Console.WriteLine(e.ToString());

            }
            return View(obj);
        }




    }
}