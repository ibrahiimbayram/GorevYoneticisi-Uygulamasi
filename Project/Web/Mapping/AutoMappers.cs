using AutoMapper;
using Dto.DTOS.AppUserDtos;
using Entity.DTOS.AppUserDtos;
using Entity.DTOS.TaskDtos;
using Entity.Tables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web.Mapping
{
    public class AutoMappers : Profile
    {
        public AutoMappers()
        {
            CreateMap<AppUser, AppUserSignUp>();
            CreateMap<AppUserSignUp, AppUser>();

            CreateMap<AppUser, AppUserSignIn>();
            CreateMap<AppUserSignIn, AppUser>();

            CreateMap<Tasks, AddTaskDto>();
            CreateMap<AddTaskDto, Tasks>();


            CreateMap<Tasks, TaskActiveListDto>();
            CreateMap<AddTaskDto, TaskActiveListDto>();

            CreateMap<Tasks, TaskDetailListDto>();
            CreateMap<AddTaskDto, TaskDetailListDto>();

            CreateMap<Tasks, TaskUpdateDto>();
            CreateMap<TaskUpdateDto, Tasks>();

            CreateMap<AppUser, AppUserLoginDto>();
            CreateMap<AppUserLoginDto, AppUser>();


            CreateMap<AppUser, AppUserAddDto>();
            CreateMap<AppUserAddDto, AppUser>();

            CreateMap<AppUser, AppUserUpdateDto>();
            CreateMap<AppUserUpdateDto, AppUser>();

            CreateMap<AppUser, AppUserListDto>();
            CreateMap<AppUserListDto, AppUser>();

            CreateMap<AppUser, AppUserDeleteDto>();
            CreateMap<AppUserDeleteDto, AppUser>();


        }
    }
}
