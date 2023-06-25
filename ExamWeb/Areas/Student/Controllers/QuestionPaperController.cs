using Exam.DataAccess.Repository.IRepository;
using Exam.Model;
using Exam.Model.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.Intrinsics.Arm;

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
		int add = 0;


		private QuestionQVM GetQuestion(int DispayOrder)
		{
			List<QuestionQVM> QuestionList = new List<QuestionQVM>();
			List<QuestionQVM> finalList = new List<QuestionQVM>();

			int? subjectId = HttpContext.Session.GetInt32("subjectId");

			QuestionList = _unitOfWork.Question.GetAll(q => q.SubjectId == subjectId && q.DisplayOrder == DispayOrder).Select(q => new QuestionQVM
			{
				QuestionID = q.Id,
				QuestionText = q.QuestionText,
				SubjectID = q.SubjectId
			}).ToList();




			foreach (QuestionQVM item in QuestionList)
			{
				item.Choices = _unitOfWork.Choice.GetAll(a => a.QuestionId == item.QuestionID).Select(q => new ChoiceQVM
				{
					ChoiceID = q.Id,
					ChoiceText = q.ChoiceText
				}).ToList();
				finalList.Add(item);
			}

			return finalList[0];
		}

		public ActionResult NextQuestion(int? id)
		{
			if (id != null)
			{
				HttpContext.Session.SetInt32("subjectId", id.Value);
				TempData["a"] = 1;
			}

			int qNo = (int)TempData["a"];
			ViewBag.questionNo = qNo;

			QuestionQVM qust = GetQuestion(qNo);

			return View(qust);

		}
		[HttpPost]
		public ActionResult NextQuestion(QuestionQVM aaa)
		{
			//if (aaa.correct_ans == aaa.selectedvalue && aaa.qus_id != 1)
			//{
			//	Session["correctAns"] = Convert.ToInt32(Session["correctAns"]) + 1;
			//}
			//else if (aaa.correct_ans == aaa.selectedvalue && aaa.qus_id == 1)
			//{
			//	Session["correctAns"] = 1;
			//}

			if (aaa.QuestionID == 3)
			{
				return RedirectToAction("Index", "Performance");

			}
			//Questions_tbl SingleQuestion = db.Questions_tbl.SingleOrDefault(m => m.qus_id == qId && m.exam_id == aaa.exam_id);


			//ViewBag.questionNo = qId;
			//TempData["qData"] = SingleQuestion;

			int qId = (int)aaa.QuestionID + 1;
			//QuestionQVM qust = GetQuestion(qId);

			ViewBag.questionNo = qId;
			TempData["a"] = aaa.QuestionID + 1;
			//TempData["qData"] = qust;

			return RedirectToAction("NextQuestion");


		}
	}

}

