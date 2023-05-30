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
	public class ExamMarkRepository : Repository<ExamMark>, IExamMarkRepository
	{
		private ApplicationDbContext _db;

		public ExamMarkRepository(ApplicationDbContext db) : base(db)
		{
			_db = db;
		}


		public void Update(ExamMark obj)
		{
			var objFromDb = _db.ExamMarks.FirstOrDefault(u => u.Id == obj.Id);
			if (objFromDb != null)
			{
				objFromDb.Grade = obj.Grade;
				objFromDb.Marks = obj.Marks;
				objFromDb.Subject = obj.Subject;
				objFromDb.Student = obj.Student;
				objFromDb.Comment = obj.Comment;
			}
		}
	}
}
