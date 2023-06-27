using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Model.ViewModels
{
	//public class UserQVM
	//{

	//	public string StudentID { get; set; }
	//	public string StudentName { get; set; }
	//	public string ProfilImage { get; set; }
	//	public string Standard { get; set;}

	//	public string Password { get; set; }
	//}

	//public class QuizQVM
	//{
	//	public int QuizID { get; set; }
	//	public string QuizName { get; set; }
	//	public List<SelectListItem> ListOfQuizz { get; set; }

	//}

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
		[Required]
		public int selectedvalue { get; set; }

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

