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
    public class StandardRepository : Repository<Standard>, IStandardRepository
    {
        private ApplicationDbContext _db;

        public StandardRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }


        public void Update(Standard obj)
        {
            //_db.Standards.Update(obj);
        }
    }
}
