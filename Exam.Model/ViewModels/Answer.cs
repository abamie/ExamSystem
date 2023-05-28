using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Exam.Model.ViewModels
{
    public class Answer
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Question")]
        public int SubjectId { get; set; }
        [ForeignKey("SubjectId")]
        [ValidateNever]
        public Subject Subject { get; set; }


        [Required]
        [Display(Name = "Subject")]
        public int SubjectId { get; set; }
        [ForeignKey("SubjectId")]
        [ValidateNever]
        public Subject Subject { get; set; }

        [Required]
        [Display(Name = "Class")]
        public int ClassId { get; set; }
        [ForeignKey("ClassId")]
        [ValidateNever]
        public Standard Standard { get; set; }

        public bool IsActive { get; set; } = true;

        public DateTime CreatedDateTime { get; set; } = DateTime.Now;
    }
}
