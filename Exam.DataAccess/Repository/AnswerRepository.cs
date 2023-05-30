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
	public class AnswerRepository : Repository<Answer>, IAnswerRepository
	{
		private ApplicationDbContext _db;

		public AnswerRepository(ApplicationDbContext db) : base(db)
		{
			_db = db;
		}


		public void Update(Answer obj)
		{
			var objFromDb = _db.Answers.FirstOrDefault(u => u.Id == obj.Id);
			if (objFromDb != null)
			{
				objFromDb.AnswerText = obj.AnswerText;
				objFromDb.Subject = obj.Subject;
				objFromDb.Question = obj.Question;

			}
		}
	}
}
