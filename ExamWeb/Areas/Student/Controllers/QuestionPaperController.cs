using Exam.DataAccess.Repository.IRepository;
using Exam.Model;
using Exam.Model.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Runtime.Intrinsics.Arm;
using System.Text.Json;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace ExamWeb.Areas.Student.Controllers
{
	[Area("Student")]
	public class QuestionPaperController : Controller
	{
		private readonly IUnitOfWork _unitOfWork;
		public QuestionPaperController(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		[HttpPost]
		public ActionResult Index()
		{

			return View();
		}

		[HttpGet]
		public ActionResult GetExamList(int StudentId)
		{
			return View();
		}


		[HttpGet]
		public ActionResult GetUser()
		{
			return View();
		}

		private void ResetExamSession()
		{
			HttpContext.Session.Remove("studentId");
			HttpContext.Session.SetInt32("correctAns", 0);
			HttpContext.Session.Remove("studentId");
			HttpContext.Session.SetInt32("totalQuestion", 0);
		}

		[HttpPost]
		public ActionResult GetUser(StudentVM user)
		{

			ResetExamSession();

			var student = _unitOfWork.Student.GetFirstOrDefault(u => u.UserId == user.Student.UserId && u.Password == user.Student.Password, includeProperties: "Standard");

			if (student != null)
			{
				int studentId = student.Id;
				HttpContext.Session.SetInt32("studentId", studentId);
				return RedirectToAction("GetExamList", new { StudentId = studentId });
			}
			else
			{
				ViewBag.Msg = "Sorry : user is not found !!";
				return View();
			}


		}

		public IActionResult TimeoutExam()
		{
				return View();
		}

		public IActionResult GetStudentExamById()
		{
			int? studentId = HttpContext.Session.GetInt32("studentId");

			if (studentId == null)
			{
				return View();
			}
			var examList = _unitOfWork.StudentSubject.GetAll(a => a.StudentId == studentId, includeProperties: "Student,Subject");
			return Json(new { data = examList });
		}
		private void SaveResult(int correctanswer, int totalquestion)
		{
			int? studentId = HttpContext.Session.GetInt32("studentId");

			int? subjectid = HttpContext.Session.GetInt32("subjectId");

			int marks = ((correctanswer * 100) / totalquestion);

			ExamMark TestResult = _unitOfWork.ExamMark.GetFirstOrDefault(u => u.StudentId == studentId && u.SubjectId == subjectid);

			if (TestResult != null)
				_unitOfWork.ExamMark.Remove(TestResult);

			ExamMark tr = new ExamMark();
			tr.CreatedDateTime = DateTime.Now;
			tr.Marks = marks;
			tr.SubjectId = subjectid.Value;
			tr.StudentId = studentId.Value;

			tr.Comment = "Fail";

			if (marks > 90)
			{
				tr.Grade = "A+";
				tr.Comment = "OutStanding";
			}
			else if (marks > 70)
			{
				tr.Grade = "A";
				tr.Comment = "Excellent";
			}
			else if (marks > 50)
			{
				tr.Grade = "B";
				tr.Comment = "Very Good";
			}
			else if (marks > 30)
			{
				tr.Grade = "C";
				tr.Comment = "Good";
			}
			else
				tr.Grade = "F";

			_unitOfWork.ExamMark.Add(tr);
			_unitOfWork.Save();
		}

		private StudentSubject GetStudentSubjectById(int id)
		{
			StudentSubject studentSubject= null;

            studentSubject = _unitOfWork.StudentSubject.GetFirstOrDefault(q => q.Id == id && q.IsActive == true, includeProperties: "Student,Subject");
			if(studentSubject !=null)
			{
                HttpContext.Session.SetInt32("subjectId", studentSubject.SubjectId);
                HttpContext.Session.SetInt32("studentId", studentSubject.StudentId);
                HttpContext.Session.SetInt32("totalQuestion", studentSubject.TotalQuestion);
            }

            return studentSubject;

		}

		private QuestionQVM GetQuestionNew(int DispayOrder, int err = 0)
		{
			ExamSheetVM QuestionList = new ExamSheetVM();
			List<QuestionQVM> finalList = new List<QuestionQVM>();

			List<QuestionQVM> QuestionAnswerList = new List<QuestionQVM>();

			int? subjectId = HttpContext.Session.GetInt32("subjectId");

			int? totalQuestion = HttpContext.Session.GetInt32("totalQuestion");

			QuestionList.answer = _unitOfWork.Answer.GetFirstOrDefault(q => q.SubjectId == subjectId && q.Question.DisplayOrder == DispayOrder, includeProperties: "Question,Subject");

			int QuestionId = QuestionList.answer.QuestionId;

			 var Choices = _unitOfWork.Choice.GetAll(a => a.Id == QuestionId, includeProperties: "Question").ToList();

		//	QuestionList.Choices = Choices.AsEnumerable<Choice>();

			//foreach (QuestionQVM item in QuestionList)
			//{
			//	item.Choices = _unitOfWork.Choice.GetAll(a => a.QuestionId == item.QuestionID).Select(q => new ChoiceQVM
			//	{
			//		ChoiceID = q.Id,
			//		ChoiceText = q.ChoiceText,
			//		DisplayOrder = q.DispalyOrder
			//	}).ToList();
			//	finalList.Add(item);
			//}

			QuestionQVM? result = finalList.FirstOrDefault();
			if (err == 1)
			{
				result.Message = "Please select an answer";
			}
			result.TotalQuestion = totalQuestion.Value;

			return result;
		}

		private QuestionQVM GetQuestion(int DispayOrder, int err=0)
		{
			List<QuestionQVM> QuestionList = new List<QuestionQVM>();
			List<QuestionQVM> finalList = new List<QuestionQVM>();

			List<QuestionQVM> QuestionAnswerList = new List<QuestionQVM>();

			int? subjectId = HttpContext.Session.GetInt32("subjectId");

            int? totalQuestion = HttpContext.Session.GetInt32("totalQuestion");

            QuestionList = _unitOfWork.Answer.GetAll(q => q.SubjectId == subjectId && q.Question.DisplayOrder == DispayOrder, includeProperties: "Question,Subject").Select(q => new QuestionQVM
			{
				QuestionID = q.QuestionId,
				QuestionText = q.Question.QuestionText,
				SubjectID = q.SubjectId,
				AnwserId = q.Id,
				QuestionDispalyOrder = q.Question.DisplayOrder,
				Anwser=q.AnswerText

            }).ToList();

			foreach (QuestionQVM item in QuestionList)
			{
				item.Choices = _unitOfWork.Choice.GetAll(a => a.QuestionId == item.QuestionID).Select(q => new ChoiceQVM
				{
					ChoiceID = q.Id,
					ChoiceText = q.ChoiceText,
					DisplayOrder=q.DispalyOrder
				}).ToList();
				finalList.Add(item);
			}

			QuestionQVM? result = finalList.FirstOrDefault();
			if(err==1)
			{
				result.Message = "Please select an answer";
			}
			result.TotalQuestion = totalQuestion.Value;

            return result;
		}

		public ActionResult NextQuestion(int? id)
		{
			int qNo = 0, err = 0;

			if (id != null)
			{
				StudentSubject ss = GetStudentSubjectById(id.Value);
                TempData["a"] = 1;
				//ViewBag.questionNo = 1;
			}

			qNo = (int)TempData["a"];

			QuestionQVM qust = GetQuestion(qNo,err);

			//TempData["qData"] = JsonSerializer.Serialize(qust); ;



			return View(qust);

		}
		[HttpPost]
		public ActionResult NextQuestion(QuestionQVM aaa)
		{
			int anscnt = 0;

			//TempData["err"] = 0;

			//var questanswer = JsonSerializer.Deserialize<QuestionQVM>(TempData["qData"] as string);
			anscnt = Convert.ToInt32(HttpContext.Session.GetInt32("correctAns"));

			if (aaa.selectedvalue > 0)
			{
				Choice ansVM = _unitOfWork.Choice.GetFirstOrDefault(u => u.Id == aaa.selectedvalue);

				if (aaa.Anwser.Equals(ansVM.ChoiceText))
				{
					anscnt = anscnt + 1;
					HttpContext.Session.SetInt32("correctAns", anscnt);
				}
			}

            if (aaa.QuestionDispalyOrder == aaa.TotalQuestion)
			{
				SaveResult(anscnt, aaa.QuestionDispalyOrder);
				return RedirectToAction("Index", "Performance");


			}
			//int qId = (int)aaa.QuestionDispalyOrder + 1;
			//ViewBag.questionNo = aaa.QuestionDispalyOrder + 1;
			TempData["a"] = aaa.QuestionDispalyOrder + 1;
			//if (aaa.selectedvalue <1)
			//{
			//	TempData["a"] = aaa.QuestionDispalyOrder;
			//	TempData["err"] = 1;
			//}

			return RedirectToAction("NextQuestion");


		}
	}

}

