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
	public class StudentRepository : Repository<Student>, IStudentRepository
	{
		private ApplicationDbContext _db;

		public StudentRepository(ApplicationDbContext db) : base(db)
		{
			_db = db;
		}


		public void Update(Student obj)
		{
			var objFromDb = _db.Students.FirstOrDefault(u => u.Id == obj.Id);
			if (objFromDb != null)
			{
				objFromDb.Name = obj.Name;
				objFromDb.RollNo = obj.RollNo;
				objFromDb.Address = obj.Address;
				objFromDb.Standard = obj.Standard;
				if (obj.ImageUrl != null)
				{
					objFromDb.ImageUrl = obj.ImageUrl;
				}
			}
		}
	}
}
