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

        IExamMarkRepository ExamMark { get; }

        IStudentSubjectRepository StudentSubject { get; }

        ICompanytRepository Company { get; }

        //IDepartmentRepository Department { get; }
        //IShoppingCartRepository ShoppingCart { get; }
        //IApplicationUserRepository ApplicationUser { get; }
        //IOrderDetailRepository OrderDetail { get; }
        //IOrderHeaderRepository OrderHeader { get; }

        void Save();
	}
}
