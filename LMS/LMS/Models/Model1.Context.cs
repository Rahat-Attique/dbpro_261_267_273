﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DB49Entities4 : DbContext
    {
        public DB49Entities4()
            : base("name=DB49Entities4")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ClassAttendance> ClassAttendances { get; set; }
        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Exam> Exams { get; set; }
        public virtual DbSet<Fe> Fes { get; set; }
        public virtual DbSet<Fee> Fees { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<Lookup> Lookups { get; set; }
        public virtual DbSet<RegisteredCours> RegisteredCourses { get; set; }
        public virtual DbSet<Result> Results { get; set; }
        public virtual DbSet<Salary> Salaries { get; set; }
        public virtual DbSet<Scholar> Scholars { get; set; }
        public virtual DbSet<Scholarshipss> Scholarshipsses { get; set; }
        public virtual DbSet<Sectionss> Sectionsses { get; set; }
        public virtual DbSet<Session> Sessions { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<Expenditure> Expenditures { get; set; }
        public virtual DbSet<Section> Sections { get; set; }
        public virtual DbSet<StudentResult> StudentResults { get; set; }
        public virtual DbSet<TimeTable> TimeTables { get; set; }
    }
}
