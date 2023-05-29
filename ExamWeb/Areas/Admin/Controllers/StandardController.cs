using Exam.DataAccess.Repository.IRepository;
using Exam.Model;
using Exam.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;


namespace ExamWeb.Areas.Admin.Controllers
{

	public class StandardController : Controller
	{
		private readonly IUnitOfWork _unitOfWork;

		public StandardController(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}

		public IActionResult Index()
		{
			IEnumerable<Standard> objCoverTypeList = _unitOfWork.Standard.GetAll();
			return View(objCoverTypeList);
		}

		//GET
		public IActionResult Create()
		{
			return View();
		}

		//POST
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult Create(Standard obj)
		{
			if (ModelState.IsValid)
			{
				_unitOfWork.Standard.Add(obj);
				_unitOfWork.Save();
				TempData["success"] = "Class created successfully";
				return RedirectToAction("Index");
			}
			return View(obj);
		}

		//GET
		public IActionResult Edit(int? id)
		{
			if (id == null || id == 0)
			{
				return NotFound();
			}
			var CoverTypeFromDbFirst = _unitOfWork.Standard.GetFirstOrDefault(u => u.Id == id);

			if (CoverTypeFromDbFirst == null)
			{
				return NotFound();
			}

			return View(CoverTypeFromDbFirst);
		}

		//POST
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult Edit(Standard obj)
		{

			if (ModelState.IsValid)
			{
				_unitOfWork.Standard.Update(obj);
				_unitOfWork.Save();
				TempData["success"] = "Class updated successfully";
				return RedirectToAction("Index");
			}
			return View(obj);
		}

		public IActionResult Delete(int? id)
		{
			if (id == null || id == 0)
			{
				return NotFound();
			}
			var CoverTypeFromDbFirst = _unitOfWork.Standard.GetFirstOrDefault(u => u.Id == id);

			if (CoverTypeFromDbFirst == null)
			{
				return NotFound();
			}

			return View(CoverTypeFromDbFirst);
		}

		//POST
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public IActionResult DeletePOST(int? id)
		{
			var obj = _unitOfWork.Standard.GetFirstOrDefault(u => u.Id == id);
			if (obj == null)
			{
				return NotFound();
			}

			_unitOfWork.Standard.Remove(obj);
			_unitOfWork.Save();
			TempData["success"] = "Class deleted successfully";
			return RedirectToAction("Index");

		}
	}
}
