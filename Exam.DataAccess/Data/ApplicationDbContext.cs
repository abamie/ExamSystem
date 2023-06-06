﻿using Exam.Model;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace Exam.DataAccess.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<Subject> Subjects { get; set; }
        public DbSet<Standard> Standards { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Answer> Answers { get; set; }
         public DbSet<Choice> Choices { get; set; }

        public DbSet<ExamMark> ExamMarks { get; set; }

        public DbSet<Company> Companies { get; set; }

        public DbSet<StudentSubject> StudentSubjects { get; set; }

        public DbSet<ApplicationUser> ApplicationUsers { get; set; }

        

    }
}
