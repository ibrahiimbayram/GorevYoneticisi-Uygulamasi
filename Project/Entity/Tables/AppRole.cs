using Entity.Interfaces;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entity.Tables
{
    public class AppRole : IdentityRole<int> , ITable
    {
    }
}
