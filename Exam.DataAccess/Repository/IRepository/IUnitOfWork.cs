using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.DataAccess.Repository.IRepository
{
	public interface IUnitOfWork
	{
		ISubjectRepository Subject { get; }
		IStandardRepository Standard { get; }

		IStudentRepository Student { get; }

		IQuestionRepository Question { get; }

		IAnswerRepository Answer { get; }

        IChoiceRepository Choice { get; }

        //ICompanyRepository Company { get; }
        //IShoppingCartRepository ShoppingCart { get; }
        //IApplicationUserRepository ApplicationUser { get; }
        //IOrderDetailRepository OrderDetail { get; }
        //IOrderHeaderRepository OrderHeader { get; }

        void Save();
	}
}
