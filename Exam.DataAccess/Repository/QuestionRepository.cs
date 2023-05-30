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
	public class QuestionRepository : Repository<Question>, IQuestionRepository
	{
		private ApplicationDbContext _db;

		public QuestionRepository(ApplicationDbContext db) : base(db)
		{
			_db = db;
		}


		public void Update(Question obj)
		{
			var objFromDb = _db.Questions.FirstOrDefault(u => u.Id == obj.Id);
			if (objFromDb != null)
			{
				objFromDb.DisplayOrder = obj.DisplayOrder;
				objFromDb.QuestionText = obj.QuestionText;
				objFromDb.Subject = obj.Subject;
			}
		}
	}
}
