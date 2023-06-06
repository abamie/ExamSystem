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
    public class StudentSubjectRepository : Repository<StudentSubject>, IStudentSubjectRepository
    {
        private ApplicationDbContext _db;

        public StudentSubjectRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }


        public void Update(StudentSubject obj)
        {
            var objFromDb = _db.StudentSubjects.FirstOrDefault(u => u.Id == obj.Id);
            if (objFromDb != null)
            {
                objFromDb.DisplayOrder = obj.DisplayOrder;
                objFromDb.ExamCode = obj.ExamCode;
                objFromDb.StudentId = obj.StudentId;
                objFromDb.Student = obj.Student;
                objFromDb.SubjectId = obj.SubjectId;
                objFromDb.Subject = obj.Subject;
            }
        }
    }
}
