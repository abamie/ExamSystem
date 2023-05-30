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
	public class ExamMark

	{
		[Key]
		public int Id { get; set; }

		public Double Marks { get; set; }

		[StringLength(50)]
		public string Grade { get; set; }

		[Required]
		[StringLength(500)]
		public string Comment { get; set; }

		[Required]
		[Display(Name = "Student Name")]
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

		public bool IsActive { get; set; } = true;

		public DateTime CreatedDateTime { get; set; } = DateTime.Now;
	}
}
