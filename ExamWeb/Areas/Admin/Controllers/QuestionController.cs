using Exam.DataAccess.Repository.IRepository;
using Exam.Model.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ExamWeb.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class QuestionController : Controller
	{
		private readonly IUnitOfWork _unitOfWork;


		public QuestionController(IUnitOfWork unitOfWork)
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
			QuestionVM QuestionVM = new()
			{
				Question = new(),
				SubjectList = _unitOfWork.Subject.GetAll().Select(i => new SelectListItem
				{
					Text = i.Name,
					Value = i.Id.ToString()
				}),
			};

			if (id == null || id == 0)
			{
				//create product
				//ViewBag.CategoryList = CategoryList;
				//ViewData["CoverTypeList"] = CoverTypeList;
				return View(QuestionVM);
			}
			else
			{
				QuestionVM.Question = _unitOfWork.Question.GetFirstOrDefault(u => u.Id == id);
				return View(QuestionVM);

				//update product
			}


		}

		//POST
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult Upsert(QuestionVM obj, IFormFile? file)
		{

			if (ModelState.IsValid)
			{
				if (obj.Question.Id == 0)
				{
					_unitOfWork.Question.Add(obj.Question);
				}
				else
				{
					_unitOfWork.Question.Update(obj.Question);
				}
				_unitOfWork.Save();
				TempData["success"] = "Question created successfully";
				return RedirectToAction("Index");
			}
			return View(obj);
		}



		#region API CALLS
		[HttpGet]
		public IActionResult GetAll()
		{
			var productList = _unitOfWork.Question.GetAll(includeProperties: "Subject");
			return Json(new { data = productList });
		}

		//POST
		[HttpDelete]
		public IActionResult Delete(int? id)
		{
			var obj = _unitOfWork.Question.GetFirstOrDefault(u => u.Id == id);
			if (obj == null)
			{
				return Json(new { success = false, message = "Error while deleting" });
			}

			_unitOfWork.Question.Remove(obj);
			_unitOfWork.Save();
			return Json(new { success = true, message = "Delete Successful" });

		}
		#endregion
	}
}

