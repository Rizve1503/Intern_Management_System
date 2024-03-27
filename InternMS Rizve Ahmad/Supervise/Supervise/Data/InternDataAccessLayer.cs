using Supervise.Pages;
using Microsoft.AspNetCore.Connections;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.PortableExecutable;
using System.Threading.Tasks;
using System.Runtime.Intrinsics.Arm;

namespace Supervise.Data
{
    public class InternDataAccessLayer
    {
        // string connectionString = "Put Your Connection string here";
        string connectionString = "Data Source=RIZVE_AHMAD\\SQLEXPRESS;Initial Catalog=Intern;Integrated Security=True";
        //To View all Interns details


        public IEnumerable<InternInfo> ViewAllIntern()
        {
            List<InternInfo> lstIntern = new List<InternInfo>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetInternBySupervisorID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    InternInfo Intern = new InternInfo();
                    Intern.Internid = Convert.ToInt32(rdr["Internid"]);
                    Intern.Name = rdr["Name"].ToString();
                    Intern.Password = rdr["Password"].ToString();
                    Intern.Email = rdr["Email"].ToString();
                    Intern.Phone = rdr["Phone"].ToString();
                    Intern.NID = rdr["NID"].ToString();
                    Intern.Gender = rdr["Gender"].ToString();
                   // Intern.Birth_Day = Convert.ToInt32(rdr["Birth_Day"]);
                   // Intern.Birth_Mounth = rdr["Birth_Mounth"].ToString();
                    //Intern.Birth_Year = Convert.ToInt32(rdr["Birth_Year"]);
                    Intern.Varsity_name = rdr["Varsity_name"].ToString();
                    Intern.Duration = rdr["Duration"].ToString();
                    Intern.DOB = Convert.ToDateTime(rdr["DOB"]);
                    Intern.Religion = rdr["Religion"].ToString();
                    Intern.Marital_status = rdr["Marital_status"].ToString();
                    // Intern.Present_division = rdr["Present_division"].ToString();
                    //  Intern.Present_district = rdr["Present_district"].ToString();
                    //  Intern.Present_thanna = rdr["Present_thanna"].ToString();
                    Intern.Present_address_house = rdr["Present_address_house"].ToString();
                    //  Intern.Permanent_division = rdr["Permanent_division"].ToString();
                    //  Intern.Permanent_district = rdr["Permanent_district"].ToString();
                    //  Intern.Permanent_thanna = rdr["Permanent_thanna"].ToString();
                    Intern.Parmanent_address_house = rdr["Parmanent_address_house"].ToString();
                    Intern.Father_name = rdr["Father_name"].ToString();
                    Intern.Mother_name = rdr["Mother_name"].ToString();
                    Intern.Facebook_URL = rdr["Facebook_URL"].ToString();
                    Intern.Linkedin_URL = rdr["Linkedin_URL"].ToString();
                    Intern.TBL_Brunch = rdr["TBL_Brunch"].ToString();
                    Intern.TBL_Department = rdr["TBL_Department"].ToString();
                    Intern.Apply_Date = Convert.ToDateTime(rdr["Apply_Date"]);
                    Intern.Status = rdr["Status"].ToString();
                    //Intern.Supervisor_id = Convert.ToInt32(rdr["Supervisor_id"]);

                    lstIntern.Add(Intern);

                }
                con.Close();
            }
            return lstIntern;
        }

        public IEnumerable<DashInfo> GetDashboardInfoAsync()
        {
            List<DashInfo> dashboardInfo = new List<DashInfo>();


            using (SqlConnection con = new SqlConnection(connectionString))
            // using (var command = new SqlCommand("GetInternMSDashboard", connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetSuperviseDashboard", con);

                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DashInfo dashboard = new DashInfo();


                    dashboard.TotalInterns = rdr.GetInt32(0);
                    dashboard.FinishedInterns = rdr.GetInt32(1);
                   // dashboard.WaitingInterns = rdr.GetInt32(1);

                    dashboardInfo.Add(dashboard);
                }
                con.Close();


            }

            return dashboardInfo;
        }

        public IEnumerable<InternInfo> ViewFinishedIntern()
        {
            List<InternInfo> lstIntern = new List<InternInfo>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("ViewFinishedInternsWithSupervisor", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    InternInfo Intern = new InternInfo();
                    Intern.Internid = Convert.ToInt32(rdr["Internid"]);
                    Intern.Name = rdr["Name"].ToString();
                    Intern.Password = rdr["Password"].ToString();
                    Intern.Email = rdr["Email"].ToString();
                    Intern.Phone = rdr["Phone"].ToString();
                    Intern.NID = rdr["NID"].ToString();
                    Intern.Gender = rdr["Gender"].ToString();
                   // Intern.Birth_Day = Convert.ToInt32(rdr["Birth_Day"]);
                   // Intern.Birth_Mounth = rdr["Birth_Mounth"].ToString();
                    //Intern.Birth_Year = Convert.ToInt32(rdr["Birth_Year"]);
                    Intern.Varsity_name = rdr["Varsity_name"].ToString();
                    Intern.Duration = rdr["Duration"].ToString();
                    Intern.DOB = Convert.ToDateTime(rdr["DOB"]);
                    Intern.Religion = rdr["Religion"].ToString();
                    Intern.Marital_status = rdr["Marital_status"].ToString();
                    // Intern.Present_division = rdr["Present_division"].ToString();
                    //  Intern.Present_district = rdr["Present_district"].ToString();
                    //  Intern.Present_thanna = rdr["Present_thanna"].ToString();
                    Intern.Present_address_house = rdr["Present_address_house"].ToString();
                    //  Intern.Permanent_division = rdr["Permanent_division"].ToString();
                    //  Intern.Permanent_district = rdr["Permanent_district"].ToString();
                    //  Intern.Permanent_thanna = rdr["Permanent_thanna"].ToString();
                    Intern.Parmanent_address_house = rdr["Parmanent_address_house"].ToString();
                    Intern.Father_name = rdr["Father_name"].ToString();
                    Intern.Mother_name = rdr["Mother_name"].ToString();
                    Intern.Facebook_URL = rdr["Facebook_URL"].ToString();
                    Intern.Linkedin_URL = rdr["Linkedin_URL"].ToString();
                    Intern.TBL_Brunch = rdr["TBL_Brunch"].ToString();
                    Intern.TBL_Department = rdr["TBL_Department"].ToString();
                    Intern.Apply_Date = Convert.ToDateTime(rdr["Apply_Date"]);
                    Intern.Status = rdr["Status"].ToString();
                    //Intern.Supervisor_id = Convert.ToInt32(rdr["Supervisor_id"]);

                    lstIntern.Add(Intern);

                }
                con.Close();
            }
            return lstIntern;
        }
        public IEnumerable<InternInfo> ViewInternBySupervisor()
        {
            List<InternInfo> lstIntern = new List<InternInfo>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("ViewApprovedInternBySupervisor", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    InternInfo Intern = new InternInfo();
                    Intern.Internid = Convert.ToInt32(rdr["Internid"]);
                    Intern.Name = rdr["Name"].ToString();
                    Intern.Password = rdr["Password"].ToString();
                    Intern.Email = rdr["Email"].ToString();
                    Intern.Phone = rdr["Phone"].ToString();
                    Intern.NID = rdr["NID"].ToString();
                    Intern.Gender = rdr["Gender"].ToString();
                    //Intern.Birth_Day = Convert.ToInt32(rdr["Birth_Day"]);
                    //Intern.Birth_Mounth = rdr["Birth_Mounth"].ToString();
                    // Intern.Birth_Year = Convert.ToInt32(rdr["Birth_Year"]);
                    Intern.Varsity_name = rdr["Varsity_name"].ToString();
                    Intern.Duration = rdr["Duration"].ToString();
                    Intern.DOB = Convert.ToDateTime(rdr["DOB"]);
                    Intern.Religion = rdr["Religion"].ToString();
                    Intern.Marital_status = rdr["Marital_status"].ToString();
                    // Intern.Present_division = rdr["Present_division"].ToString();
                    //  Intern.Present_district = rdr["Present_district"].ToString();
                    //  Intern.Present_thanna = rdr["Present_thanna"].ToString();
                    Intern.Present_address_house = rdr["Present_address_house"].ToString();
                    //  Intern.Permanent_division = rdr["Permanent_division"].ToString();
                    //  Intern.Permanent_district = rdr["Permanent_district"].ToString();
                    //  Intern.Permanent_thanna = rdr["Permanent_thanna"].ToString();
                    Intern.Parmanent_address_house = rdr["Parmanent_address_house"].ToString();
                    Intern.Father_name = rdr["Father_name"].ToString();
                    Intern.Mother_name = rdr["Mother_name"].ToString();
                    Intern.Facebook_URL = rdr["Facebook_URL"].ToString();
                    Intern.Linkedin_URL = rdr["Linkedin_URL"].ToString();
                    Intern.TBL_Brunch = rdr["TBL_Brunch"].ToString();
                    Intern.TBL_Department = rdr["TBL_Department"].ToString();
                    Intern.Apply_Date = Convert.ToDateTime(rdr["Apply_Date"]);
                    Intern.Status = rdr["Status"].ToString();
                    //Intern.Supervisor_id = Convert.ToInt32(rdr["Supervisor_id"]);

                    lstIntern.Add(Intern);

                }
                con.Close();
            }
            return lstIntern;
        }

        //To Update the records of a particluar Intern

        public void UpdateIntern(InternInfo Intern)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UpdateIntern", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Internid", Intern.Internid);
                cmd.Parameters.AddWithValue("@Name", Intern.Name);
                cmd.Parameters.AddWithValue("@Password", Intern.Password);
                cmd.Parameters.AddWithValue("@Email", Intern.Email);
                cmd.Parameters.AddWithValue("@Phone", Intern.Phone);
                cmd.Parameters.AddWithValue("@NID", Intern.NID);
                cmd.Parameters.AddWithValue("@Gender", Intern.Gender);
              //  cmd.Parameters.AddWithValue("@Birth_Day", Intern.Birth_Day);
               // cmd.Parameters.AddWithValue("@Birth_Mounth", Intern.Birth_Mounth);
               // cmd.Parameters.AddWithValue("@Birth_Year", Intern.Birth_Year);
                cmd.Parameters.AddWithValue("@Varsity_name", Intern.Varsity_name);
                cmd.Parameters.AddWithValue("@Duration", Intern.Duration);
                cmd.Parameters.AddWithValue("@DOB", Intern.DOB);
                cmd.Parameters.AddWithValue("@Religion", Intern.Religion);
                cmd.Parameters.AddWithValue("@Marital_status", Intern.Marital_status);
                //cmd.Parameters.AddWithValue("@Present_division", Intern.Present_division);
                //cmd.Parameters.AddWithValue("@Present_district", Intern.Present_district);
                //cmd.Parameters.AddWithValue("@Present_thanna", Intern.Present_thanna);
                cmd.Parameters.AddWithValue("@Present_address_house", Intern.Present_address_house);
                //cmd.Parameters.AddWithValue("@Permanent_division", Intern.Permanent_division);
                // cmd.Parameters.AddWithValue("@Permanent_district", Intern.Permanent_district);
                //cmd.Parameters.AddWithValue("@Permanent_thanna", Intern.Permanent_thanna);
                cmd.Parameters.AddWithValue("@Parmanent_address_house", Intern.Parmanent_address_house);
                cmd.Parameters.AddWithValue("@Father_name", Intern.Father_name);
                cmd.Parameters.AddWithValue("@Mother_name", Intern.Mother_name);
                cmd.Parameters.AddWithValue("@Facebook_URL", Intern.Facebook_URL);
                cmd.Parameters.AddWithValue("@Linkedin_URL", Intern.Linkedin_URL);
                cmd.Parameters.AddWithValue("@TBL_Brunch", Intern.TBL_Brunch);
                cmd.Parameters.AddWithValue("@TBL_Department", Intern.TBL_Department);


                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }


        //Get the details of a particular Intern 

        public InternInfo GetInternData(int? id)
        {
            InternInfo Intern = new InternInfo();

            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand("GetInternById", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Internid", id);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Intern.Internid = Convert.ToInt32(rdr["Internid"]);
                    Intern.Name = rdr["Name"].ToString();
                    Intern.Password = rdr["Password"].ToString();
                    Intern.Email = rdr["Email"].ToString();
                    Intern.Phone = rdr["Phone"].ToString();
                    Intern.NID = rdr["NID"].ToString();
                    Intern.Gender = rdr["Gender"].ToString();
                   // Intern.Birth_Day = Convert.ToInt32(rdr["Birth_Day"]);
                  //  Intern.Birth_Mounth = rdr["Birth_Mounth"].ToString();
                  //  Intern.Birth_Year = Convert.ToInt32(rdr["Birth_Year"]);
                    Intern.Varsity_name = rdr["Varsity_name"].ToString();
                    Intern.Duration = rdr["Duration"].ToString();
                    Intern.DOB = Convert.ToDateTime(rdr["DOB"]);
                    Intern.Religion = rdr["Religion"].ToString();
                    Intern.Marital_status = rdr["Marital_status"].ToString();
                    // Intern.Present_division = rdr["Present_division"].ToString();
                    // Intern.Present_district = rdr["Present_district"].ToString();
                    // Intern.Present_thanna = rdr["Present_thanna"].ToString();
                    Intern.Present_address_house = rdr["Present_address_house"].ToString();
                    // Intern.Permanent_division = rdr["Permanent_division"].ToString();
                    //  Intern.Permanent_district = rdr["Permanent_district"].ToString();
                    // Intern.Permanent_thanna = rdr["Permanent_thanna"].ToString();
                    Intern.Parmanent_address_house = rdr["Parmanent_address_house"].ToString();
                    Intern.Father_name = rdr["Father_name"].ToString();
                    Intern.Mother_name = rdr["Mother_name"].ToString();
                    Intern.Facebook_URL = rdr["Facebook_URL"].ToString();
                    Intern.Linkedin_URL = rdr["Linkedin_URL"].ToString();
                    Intern.TBL_Brunch = rdr["TBL_Brunch"].ToString();
                    Intern.TBL_Department = rdr["TBL_Department"].ToString();

                }
            }
            return Intern;
        }



        //To Finished the records of a particluar Intern
        public void Finish(int? id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UpdateStatusFinished", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Internid", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public void AddAttendance(AttendanceInfo attendanceInfo)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("AddAttendance", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Date", attendanceInfo.Date);
                    cmd.Parameters.AddWithValue("@InternId", attendanceInfo.InternId);
                    cmd.Parameters.AddWithValue("@IsPresent", attendanceInfo.IsPresent);
                    cmd.Parameters.AddWithValue("@TimeIn", attendanceInfo.TimeIn.HasValue ? attendanceInfo.TimeIn.Value : DBNull.Value);
                    cmd.Parameters.AddWithValue("@TimeOut", attendanceInfo.TimeOut.HasValue ? attendanceInfo.TimeOut.Value : DBNull.Value);
                    cmd.Parameters.AddWithValue("@IsCameLate", attendanceInfo.IsCameLate);
                    cmd.Parameters.AddWithValue("@IsLeaveEarly", attendanceInfo.IsLeaveEarly);
                    cmd.Parameters.AddWithValue("@Duration", attendanceInfo.Duration.HasValue ? attendanceInfo.Duration.Value : DBNull.Value);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
            }
        }

        public IEnumerable<AttendanceInfo> GetAttendanceById(int? internId)
        {
            List<AttendanceInfo> attendanceList = new List<AttendanceInfo>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetAttendanceByInternId", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@InternId", internId);

                    connection.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();

                    while (rdr.Read())
                    {
                        AttendanceInfo attendance = new AttendanceInfo
                        {
                            Date = Convert.ToDateTime(rdr["Date"]),
                            IsPresent = rdr["IsPresent"].ToString()
                        };


                        attendanceList.Add(attendance);
                    }
                    connection.Close();
                }
            }

            return attendanceList;
        }

        public void AssignTask(AssignTaskInfo taskInfo)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("AssignTaskProcedure", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@InternId", taskInfo.InternId);
                    cmd.Parameters.AddWithValue("@Date", taskInfo.Date);
                    cmd.Parameters.AddWithValue("@TaskDescription", taskInfo.TaskDescription);


                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        public List<AssignTaskInfo> GetAssignedTasks(int internId)
        {
            List<AssignTaskInfo> assignedTasks = new List<AssignTaskInfo>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetAssignedTasks", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@InternId", internId);

                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            AssignTaskInfo taskInfo = new AssignTaskInfo
                            {
                                InternId = (int)rdr["InternId"],
                                Date = (DateTime)rdr["Date"],
                                TaskDescription = (string)rdr["TaskDescription"]
                            };
                            assignedTasks.Add(taskInfo);
                        }
                    }
                }
            }

            return assignedTasks;
        }

        public IEnumerable<AssignTaskInfo> GetTasksById(int internId)
        {
            List<AssignTaskInfo> lsttasks = new List<AssignTaskInfo>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetTasksByInternId", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@InternId", internId);

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();

                    while (rdr.Read())
                    {
                        AssignTaskInfo tasks = new AssignTaskInfo();
                        tasks.InternId = Convert.ToInt32(rdr["InternId"]);
                        tasks.Date = Convert.ToDateTime(rdr["Date"]);
                        tasks.TaskDescription = rdr["TaskDescription"].ToString();
                        lsttasks.Add(tasks);
                    }
                    con.Close();
                }
            }

            return lsttasks;
        }

        //public AssignTaskInfo GetTaskData(int? id)
        //{
        //    AssignTaskInfo taskInfo = new AssignTaskInfo();

        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {

        //        SqlCommand cmd = new SqlCommand("GetTaskById", con);
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        cmd.Parameters.AddWithValue("@InternId", id);
        //        con.Open();
        //        SqlDataReader rdr = cmd.ExecuteReader();

        //        while (rdr.Read())
        //        {
        //            taskInfo.InternId = Convert.ToInt32(rdr["InternId"]);
        //            taskInfo.Date = Convert.ToDateTime(rdr["Date"]);
        //            taskInfo.TaskDescription = rdr["TaskDescription"].ToString();

        //        }
        //    }
        //    return taskInfo;
        //}
        //public List<AssignTaskInfo> GetTaskData(int internId)
        //{
        //    List<AssignTaskInfo> assignedTasks = new List<AssignTaskInfo>();

        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {
        //        using (SqlCommand cdm = new SqlCommand("GetTaskById", con))
        //        {
        //            cdm.CommandType = CommandType.StoredProcedure;
        //            cdm.Parameters.AddWithValue("@InternId", internId);

        //            con.Open();

        //            using (SqlDataReader reader = cdm.ExecuteReader())
        //            {
        //                while (reader.Read())
        //                {
        //                    AssignTaskInfo taskInfo = new AssignTaskInfo
        //                    {
        //                        InternId = internId,
        //                        Date = (DateTime)reader["Date"],
        //                        TaskDescription = (string)reader["TaskDescription"]
        //                    };

        //                    assignedTasks.Add(taskInfo);
        //                }
        //            }
        //        }
        //    }

        //    return assignedTasks;
        //}
    }
}

