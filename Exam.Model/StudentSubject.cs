using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Exam.Model
{
    public class StudentSubject
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [Display(Name = "Display Order")]
        public int DisplayOrder { get; set; }

        [Required]
        [Display(Name = "ExamCode")]
        [StringLength(200)]
        public string ExamCode { get; set; }

        public int TotalQuestion { get; set; }

        public bool IsActive { get; set; } = true;

        public DateTime CreatedDateTime { get; set; } = DateTime.Now;

        [Required]
        [Display(Name = "Student")]
        public int StudentId { get; set; }
        [ForeignKey("StudentId")]
        [ValidateNever]
        public Student Student { get; set; }

        [Required]
        [Display(Name = "Subject")]
        public int SubjectId { get; set; }
        [ForeignKey("SubjectId")]
        [ValidateNever]
        public Subject Subject { get; set; }

       
    }
}
