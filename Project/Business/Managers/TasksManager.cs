using AutoMapper;
using Business.StringInfo;
using DataAcces.Context;
using DataAcces.Interfaces;
using DataAcces.Repositories;
using Entity.DTOS.TaskDtos;
using Entity.Interfaces;
using Entity.Tables;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace Business.Managers
{
    public class TasksManager
    {
        //private readonly IGenericDal<Tasks> _genericDal;
        private readonly IGenericDal<TaskDate> _generictaskdate;
        IMapper _mapper;
        private readonly UserManager<AppUser> _userManager;
        private readonly ITaskDateDal _taskDateDal;

        //private readonly MongoRepositories<Tasks> _mongo;
        private readonly ITasksDal _tasksDal;


        public TasksManager(ITasksDal tasksDal, ITaskDateDal taskDateDal/*, IGenericDal<Tasks> genericDal*/, IMapper mapper, UserManager<AppUser> userManager, IGenericDal<TaskDate> generic)
        {
            //_genericDal = genericDal;

            _mapper = mapper;
            _userManager = userManager;
            _generictaskdate = generic;
            _taskDateDal = taskDateDal;
            _tasksDal = tasksDal;

        }

 


        public async Task<AddTaskDto> CreateAsync(AddTaskDto addTaskDto)
        {
            //var veri = await _generictaskdate.GetAllAsync();



            var gunluk = _taskDateDal.GetGunluk();
            var haftalik = _taskDateDal.GetHaftalık();
            var aylik = _taskDateDal.GetAylik();



            if (addTaskDto.TaskDate == gunluk)
            {
                addTaskDto.StartDate = DateTime.Now;
                addTaskDto.FinishDate = DateTime.Now.AddDays(1);
            }
            else if (addTaskDto.TaskDate == haftalik)
            {
                addTaskDto.StartDate = DateTime.Now;
                addTaskDto.FinishDate = DateTime.Now.AddDays(7);
            }
            else if (addTaskDto.TaskDate == aylik)
            {
                addTaskDto.StartDate = DateTime.Now;
                addTaskDto.FinishDate = DateTime.Now.AddDays(30);
            }


            addTaskDto.Status = "Active";


            await _tasksDal.AddAsync(_mapper.Map<Tasks>(addTaskDto));

            return null;
        }

        public async Task<List<TaskDate>> GetAsync()
        {
            var veri = await _generictaskdate.GetAllAsync();

            List<TaskDate> a = new List<TaskDate>();
            foreach (var item in veri)
            {
                TaskDate b = new TaskDate();
                b.Id = item.Id;
                b.Name = item.Name;

                a.Add(b);
            }

            return a;
        }

        public List<TaskActiveListDto> GetActiveTasks(out int toplamsayfa, int aktifsayfa = 1, int? userId = null)
        {




            return _mapper.Map<List<TaskActiveListDto>>(_tasksDal.GetActiveTasks(out toplamsayfa, aktifsayfa, userId));
        }

        public List<TaskDetailListDto> GetDetailTask(string id, int? userId = null)
        {
            return _mapper.Map<List<TaskDetailListDto>>(_tasksDal.GetDetailTask(id, userId));
        }

        public List<TaskActiveListDto> GetTodayActiveTasks(out int toplamsayfa, int aktifsayfa = 1, int? userId = null)
        {




            return _mapper.Map<List<TaskActiveListDto>>(_tasksDal.GetTodayActiveTasks(out toplamsayfa, aktifsayfa, userId)); ;
        }


        public List<TaskDetailListDto> GetSelectTask(out int toplamsayfa, int aktifsayfa = 1, int TaskDate = 1, int? userId = null)
        {
            return _mapper.Map<List<TaskDetailListDto>>(_tasksDal.GetListTasks(out toplamsayfa, aktifsayfa, TaskDate, userId));
        }


        public async Task<Tasks> DeleteTasks(Tasks tasks)
        {
            await _tasksDal.RemoveAsync(tasks);
            return null;
        }

        public async Task<Tasks> UpdateTasksIndex(int Id)
        {
            return await _tasksDal.GetById(Id);
        }

        public async Task<TaskUpdateDto> UpdateTasksPost(TaskUpdateDto taskUpdateDto)
        {
            //var veri = await _generictaskdate.GetAllAsync();



            var gunluk = _taskDateDal.GetGunluk();
            var haftalik = _taskDateDal.GetHaftalık();
            var aylik = _taskDateDal.GetAylik();



            if (taskUpdateDto.TaskDate == gunluk)
            {
                taskUpdateDto.StartDate = DateTime.Now;
                taskUpdateDto.FinishDate = DateTime.Now.AddDays(1);
            }
            else if (taskUpdateDto.TaskDate == haftalik)
            {
                taskUpdateDto.StartDate = DateTime.Now;
                taskUpdateDto.FinishDate = DateTime.Now.AddDays(7);
            }
            else if (taskUpdateDto.TaskDate == aylik)
            {
                taskUpdateDto.StartDate = DateTime.Now;
                taskUpdateDto.FinishDate = DateTime.Now.AddDays(30);
            }
            taskUpdateDto.Status = "Active";


            //await _genericDal.UpdateAsync(_mapper.Map<Tasks>(taskUpdateDto));



            return null;
        }

        public async Task<Tasks> Completed(int Id)
        {
            var update = await _tasksDal.GetById(Id);

            update.Status = "Completed";

            await _tasksDal.UpdateAsync(update);


            return null;
        }

        public List<TaskDetailListDto> GetOldTaskList(out int toplamsayfa, int aktifsayfa = 1, int? userId = null)
        {
            return _mapper.Map<List<TaskDetailListDto>>(_tasksDal.GetOldTasks(out toplamsayfa, aktifsayfa, userId));
        }
    }
}
