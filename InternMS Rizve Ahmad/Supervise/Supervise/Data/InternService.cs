using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace Supervise.Data
{
    public class InternService
    {
        InternDataAccessLayer objInternDAL = new InternDataAccessLayer();

        public List<InternInfo> GetIntern()
        {
            List<InternInfo> Intern = objInternDAL.ViewAllIntern().ToList();
            return Intern;
        }
        public List<InternInfo> GetFinishedIntern()
        {
            List<InternInfo> Intern = objInternDAL.ViewFinishedIntern().ToList();
            return Intern;
        }
        public List<InternInfo> GetAppliedIntern()
        {
            List<InternInfo> Intern = objInternDAL.ViewInternBySupervisor().ToList();
            return Intern;
        }

        public List<DashInfo> GetDashInfo()
        {
            List<DashInfo> dashboardInfo = objInternDAL.GetDashboardInfoAsync().ToList();
            return dashboardInfo;
        }
        public InternInfo GetInternById(int id)
        {
            InternInfo Intern = objInternDAL.GetInternData(id);
            return Intern;
        }
        public string UpdateIntern(InternInfo objintern)
        {
            objInternDAL.UpdateIntern(objintern);
            return "Update Successfully";
        }
        public string Finish(InternInfo objintern)
        {
            objInternDAL.Finish(objintern.Internid);
            return "Finished Successfully";
        }
        public void AddTask(AssignTaskInfo taskInfo)
        {
            objInternDAL.AssignTask(taskInfo);
        }

        public List<AssignTaskInfo> GetAssignedTasks(int internId)
        {
            return objInternDAL.GetAssignedTasks(internId);
        }
        public List<AssignTaskInfo> GetTasksByInternId(int internId)
        {
            List < AssignTaskInfo> tasks = objInternDAL.GetTasksById(internId).ToList();
            return tasks;
        }
        //public List<AssignTaskInfo> GetTaskById(int internId)
        //{
        //    return objInternDAL.GetTaskData(internId);
        //}

        //public AssignTaskInfo GetTaskById(int id)
        //{
        //    AssignTaskInfo TaskInfo = objInternDAL.GetTaskData(id);
        //    return TaskInfo;
        //}

        public void AddAttendance(AttendanceInfo attendanceInfo)
        {
            if (attendanceInfo.IsPresent == "Present")
            {
                if (!attendanceInfo.TimeIn.HasValue || !attendanceInfo.TimeOut.HasValue)
                {
                    throw new Exception("TimeIn and TimeOut values are required for attendance status 'Present'.");
                }

                // Handle late arrival
                if (attendanceInfo.TimeIn > attendanceInfo.Date.AddHours(10))
                {
                    attendanceInfo.IsCameLate = true;
                }

                // Handle leaving early
                if (attendanceInfo.TimeOut < attendanceInfo.Date.AddHours(17))
                {
                    attendanceInfo.IsLeaveEarly = true;
                }

                // Calculate duration
                attendanceInfo.Duration = attendanceInfo.TimeOut - attendanceInfo.TimeIn;

            }
            else
            {
                attendanceInfo.TimeIn = null;
                attendanceInfo.TimeOut = null;
                attendanceInfo.IsLeaveEarly = false;
                attendanceInfo.IsCameLate = false;
               
            }

            objInternDAL.AddAttendance(attendanceInfo);
        }
        public List<AttendanceInfo> GetAttendanceByInternId(int internId)
        {
            List<AttendanceInfo> attendance = objInternDAL.GetAttendanceById(internId).ToList();
            return attendance;
        }
    }
}

