using System;
using AutoMapper;
using Business.Managers;
using DataAcces.Context;
using DataAcces.Interfaces;
using DataAcces.Repositories;
using Entity.Tables;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;

namespace Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
    
        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //string mongoConnectionString = this.Configuration.GetConnectionString("MongoConnectionString");
            //services.AddTransient(s => new TasksRepositories(mongoConnectionString, "ProjeDb", "Tasks"));


            //services.AddTransient(typeof(MongoRepositories<>));

            services.AddDbContext<DataContext>(opt => opt.UseSqlServer(Configuration.GetConnectionString("ProjectDb")));

            services.AddControllersWithViews();
            services.AddIdentity<AppUser, AppRole>(opt =>
            {
                opt.Password.RequireDigit = false;
                opt.Password.RequireLowercase = false;
                opt.Password.RequiredLength = 1;
                opt.Password.RequireNonAlphanumeric = false;
                opt.Password.RequireUppercase = false;

            }).AddEntityFrameworkStores<DataContext>();

            services.ConfigureApplicationCookie(opt =>
            {
                opt.LoginPath = "/User/Login/";
                opt.Cookie.Name = "IdentityCookie";
                opt.Cookie.SameSite = Microsoft.AspNetCore.Http.SameSiteMode.Strict;
                opt.Cookie.HttpOnly = false;
                opt.ExpireTimeSpan = TimeSpan.FromMinutes(20);
                opt.Cookie.SecurePolicy = Microsoft.AspNetCore.Http.CookieSecurePolicy.SameAsRequest;
            });

            services.AddAutoMapper(typeof(Startup));

            services.AddScoped(typeof(IGenericDal<>), typeof(EfGenericRepositories<>));
            services.AddScoped<ITaskDateDal, EfTaskDateRepositories>();
            services.AddScoped<ITasksDal, EfTasksRepositories>();

            services.AddScoped<AppUserManager>();
            services.AddScoped<TasksManager>();


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ITaskDateDal _genericDal)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();
            IdentityInitializer.SeedData(_genericDal).Wait();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                name: "areas",
                pattern: "{area}/{controller=Task}/{action=Index}/{id?}"

                );

                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
