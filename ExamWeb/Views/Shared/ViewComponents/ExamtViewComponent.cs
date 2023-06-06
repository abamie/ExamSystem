using Exam.DataAccess.Repository.IRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ExamWeb.ViewComponents
{
    public class ExamtViewComponent : ViewComponent
    {
        private readonly IUnitOfWork _unitOfWork;
        public ExamtViewComponent(IUnitOfWork unitOfWork)
        {
            _unitOfWork= unitOfWork;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);
            //if (claim != null)
            //{
            //    if (HttpContext.Session.GetInt32(SD.SessionCart) != null)
            //    {
            //        return View(HttpContext.Session.GetInt32(SD.SessionCart));
            //    }
            //    else
            //    {
            //        HttpContext.Session.SetInt32(SD.SessionCart,
            //            _unitOfWork.ShoppingCart.GetAll(u => u.ApplicationUserId == claim.Value).ToList().Count);
            //        return View(HttpContext.Session.GetInt32(SD.SessionCart));
            //    }
            //}
            //else
            //{
            //    HttpContext.Session.Clear();
            //    return View(0);
            //}
            return View(0);
        }
    }
}
