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

    public partial class Exam
    {
        public int ExamID { get; set; }
        public System.DateTime ExamDate { get; set; }
        [Required(ErrorMessage = "This field is required")]
        public int SessionID { get; set; }
        public int DepartmentId { get; set; }
        public int CourseID { get; set; }
    
        public virtual Course Course { get; set; }
        public virtual Department Department { get; set; }
        public virtual Session Session { get; set; }
    }
}
