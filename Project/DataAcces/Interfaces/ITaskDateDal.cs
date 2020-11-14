using Entity.Interfaces;
using Entity.Tables;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces.Interfaces
{
    public interface ITaskDateDal : IGenericDal<TaskDate>,ITable
    {
    
        int GetGunluk();
        int GetHaftalık();
        int GetAylik();

        List<TaskDate> FindAsync(string v);
    }
}
