using DataAcces.Context;
using DataAcces.Interfaces;
using Entity.Tables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces.Repositories
{
    public class EfTaskDateRepositories : EfGenericRepositories<TaskDate>, ITaskDateDal
    {
        private readonly DataContext _context;

        public EfTaskDateRepositories(DataContext context) : base(context)
        {
            _context = context;
        }

        public List<TaskDate> FindAsync(string v)
        {
            return _context.TaskDate.Where(I => I.Name == v).ToList();
        }

        public int GetAylik()
        {
            return _context.TaskDate.Where(I => I.Name == "Aylık").Select(I => I.Id).FirstOrDefault();
        }

        public int GetGunluk()
        {
            return _context.TaskDate.Where(I => I.Name == "Günlük").Select(I => I.Id).FirstOrDefault();
        }

        public int GetHaftalık()
        {
            return _context.TaskDate.Where(I => I.Name == "Haftalık").Select(I => I.Id).FirstOrDefault();
        }

      
    }
}
