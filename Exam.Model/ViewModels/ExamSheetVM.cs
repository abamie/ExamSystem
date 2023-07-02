using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Model.ViewModels
{
    public class ExamSheetVM
    {
        public Answer answer { get; set; }
		public StudentSubject studentsubject { get; set; }
        public List<ChoiceVM> Choices { get; set; } = new List<ChoiceVM>();
    }
}
