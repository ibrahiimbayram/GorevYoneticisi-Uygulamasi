using System;
using System.Collections.Generic;
using System.Text;

namespace Entity.DTOS.TaskDtos
{
    public class TaskActiveListDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string ShortDescription { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime FinishDate { get; set; }
        public string Status { get; set; }

    }
}
