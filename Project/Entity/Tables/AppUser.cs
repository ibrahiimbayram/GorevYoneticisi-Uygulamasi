using Entity.Interfaces;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entity.Tables
{
    public class AppUser : IdentityUser<int> ,ITable
    {
        public string Name { get; set; }
        public string SurName { get; set; }
        public string ImagePath { get; set; }
        public string Password { get; set; }

    }
}
