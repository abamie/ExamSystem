using Exam.DataAccess.Repository.IRepository;
using Exam.Model.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ExamWeb.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class StudentSubjectController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;


        public StudentSubjectController(IUnitOfWork unitOfWork)
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
            StudentSubjectVM StudentSubjectVM = new()
            {
                StudentSubject = new(),
                SubjectList = _unitOfWork.Subject.GetAll().Select(i => new SelectListItem
                {
                    Text = i.Name,
                    Value = i.Id.ToString()
                }),
				StudentList = _unitOfWork.Student.GetAll().Select(i => new SelectListItem
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
                return View(StudentSubjectVM);
            }
            else
            {
                StudentSubjectVM.StudentSubject = _unitOfWork.StudentSubject.GetFirstOrDefault(u => u.Id == id);
                return View(StudentSubjectVM);

                //update product
            }


        }

        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Upsert(StudentSubjectVM obj, IFormFile? file)
        {

            if (ModelState.IsValid)
            {
                if (obj.StudentSubject.Id == 0)
                {
                    _unitOfWork.StudentSubject.Add(obj.StudentSubject);
                }
                else
                {
                    _unitOfWork.StudentSubject.Update(obj.StudentSubject);
                }
                _unitOfWork.Save();
                TempData["success"] = "StudentSubject created successfully";
                return RedirectToAction("Index");
            }
            return View(obj);
        }



        #region API CALLS
        [HttpGet]
        public IActionResult GetAll()
        {
            var productList = _unitOfWork.StudentSubject.GetAll(includeProperties: "Student,Subject");
            return Json(new { data = productList });
        }

        //POST
        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var obj = _unitOfWork.StudentSubject.GetFirstOrDefault(u => u.Id == id);
            if (obj == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }

            _unitOfWork.StudentSubject.Remove(obj);
            _unitOfWork.Save();
            return Json(new { success = true, message = "Delete Successful" });

        }
        #endregion
    }
}

