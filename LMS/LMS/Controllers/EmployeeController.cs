using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LMS.Models;
namespace LMS.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult markatt()
        {
            DB49Entities7 db = new DB49Entities7();
            List<Department> departments = db.Departments.ToList();
            ViewBag.DepartmentList = new SelectList(departments, "DepartmentID", "DepartmentName");
            List<Sectionss> sections = db.Sectionsses.ToList();
            ViewBag.sectionlist = new SelectList(sections, "SectionID", "SectionName");
            List<status> statuses  = db.status.ToList();
            ViewBag.statuslist = new SelectList(statuses, "ID", "Status1");
            List<Student> student = db.Students.ToList();
            ViewBag.studnetlist = new SelectList(student, "StudentId", "RegistrationNumber");
            List<Course> courses = db.Courses.ToList();
            ViewBag.course = new SelectList(courses, "CourseID", "CourseName");

            List<Session> sessions = db.Sessions.ToList();
            ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");
            return View();
            
        }
        [HttpPost]
        public ActionResult markatt(ClassAttendance c)
        {
            DB49Entities7 db = new DB49Entities7();
            List<Department> departments = db.Departments.ToList();
            ViewBag.DepartmentList = new SelectList(departments, "DepartmentID", "DepartmentName");
            List<Sectionss> sections = db.Sectionsses.ToList();
            ViewBag.sectionlist = new SelectList(sections, "SectionID", "SectionName");
            List<status> statuses = db.status.ToList();
            ViewBag.statuslist = new SelectList(statuses, "ID", "Status1");
            List<Student> student = db.Students.ToList();
            ViewBag.studnetlist = new SelectList(student, "StudentId", "RegistrationNumber");
            List<Course>courses = db.Courses.ToList();
            ViewBag.course = new SelectList(courses, "CourseID", "CourseName");

            List<Session> sessions = db.Sessions.ToList();
            ViewBag.SessionList = new SelectList(sessions, "SessionID", "Session1");
            ClassAttendance k = new ClassAttendance();
            k.StudentID = c.StudentID;
            k.statusid = c.statusid;
            k.Department = c.Department;
            k.CourseId = c.CourseId;
            k.Session = c.Session;
            k.SectionID = c.SectionID;
            k.Semester = c.Semester;
            k.Date =DateTime.Now;
            db.ClassAttendances.Add(k);
            db.SaveChanges();


            return View();

        }
        public ActionResult EmployeeDetails()
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
    }
}