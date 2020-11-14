using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Business.Managers;
using Entity.DTOS.AppUserDtos;
using Entity.Tables;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Web.Areas.User.Controllers
{
    [Area("User")]
    public class LoginController : Controller
    {
        private readonly AppUserManager _appuserManager;
        private readonly UserManager<AppUser> _userManager;

        private readonly SignInManager<AppUser> _signInManager;

        public LoginController(AppUserManager appuserManager, UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _appuserManager = appuserManager;
            _signInManager = signInManager;
            _userManager = userManager;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Index(AppUserSignIn appUserSignIn)
        {
            if (ModelState.IsValid)
            {
                await _appuserManager.GirisYap(appUserSignIn);

                return RedirectToAction("Index", "Task");
            }
            else
            {
                ModelState.AddModelError("", "Kullanıcı adı veya şifre hatalı");

            }

            return View("Index", appUserSignIn);
        }

        public IActionResult KayitOl()
        {

            return View();
        }
        [HttpPost]
        public async Task<IActionResult> KayitOl(AppUserSignUp appUserSignUp)
        {
            if (ModelState.IsValid)
            {
                await _appuserManager.KayitOl(appUserSignUp);
            }



            return RedirectToAction("Index");
        }

        public async Task<IActionResult> SignOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index");
        }

    }
}
