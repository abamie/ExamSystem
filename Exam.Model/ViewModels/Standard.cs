using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Model.ViewModels
{
    public class Standard
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [DisplayName("Class ")]
        [StringLength(150)]
        public string Name { get; set; }
        public bool IsActive { get; set; } = true;
        public DateTime CreatedDateTime { get; set; } = DateTime.Now;
    }
}
