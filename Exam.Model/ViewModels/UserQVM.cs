using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Model.ViewModels
{


	public class QuestionQVM  
	{
		public int QuestionID { get; set; }
		public int SubjectID { get; set; }
		public string QuestionText { get; set; }
		public string QuestionType { get; set; }
		public string Anwser { get; set; }
		public int AnwserId { get; set; }

		public int TotalQuestion { get; set; }
		public ICollection<ChoiceQVM> Choices { get; set; }

		public int QuestionDispalyOrder { get; set; }

		[Display(Name = "Selection")]
		[Range(1,9999, ErrorMessage = "Please select an answer")]
		public int selectedvalue { get; set; }

		public string Message { get; set; }

	}

	public class ChoiceQVM
	{
		public int ChoiceID { get; set; }
		public string ChoiceText { get; set; }

		public string DisplayOrder { get; set;}
	}

	public class QuizAnswersQVM
	{
		public int QuestionID { get; set; }
		public string QuestionText { get; set; }
		public string AnswerQ { get; set; }
        public int AnswerId { get; set; }
        public bool isCorrect { get; set; }


	}
}

