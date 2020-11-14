using Entity.Interfaces;
using Entity.Tables;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces.Interfaces
{
    public interface ITasksDal : IGenericDal<Tasks>, ITable
    {
        List<Tasks> GetActiveTasks(out int toplamsayfa, int aktifsayfa = 1, int? userId = null);
        List<Tasks> GetTodayActiveTasks(out int toplamsayfa, int aktifsayfa = 1, int? userId = null);
        List<Tasks> GetListTasks(out int toplamsayfa, int aktifsayfa = 1, int TaskDate = 1, int? userId = null);
        List<Tasks> GetDetailTask(string id, int? userId = null);
        List<Tasks> GetOldTasks(out int toplamSayfa, int aktifSayfa = 1, int? userId = null);
        int GetTotalTasksCount(int? userId = null);
        int GetActiveTasksCount(int? userId = null);
        int GetTodayTasksCount(int? userId = null, int TaskDate = 1);
        int GetWeekTasksCount(int? userId = null, int TaskDate = 1);
        int GetMonthTasksCount(int? userId = null, int TaskDate = 1);
        int GetCompletedTasksCount(int? userId = null);
    }
}
