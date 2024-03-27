using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Supervise.Data
{
    public class SupervisorService
    {
        SupervisorDataAccessLayer objSupervisorDAL = new SupervisorDataAccessLayer();


        public SupervisorInfo GetSupervisorsById(int id)
        {
            SupervisorInfo Supervisor = objSupervisorDAL.GetSupervisorData(id);
            return Supervisor;
        }
        public string UpdateSupervisors(SupervisorInfo objSupervisor)
        {
            objSupervisorDAL.UpdateSupervisors(objSupervisor);
            return "Update Successfully";
        }

    }
}
