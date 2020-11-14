using DataAcces.Context;
using DataAcces.Interfaces;
using Entity.Tables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web
{
    public static class IdentityInitializer
    {
       //public static readonly IGenericDal<TaskDate> genericDal;

        public static async Task SeedData(ITaskDateDal _genericDal)
        {

            var veri = _genericDal.FindAsync("Günlük");
            if (veri.Count == 0)
            {
                var gunluk = new TaskDate { Name = "Günlük" };
               await _genericDal.AddAsync(gunluk);
                
            }

            var hafta =  _genericDal.FindAsync("Haftalık");
            if (hafta.Count == 0)
            {
                var haftalık = new TaskDate { Name = "Haftalık" };
                await _genericDal.AddAsync(haftalık);
            }

            var ay =  _genericDal.FindAsync("Aylık");
            if (ay.Count == 0)
            {
                var aylik = new TaskDate { Name = "Aylık" };
                await _genericDal.AddAsync(aylik);

            }
        }
    }
}
