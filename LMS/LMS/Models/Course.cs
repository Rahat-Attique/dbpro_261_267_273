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
    
    public partial class Course
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Course()
        {
            this.RegisteredCourses = new HashSet<RegisteredCours>();
            this.TimeTables = new HashSet<TimeTable>();
        }
    
        public int CourseID { get; set; }
        public string CourseName { get; set; }
        public int DepartmentID { get; set; }
        public int SessionID { get; set; }
        public int CreditHours { get; set; }
    
        public virtual Session Session { get; set; }
        public virtual Session Session1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RegisteredCours> RegisteredCourses { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeTable> TimeTables { get; set; }
    }
}
