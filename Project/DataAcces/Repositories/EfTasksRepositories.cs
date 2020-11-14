using DataAcces.Context;
using DataAcces.Interfaces;
using Entity.Tables;
using Microsoft.AspNetCore.Identity;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DataAcces.Repositories
{
    public class EfTasksRepositories : EfGenericRepositories<Tasks>, ITasksDal
    {

        private readonly DataContext _context;

        private readonly ITaskDateDal _taskDateDal;
        private readonly UserManager<AppUser> _userManager;
        public EfTasksRepositories(DataContext context, ITaskDateDal taskDateDal, UserManager<AppUser> userManager) : base(context)
        {

            _context = context;
            _taskDateDal = taskDateDal;
            _userManager = userManager;
        }
        public List<Tasks> GetTodayActiveTasks(out int toplamsayfa, int aktifsayfa = 1, int? userId = null)
        {

            var result = _context.Tasks.Where(I => I.Status == "Active" && I.AppUserId == userId).Select(I => new Tasks
            {
                Id = I.Id,
                Title = I.Title,
                ShortDescription = I.ShortDescription,
                StartDate = I.StartDate,
                FinishDate = I.FinishDate
            });


            toplamsayfa = (int)Math.Ceiling((double)result.Count() / 6);
            result = result.OrderByDescending(I => I.Id).Skip((aktifsayfa - 1) * 6).Take(6);
            return result.ToList();
        }

        public List<Tasks> GetActiveTasks(out int toplamsayfa, int aktifsayfa = 1, int? userId = null)
        {

            var result = _context.Tasks.Where(I => I.Status == "Active" && I.AppUserId == userId).Select(I => new Tasks
            {
                Id = I.Id,
                Title = I.Title,
                ShortDescription = I.ShortDescription,
                StartDate = I.StartDate,
                FinishDate = I.FinishDate
            });


            toplamsayfa = (int)Math.Ceiling((double)result.Count() / 6);
            result = result.OrderByDescending(I => I.Id).Skip((aktifsayfa - 1) * 6).Take(6);
            return result.ToList();
        }

        public List<Tasks> GetDetailTask(string id, int? userId = null)
        {
            var result = _context.Tasks.Where(I => I.Title == id && I.AppUserId == userId).Select(I => new Tasks()
            {
                Id = I.Id,
                Title = I.Title,
                ShortDescription = I.ShortDescription,
                Description = I.Description,
                StartDate = I.StartDate,
                FinishDate = I.FinishDate,
                TaskDate = I.TaskDate,




            });

            return result.ToList();
        }

        public List<Tasks> GetListTasks(out int toplamsayfa, int aktifsayfa = 1, int TaskDate = 1, int? userId = null)
        {
            //var gunluk = _taskDateDal.GetGunluk();
            var result = _context.Tasks.Where(I => I.Status == "Active" && I.TaskDate == TaskDate && I.AppUserId == userId).Select(I => new Tasks
            {
                Id = I.Id,
                Title = I.Title,
                ShortDescription = I.ShortDescription,
                StartDate = I.StartDate,
                FinishDate = I.FinishDate
            });


            toplamsayfa = (int)Math.Ceiling((double)result.Count() / 6);
            result = result.OrderByDescending(I => I.Id).Skip((aktifsayfa - 1) * 6).Take(6);
            return result.ToList();
        }

        public List<Tasks> GetOldTasks(out int toplamSayfa, int aktifSayfa = 1, int? userId = null)
        {
            var result = _context.Tasks.Where(I => I.Status == "Completed" && I.AppUserId == userId).Select(I => new Tasks()
            {
                Id = I.Id,
                Title = I.Title,
                ShortDescription = I.ShortDescription,
                StartDate = I.StartDate,
                FinishDate = I.FinishDate


            });

            toplamSayfa = (int)Math.Ceiling((double)result.Count() / 6);
            result = result.OrderByDescending(I => I.Id).Skip((aktifSayfa - 1) * 6).Take(6);
            return result.ToList();
        }

        public int GetTotalTasksCount(int? userId = null)
        {
            return _context.Tasks.Where(I => I.AppUserId == userId).Count();
        }

        public int GetActiveTasksCount(int? userId = null)
        {
            return _context.Tasks.Where(I => I.AppUserId == userId && I.Status == "Active").Count();
        }

        public int GetTodayTasksCount(int? userId = null, int TaskDate = 1)
        {
            return _context.Tasks.Where(I => I.AppUserId == userId && I.TaskDate == TaskDate).Count();
        }

        public int GetWeekTasksCount(int? userId = null, int TaskDate = 1)
        {
            return _context.Tasks.Where(I => I.AppUserId == userId && I.TaskDate == TaskDate).Count();
        }

        public int GetMonthTasksCount(int? userId = null, int TaskDate = 1)
        {
            return _context.Tasks.Where(I => I.AppUserId == userId && I.TaskDate == TaskDate).Count();
        }

        public int GetCompletedTasksCount(int? userId = null)
        {
            return _context.Tasks.Where(I => I.AppUserId == userId && I.Status == "Completed").Count();
        }

    }
}
