using Exam.DataAccess.Data;
using Exam.DataAccess.Repository.IRepository;
using Exam.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.DataAccess.Repository
{
	public class UnitOfWork : IUnitOfWork
	{
		private ApplicationDbContext _db;

		public UnitOfWork(ApplicationDbContext db)
		{
			_db = db;
			Subject = new SubjectRepository(_db);
			Standard = new StandardRepository(_db);
			Student = new StudentRepository(_db);
			Question= new QuestionRepository(_db);
			Answer = new AnswerRepository(_db);
            Choice = new ChoiceRepository(_db);

            //Company = new CompanyRepository(_db);
            //ApplicationUser = new ApplicationUserRepository(_db);
            //ShoppingCart = new ShoppingCartRepository(_db);
            //OrderHeader = new OrderHeaderRepository(_db);
            //OrderDetail = new OrderDetailRepository(_db);
        }
		public ISubjectRepository Subject { get; private set; }
		public IStandardRepository Standard { get; private set; }

		public IStudentRepository Student { get; private set; }

		public IQuestionRepository Question { get; private set; }

		public IAnswerRepository Answer { get; private set; }

        public IChoiceRepository Choice { get; private set; }

        //public IShoppingCartRepository ShoppingCart { get; private set; }

        //public IApplicationUserRepository ApplicationUser { get; private set; }
        //public IOrderHeaderRepository OrderHeader { get; private set; }
        //public IOrderDetailRepository OrderDetail { get; private set; }

        public void Save()
		{
			_db.SaveChanges();
		}
	}
}

