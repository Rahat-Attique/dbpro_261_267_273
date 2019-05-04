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

    public partial class RegisteredCours
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RegisteredCours()
        {
            this.Results = new HashSet<Result>();
        }
    
        public int RegisteredCourseID { get; set; }
        public int StudentID { get; set; }
        public int CourseID { get; set; }
        [Required(ErrorMessage = "This field is required")]
        public int Semester { get; set; }
        public int SectionID { get; set; }
    
        public virtual Course Course { get; set; }
        public virtual Sectionss Sectionss { get; set; }
        public virtual Student Student { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Result> Results { get; set; }
    }
}
