﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations.Schema;

namespace Exam.Model
{
    public class Student
    {
        [Key]
        public int Id { get; set; }

		[Required]
		public string RollNo { get; set; }
		[Required]
		[DisplayName("Name")]
		public string Name { get; set; }

        public string Address { get; set; }

        [ValidateNever]
        public string ImageUrl { get; set; }

        [Required]
        [Display(Name = "Class")]
        public int StandardId { get; set; }
        [ForeignKey("StandardId")]
        [ValidateNever]
        public Standard Standard { get; set; }

        public bool IsActive { get; set; } = true;

        public DateTime CreatedDateTime { get; set; } = DateTime.Now;
    }
}