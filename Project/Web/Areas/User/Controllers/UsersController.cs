using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Business.Managers;
using Dto.DTOS.AppUserDtos;
using Entity.DTOS.AppUserDtos;
using Entity.Tables;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Web.Areas.User.Controllers
{
    [Area("User")]
    [Authorize]
    public class UsersController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly AppUserManager _appUserManager;
        private readonly SignInManager<AppUser> _signInManager;

        public UsersController(UserManager<AppUser> userManager, AppUserManager appUserManager, SignInManager<AppUser> signInManager)
        {
            _userManager = userManager;
            _appUserManager = appUserManager;
            _signInManager = signInManager;
        }



        public async Task<IActionResult> Index()
        {
         
            var userId = await _userManager.FindByNameAsync(User.Identity.Name);
            if (userId != null)
            {
                List<AppUser> user = new List<AppUser>();
                AppUser app = new AppUser();
                app.Id = userId.Id;
                app.Name = userId.Name;
                app.UserName = userId.UserName;
                app.SurName = userId.SurName;
                user.Add(app);
                ViewBag.users = user;
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
            return View();
        }
        public async Task<IActionResult> Update(string Id)
        {
            var user = await _userManager.FindByIdAsync(Id);
            TempData["user"] = user.Id;
            ViewBag.users = await _appUserManager.Update(Id);
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Update(AppUserUpdateDto model)
        {
            if (ModelState.IsValid)
            {
                var userId = TempData["user"];
                string Id = userId.ToString();

                await _appUserManager.UpdatePost(Id, model);
                return RedirectToAction("Index");

            }
            return View("", model);
        }

        public async Task<IActionResult> Delete(string Id)
        {
            await _appUserManager.Delete(Id);
            return RedirectToAction("Index", "Home", new { area = "Login" });
        }

     


    }
}
