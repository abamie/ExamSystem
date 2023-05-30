using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Model.ViewModels
{
	public class StudentVM
	{
		public Student Student { get; set; }
		[ValidateNever]
		public IEnumerable<SelectListItem> SubjectList { get; set; }
		[ValidateNever]
		public IEnumerable<SelectListItem> StandardList { get; set; }
	}
}
