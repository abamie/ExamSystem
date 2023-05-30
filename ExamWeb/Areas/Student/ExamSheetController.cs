using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ExamWeb.Areas.Student
{
    public class ExamSheetController : Controller
    {
        // GET: ExamSheetController
        public ActionResult Index()
        {
            return View();
        }

        // GET: ExamSheetController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ExamSheetController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ExamSheetController/Create
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

        // GET: ExamSheetController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ExamSheetController/Edit/5
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

        // GET: ExamSheetController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ExamSheetController/Delete/5
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
