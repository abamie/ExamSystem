using Exam.DataAccess.Repository.IRepository;
using Exam.Model.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace ExamWeb.Areas.Student.Controllers
{
    [Area("Student")]
    public class PerformanceController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        public PerformanceController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
       
        // GET: Chart
        public ActionResult Index()
        {
            int? studentId = HttpContext.Session.GetInt32("studentId");

            int? subjectid = HttpContext.Session.GetInt32("subjectId");
			List<PerformanceVM> perform = new List<PerformanceVM>();


			if (studentId != null && subjectid != null)
            {
                perform = _unitOfWork.ExamMark.GetAll(u => u.StudentId == studentId, includeProperties: "Student,Subject")
                    .Select(u => new PerformanceVM()
                    {
                        StudentDetail = u.Student,
                        SubjectDetail = u.Subject,
                        Marks = u.Marks,
                        Comment = u.Comment,
                        Grade = u.Grade,
                        Subject = u.Subject.Name,
                        Id = u.StudentId
                    }).ToList();
            }

            return View(perform);
        }

        public ActionResult PieChart()
        {

            int? studentId = HttpContext.Session.GetInt32("studentId");

            int? subjectid = HttpContext.Session.GetInt32("subjectId");

          
            List<PerformanceVM> rvm = new List<PerformanceVM>();
            List<PerformanceVM> perform = _unitOfWork.ExamMark.GetAll(u => u.StudentId == studentId, includeProperties: "Student,Subject")
                .Select(u => new PerformanceVM()
                {
                    StudentDetail = u.Student,
                    SubjectDetail = u.Subject,
                    Marks = u.Marks,
                    Comment = u.Comment,
                    Grade = u.Grade,
                    Subject = u.Subject.Name,
                    Id = u.StudentId
                }).ToList();


            return Json(perform);

            //return Json(entities.Countries.ToList(), JsonRequestBehavior.AllowGet);
        }

        //  [HttpPost]
        //public JsonResult DisplayChart()
        //{
        //    UserVM userConnected = Session["UserConnected"] as UserVM;
        //    List<object> data = new List<object>();
        //    List<string> labels = dbContext.TestResults.Where(u => u.UserID == userConnected.UserID).Select(p => p.Subject).ToList();
        //    data.Add(labels);

        //    List<int> SalesNumber = dbContext.TestResults.Where(u => u.UserID == userConnected.UserID).Select(p => p.Marks.Value).ToList();
        //    data.Add(SalesNumber);

        //    return Json(data, JsonRequestBehavior.AllowGet);
        //    return data;
        //}
    }
}


