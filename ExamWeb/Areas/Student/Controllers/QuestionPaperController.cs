using Exam.DataAccess.Repository.IRepository;
using Exam.Model;
using Exam.Model.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
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

		[HttpPost]
		public ActionResult GetUser(StudentVM user)
		{

			HttpContext.Session.Remove("studentId");
			HttpContext.Session.SetInt32("correctAns", 0);
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
		private QuestionQVM GetQuestion(int DispayOrder)
		{
			List<QuestionQVM> QuestionList = new List<QuestionQVM>();
			List<QuestionQVM> finalList = new List<QuestionQVM>();

			List<QuestionQVM> QuestionAnswerList = new List<QuestionQVM>();

			int? subjectId = HttpContext.Session.GetInt32("subjectId");

			QuestionList = _unitOfWork.Answer.GetAll(q => q.SubjectId == subjectId && q.Question.DisplayOrder == DispayOrder, includeProperties: "Question,Subject").Select(q => new QuestionQVM
			{
				QuestionID = q.Id,
				QuestionText = q.Question.QuestionText,
				SubjectID = q.SubjectId,
				AnwserId = q.Id,
				QuestionDispalyOrder = q.Question.DisplayOrder
				
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

			return finalList.FirstOrDefault();
		}

		public ActionResult NextQuestion(int? id)
		{
			if (id != null)
			{
				HttpContext.Session.SetInt32("subjectId", id.Value);
				TempData["a"] = 1;
			}

			int qNo = (int)TempData["a"];
			//ViewBag.questionNo = qNo;

			QuestionQVM qust = GetQuestion(qNo);

			//TempData["qData"] = JsonSerializer.Serialize(qust); ;



			return View(qust);

		}
		[HttpPost]
		public ActionResult NextQuestion(QuestionQVM aaa)
		{
			int anscnt = 0;
			//var questanswer = JsonSerializer.Deserialize<QuestionQVM>(TempData["qData"] as string);

			if (aaa.AnwserId == aaa.selectedvalue)
			{
				anscnt = Convert.ToInt32(HttpContext.Session.GetInt32("correctAns")) + 1;
				HttpContext.Session.SetInt32("correctAns", anscnt);
			}
			
			if (aaa.QuestionDispalyOrder == 3)
			{
				SaveResult(anscnt, aaa.QuestionDispalyOrder);
				return RedirectToAction("Index", "Performance");


			}
			//int qId = (int)aaa.QuestionDispalyOrder + 1;
			//ViewBag.questionNo = qId;
			TempData["a"] = aaa.QuestionDispalyOrder + 1;

			return RedirectToAction("NextQuestion");


		}
	}

}

