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
    
    public partial class Scholar
    {
        public int ScholarshipID { get; set; }
        public int StudentID { get; set; }
        public int ScholarID { get; set; }
    
        public virtual Scholarshipss Scholarshipss { get; set; }
        public virtual Student Student { get; set; }
    }
}
