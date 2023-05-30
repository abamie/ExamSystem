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
	public class ChoiceRepository : Repository<Choice>, IChoiceRepository
	{
		private ApplicationDbContext _db;

		public ChoiceRepository(ApplicationDbContext db) : base(db)
		{
			_db = db;
		}


		public void Update(Choice obj)
		{
			var objFromDb = _db.Choices.FirstOrDefault(u => u.Id == obj.Id);
			if (objFromDb != null)
			{
				objFromDb.ChoiceText = obj.ChoiceText;
				objFromDb.DispalyOrder = obj.DispalyOrder;
				objFromDb.Question = obj.Question;
			}
		}
	}
}
