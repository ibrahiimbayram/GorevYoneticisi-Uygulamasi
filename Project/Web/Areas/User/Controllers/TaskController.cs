using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Business.Managers;
using DataAcces.Context;
using Entity.DTOS.TaskDtos;
using Entity.Tables;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Web.Areas.User.Controllers
{
    [Area("User")]
    [Authorize]
    [AutoValidateAntiforgeryToken]
    public class TaskController : Controller
    {
        private readonly TasksManager _tasksManager;
        private readonly UserManager<AppUser> _userManager;


        public TaskController(TasksManager tasksManager, UserManager<AppUser> userManager)
        {
            _tasksManager = tasksManager;
            _userManager = userManager;
        }


        public async Task<IActionResult> Index(int page = 1)
        {
            var veri = await _tasksManager.GetAsync();
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            int user = userId.Id;

            ViewBag.sure = veri;

            ViewBag.aktifsayfa = page;
            var gorevler = _tasksManager.GetActiveTasks(out int toplamsayfa, page, user);

            ViewBag.toplamsayfa = toplamsayfa;
            ViewBag.veriler = gorevler;
            return View();
        }

        public async Task<IActionResult> Detail(string id)
        {
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            int user = userId.Id;
            var veri = _tasksManager.GetDetailTask(id, user);

            Tasks bitistarihi = new Tasks();
            foreach (var item in veri)
            {
                bitistarihi.FinishDate = item.FinishDate;
            }
            var a = bitistarihi.FinishDate.ToString("dd MM yyyy");

            var kalansure = Convert.ToDateTime(a) - DateTime.Now.Date;
            var gun = kalansure.TotalDays;
            ViewBag.kalangun = gun;

            ViewBag.detail = veri;


            return View();
        }

        public IActionResult Ara(int TaskDate)
        {
            TempData["id"] = TaskDate;

            return RedirectToAction("List");
        }
        public async Task<IActionResult> List(int page = 1)
        {
            var veri = await _tasksManager.GetAsync();

            ViewBag.sure = veri;

            int id = (int)TempData["id"];
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            int user = userId.Id;

            ViewBag.aktifsayfa = page;
            var gorevler = _tasksManager.GetSelectTask(out int toplamsayfa, page, id, user);

            ViewBag.toplamsayfa = toplamsayfa;
            ViewBag.veriler = gorevler;

            return View();
        }
        public async Task<IActionResult> Create()
        {
            
            var veri = await _tasksManager.GetAsync();

            ViewBag.veriler = veri;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(AddTaskDto addTaskDto)
        {
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            addTaskDto.AppUserId = userId.Id;
            await _tasksManager.CreateAsync(addTaskDto);

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> GetTodayTask(int page = 1)
        {
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            int user = userId.Id;
            ViewBag.aktifsayfa = page;
            var gorevler = _tasksManager.GetTodayActiveTasks(out int toplamsayfa, page, user);

            ViewBag.toplamsayfa = toplamsayfa;
            ViewBag.veriler = gorevler;


            return View();
        }

        public async Task<IActionResult> DeleteTasks(Tasks tasks)
        {
            await _tasksManager.DeleteTasks(tasks);


            return RedirectToAction("Index");
        }

        public async Task<IActionResult> UpdateTasksIndex(int Id)
        {
            ViewBag.sure = await _tasksManager.GetAsync();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> UpdateTasksIndex(TaskUpdateDto taskUpdateDto)
        {
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            taskUpdateDto.AppUserId = userId.Id;
            await _tasksManager.UpdateTasksPost(taskUpdateDto);

            return RedirectToAction("Index");
        }


        public async Task<IActionResult> GetOldTasks(int page = 1)
        {
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            int user = userId.Id;
            ViewBag.aktifsayfa = page;
            var gorevler = _tasksManager.GetOldTaskList(out int toplamsayfa, page, user);

            ViewBag.toplamsayfa = toplamsayfa;
            ViewBag.veriler = gorevler;
            return View();
        }

        public async Task<IActionResult> Details(string id)
        {
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            int user = userId.Id;
            var veri = _tasksManager.GetDetailTask(id, user);
            ViewBag.detail = veri;
            return View();
        }

        public async Task<IActionResult> DeleteTask(Tasks tasks)
        {
            await _tasksManager.DeleteTasks(tasks);


            return RedirectToAction("GetOldTasks");
        }

        public async Task<IActionResult> Completed(int id)
        {
            await _tasksManager.Completed(id);


            return RedirectToAction("GetOldTasks");
        }

    }
}
