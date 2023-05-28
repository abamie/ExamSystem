using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Model.ViewModels
{
    public class Question
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public int QuestionNo { get; set; }


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
