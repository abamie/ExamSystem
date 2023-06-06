using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Model.ViewModels
{
	public class UserQVM
	{

		public int UserID { get; set; }
		public string FullName { get; set; }
		public string ProfilImage { get; set; }
		public string Standard { get; set;}
	}

	public class QuizQVM
	{
		public int QuizID { get; set; }
		public string QuizName { get; set; }
		public List<SelectListItem> ListOfQuizz { get; set; }

	}

	public class QuestionQVM
	{
		public int QuestionID { get; set; }
        public int SubjectID { get; set; }
        public string QuestionText { get; set; }
		public string QuestionType { get; set; }
		public string Anwser { get; set; }
		public ICollection<ChoiceQVM> Choices { get; set; }
	}

	public class ChoiceQVM
	{
		public int ChoiceID { get; set; }
		public string ChoiceText { get; set; }
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

