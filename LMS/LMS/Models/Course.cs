//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LMS.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Course
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Course()
        {
            this.ClassAttendances = new HashSet<ClassAttendance>();
            this.Exams = new HashSet<Exam>();
            this.RegisteredCourses = new HashSet<RegisteredCours>();
            this.TimeTables = new HashSet<TimeTable>();
        }
    
        public int CourseID { get; set; }
        [Required(ErrorMessage = "This field is required")]
        public string CourseName { get; set; }
        public int DepartmentID { get; set; }
        public int SessionID { get; set; }
        [Required(ErrorMessage = "This field is required")]
        public int CreditHours { get; set; }
        [Required(ErrorMessage = "This field is required")]
        public string Semester { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClassAttendance> ClassAttendances { get; set; }
        public virtual Department Department { get; set; }
        public virtual Session Session { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Exam> Exams { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RegisteredCours> RegisteredCourses { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeTable> TimeTables { get; set; }
    }
}
