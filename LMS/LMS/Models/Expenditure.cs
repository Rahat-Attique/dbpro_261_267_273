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
    
    public partial class Expenditure
    {
        public int FeeID { get; set; }
        public int SalaryID { get; set; }
        public int ExpenditureID { get; set; }
    
        public virtual Fe Fe { get; set; }
        public virtual Salary Salary { get; set; }
    }
}
