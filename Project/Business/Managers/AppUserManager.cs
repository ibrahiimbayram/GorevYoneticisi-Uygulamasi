using DataAcces.Interfaces;
using Dto.DTOS.AppUserDtos;
using Entity.DTOS.AppUserDtos;
using Entity.Tables;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Business.Managers
{
    public class AppUserManager
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<AppRole> _roleManager;
        private readonly SignInManager<AppUser> _signInManager;
        public AppUserManager(UserManager<AppUser> userManager, RoleManager<AppRole> roleManager, SignInManager<AppUser> signInManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _signInManager = signInManager;
        }
        public async Task<AppUserSignUp> KayitOl(AppUserSignUp appUserSignUp)
        {
            AppUser user = new AppUser
            {
                UserName = appUserSignUp.UserName,
                Name = appUserSignUp.Name,
                PasswordHash = appUserSignUp.Password,
                SurName = appUserSignUp.SurName


            };

            var adminRole = await _roleManager.FindByNameAsync("User");
            if (adminRole == null)
            {
                AppRole role = new AppRole
                {
                    Name = "User"
                };


                await _roleManager.CreateAsync(role);
            }

            await _userManager.CreateAsync(user, appUserSignUp.Password);

            

            await _userManager.AddToRoleAsync(user, "User");


            return null;
        }
        public async Task<AppUserSignUp> GirisYap(AppUserSignIn appUserSignIn)
        {

            var user = await _userManager.FindByNameAsync(appUserSignIn.UserName);
            if (user != null)
            {
                await _signInManager.PasswordSignInAsync(user, appUserSignIn.Password, false, false);


            }
          

            return null;
        }
        public async Task<List<AppUser>> Update(string Id)
        {
            var user = await _userManager.FindByIdAsync(Id);


            List<AppUser> appUserUpdateDtos = new List<AppUser>();

            AppUser model = new AppUser();
            model.Id = user.Id;
            model.Name = user.Name;
            model.UserName = user.UserName;
            model.SurName = user.SurName;
            model.Password = user.Password;


            appUserUpdateDtos.Add(model);



            return appUserUpdateDtos;
        }


        public async Task<AppUser> UpdatePost(string Idd, AppUserUpdateDto model)
        {

            var userId = Idd;
            string Id = userId.ToString();

            var user = await _userManager.FindByIdAsync(Id);

            user.Id = model.Id;
            user.Name = model.Name;
            user.UserName = model.UserName;
            user.SurName = model.SurName;
            user.Password = model.Password;




            await _userManager.UpdateAsync(user);
            return null;
        }


        public async Task<AppUser> Delete(string Id)
        {
            var user = await _userManager.FindByIdAsync(Id);

            await _userManager.DeleteAsync(user);


            return null;
        }

    }
}
