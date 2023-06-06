using Exam.DataAccess.Repository.IRepository;
using Exam.Model.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ExamWeb.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AnswerController : Controller
	{
		private readonly IUnitOfWork _unitOfWork;
	


		public AnswerController(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}

		public IActionResult Index()
		{
			return View();
		}

		//GET
		public IActionResult Upsert(int? id)
		{
			AnswerVM AnswerVM = new()
			{
				Answer = new(),
				SubjectList = _unitOfWork.Subject.GetAll().Select(i => new SelectListItem
				{
					Text = i.Name,
					Value = i.Id.ToString()
				}),
				QuestionList = _unitOfWork.Question.GetAll().Select(i => new SelectListItem
				{
					Text = i.QuestionText,
					Value = i.Id.ToString()
				}),
			};

			if (id == null || id == 0)
			{
				//create product
				//ViewBag.CategoryList = CategoryList;
				//ViewData["CoverTypeList"] = CoverTypeList;
				return View(AnswerVM);
			}
			else
			{
				AnswerVM.Answer = _unitOfWork.Answer.GetFirstOrDefault(u => u.Id == id);
				return View(AnswerVM);

				//update product
			}


		}

		//POST
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult Upsert(AnswerVM obj, IFormFile? file)
		{

			if (ModelState.IsValid)
			{
				if (obj.Answer.Id == 0)
				{
					_unitOfWork.Answer.Add(obj.Answer);
				}
				else
				{
					_unitOfWork.Answer.Update(obj.Answer);
				}
				_unitOfWork.Save();
				TempData["success"] = "Answer created successfully";
				return RedirectToAction("Index");
			}
			return View(obj);
		}



		#region API CALLS
		[HttpGet]
		public IActionResult GetAll()
		{
			var productList = _unitOfWork.Answer.GetAll(includeProperties: "Question,Subject");
			return Json(new { data = productList });
		}

		//POST
		[HttpDelete]
		public IActionResult Delete(int? id)
		{
			var obj = _unitOfWork.Answer.GetFirstOrDefault(u => u.Id == id);
			if (obj == null)
			{
				return Json(new { success = false, message = "Error while deleting" });
			}

			_unitOfWork.Answer.Remove(obj);
			_unitOfWork.Save();
			return Json(new { success = true, message = "Delete Successful" });

		}
		#endregion
	}
}

