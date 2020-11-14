using System;
using System.Collections.Generic;
using System.Text;

namespace Entity.DTOS.TaskDtos
{
    public class TaskUpdateDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string ShortDescription { get; set; }
        public string Description { get; set; }
        public int TaskDate { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime FinishDate { get; set; }
        public int AppUserId { get; set; }
        public string Status { get; set; }

    }
}
