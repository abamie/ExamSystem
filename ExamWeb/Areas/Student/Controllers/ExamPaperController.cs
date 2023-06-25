using Exam.DataAccess.Repository.IRepository;
using Exam.Model;
using Exam.Model.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer.Query.Internal;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace ExamWeb.Areas.Student.Controllers
{
    [Area("Student")]
    public class ExamPaperController : Controller
	{

		private readonly IUnitOfWork _unitOfWork;


		public ExamPaperController(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}

		// GET: ExamPaperController
		public ActionResult Index()
		{
			return View();
		}

		// GET: ExamPaperController/Details/5
		public ActionResult Details(int id)
		{
			return View();
		}

        [HttpGet]
        public ActionResult GetUser()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetUser(UserQVM user)
        {

			HttpContext.Session.Remove("studentId");
           var student = _unitOfWork.Student.GetFirstOrDefault(u => u.UserId == user.FullName && u.Password==user.Password, includeProperties: "Standard");

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

		[HttpGet]
		public ActionResult GetExamList(int StudentId)
		{
			return View();
		}

        [HttpGet]
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



		[HttpGet]
		public ActionResult Examintaion(int? id)
		{

			int subject=1;
			List<QuestionQVM> QuestionList = new List<QuestionQVM>();
            List<QuestionQVM> finalList = new List<QuestionQVM>();



            QuestionList = _unitOfWork.Question.GetAll(q => q.SubjectId == id).Select(q => new QuestionQVM
			{
				QuestionID = q.Id,
				QuestionText = q.QuestionText,
				SubjectID=q.SubjectId
			} ).ToList();


            HttpContext.Session.SetInt32("subjectId", id.Value);

            foreach (QuestionQVM item in QuestionList)
            {
                item.Choices = _unitOfWork.Choice.GetAll(a => a.QuestionId == item.QuestionID).Select(q => new ChoiceQVM
				{
					ChoiceID = q.Id,
					ChoiceText = q.ChoiceText
				} ).ToList();
                finalList.Add(item);
            }

            return View(finalList.AsQueryable());
		}


		[HttpPost]
	//	[ValidateAntiForgeryToken]
		public ActionResult Examintaion(List<QuizAnswersQVM> resultQuiz)
		{
			List<QuizAnswersQVM> finalResultQuiz = new List<QuizAnswersQVM>();

			foreach (QuizAnswersQVM item in resultQuiz)
			{
                var result = _unitOfWork.Answer.GetAll(a => a.QuestionId == item.QuestionID)
				.Select(a => new QuizAnswersQVM
				{
					QuestionID = a.QuestionId,
					AnswerQ = a.AnswerText,
                    isCorrect = (item.AnswerQ.ToLower().Equals(a.AnswerText.ToLower()))
                }).FirstOrDefault();

				finalResultQuiz.Add(result);
			}

			resultQuiz = finalResultQuiz;
            //  int correctanswer = finalResultQuiz.Where(a => a.isCorrect == true).Select(a => a.isCorrect).Count();

            SaveResult(finalResultQuiz);

            JsonResult jsr =  Json(finalResultQuiz, new Newtonsoft.Json.JsonSerializerSettings());

              return Json(resultQuiz, new Newtonsoft.Json.JsonSerializerSettings());

            //return RedirectToAction("Index", "Performance", new { area = "student" });


           //return Json(new { data = resultQuiz });

            //return Json(new { result = finalResultQuiz }, JsonRequestBehavior.AllowGet);
        }

		private void SaveResult(List<QuizAnswersQVM> finalResultQuiz)
        {
            int? studentId = HttpContext.Session.GetInt32("studentId");

            int? subjectid = HttpContext.Session.GetInt32("subjectId");

            //  UserVM usr = Session["UserConnected"] as UserVM;
            int correctanswer = finalResultQuiz.Where(a => a.isCorrect == true).Select(a => a.isCorrect).Count();
            int totalquestion = finalResultQuiz.Count();
            int marks = ((correctanswer * 100) / totalquestion);
            int questionid = finalResultQuiz.Select(a => a.QuestionID).FirstOrDefault();

			ExamMark TestResult = _unitOfWork.ExamMark.GetFirstOrDefault(u => u.StudentId == studentId && u.SubjectId == subjectid);

            if (TestResult != null)
                _unitOfWork.ExamMark.Remove(TestResult);

            ExamMark tr = new ExamMark();
            tr.CreatedDateTime = DateTime.Now;
            tr.Marks = marks;
            tr.SubjectId = studentId.Value;
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



        // GET: ExamPaperController/Create
        public ActionResult Create()
		{
			return View();
		}

		// POST: ExamPaperController/Create
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create(IFormCollection collection)
		{
			try
			{
				return RedirectToAction(nameof(Index));
			}
			catch
			{
				return View();
			}
		}

		// GET: ExamPaperController/Edit/5
		public ActionResult Edit(int id)
		{
			return View();
		}

		// POST: ExamPaperController/Edit/5
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit(int id, IFormCollection collection)
		{
			try
			{
				return RedirectToAction(nameof(Index));
			}
			catch
			{
				return View();
			}
		}

		// GET: ExamPaperController/Delete/5
		public ActionResult Delete(int id)
		{
			return View();
		}

		// POST: ExamPaperController/Delete/5
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Delete(int id, IFormCollection collection)
		{
			try
			{
				return RedirectToAction(nameof(Index));
			}
			catch
			{
				return View();
			}
		}
	}
}
