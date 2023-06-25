using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Model.ViewModels
{
    public class PerformanceVM
    {
        public int Id { get; set; }

        public string Subject { get; set; }

        public Double Marks { get; set; }

        public string Grade { get; set; }

        public Nullable<System.DateTime> ExamDate { get; set; }

        public string Comment { get; set; }

        public Nullable<int> UserID { get; set; }

        public Student StudentDetail { get; set; }

        public Subject SubjectDetail { get; set; }
    }
}
