using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper.Configuration.Annotations;
using Business.Managers;
using DataAcces.Interfaces;
using Entity.Tables;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Web.Areas.User.Controllers
{
    [Area("User")]
    public class HomeController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly ITasksDal _tasksDal;
        private readonly ITaskDateDal _taskDateDal;
        private readonly TasksManager _tasksManager;
        public HomeController(UserManager<AppUser> userManager, ITasksDal tasksDal,ITaskDateDal taskDateDal, TasksManager tasksManager)
        {
            _userManager = userManager;
            _tasksDal = tasksDal;
            _taskDateDal = taskDateDal;
            _tasksManager = tasksManager;
        }
        public async Task<IActionResult> Index(int page=1)
        {
         
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            int user = userId.Id;
            var gunlukgorevler=  _tasksManager.GetTodayActiveTasks(out int toplamsayfa, page, user);
            ViewBag.aktifsayfa = page;
        

            ViewBag.toplamsayfa = toplamsayfa;
            ViewBag.veriler = gunlukgorevler;



            var gunluk = _taskDateDal.GetGunluk();
            var haftalik = _taskDateDal.GetHaftalık();
            var aylik = _taskDateDal.GetAylik();
     

            var total = _tasksDal.GetTotalTasksCount(user);
            ViewBag.total = total;

            var today = _tasksDal.GetTodayTasksCount(user, gunluk);
            ViewBag.today = today;

            var week = _tasksDal.GetWeekTasksCount(user, haftalik);
            ViewBag.week = week;

            var month = _tasksDal.GetMonthTasksCount(user, aylik);
            ViewBag.month = month;

            var active = _tasksDal.GetActiveTasksCount(user);
            ViewBag.active = active;

            var completed = _tasksDal.GetCompletedTasksCount(user);
            ViewBag.completed = completed;

            return View();
        }
    }
}


