using Exam.DataAccess.Repository.IRepository;
using Exam.Model.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ExamWeb.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ChoiceController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;



        public ChoiceController(IUnitOfWork unitOfWork)
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
            ChoiceVM ChoiceVM = new()
            {
                Choice = new(),
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
                return View(ChoiceVM);
            }
            else
            {
                ChoiceVM.Choice = _unitOfWork.Choice.GetFirstOrDefault(u => u.Id == id);
                return View(ChoiceVM);

                //update product
            }


        }

        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Upsert(ChoiceVM obj, IFormFile? file)
        {

            if (ModelState.IsValid)
            {
                if (obj.Choice.Id == 0)
                {
                    _unitOfWork.Choice.Add(obj.Choice);
                }
                else
                {
                    _unitOfWork.Choice.Update(obj.Choice);
                }
                _unitOfWork.Save();
                TempData["success"] = "Choice created successfully";
                return RedirectToAction("Index");
            }
            return View(obj);
        }



        #region API CALLS
        [HttpGet]
        public IActionResult GetAll()
        {
            var productList = _unitOfWork.Choice.GetAll(includeProperties: "Question");
            return Json(new { data = productList });
        }

        //POST
        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var obj = _unitOfWork.Choice.GetFirstOrDefault(u => u.Id == id);
            if (obj == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }

            _unitOfWork.Choice.Remove(obj);
            _unitOfWork.Save();
            return Json(new { success = true, message = "Delete Successful" });

        }
        #endregion
    }
}

