using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Supervise.Data
{
    public class SupervisorDataAccessLayer
    {

        // string connectionString = "Put Your Connection string here";
        string connectionString = "Data Source=RIZVE_AHMAD\\SQLEXPRESS;Initial Catalog=Intern;Integrated Security=True";

        //To Update the records of a particluar Supervisor

        public void UpdateSupervisors(SupervisorInfo Supervisor)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UpdateSupervisors", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Supervisor_id", Supervisor.Supervisor_id);
                cmd.Parameters.AddWithValue("@Name", Supervisor.Name);
                cmd.Parameters.AddWithValue("@Password", Supervisor.Password);
                cmd.Parameters.AddWithValue("@Email", Supervisor.Email);
                cmd.Parameters.AddWithValue("@Gender", Supervisor.Gender);
                cmd.Parameters.AddWithValue("@Position", Supervisor.Position);
                cmd.Parameters.AddWithValue("@TBL_Brunch", Supervisor.TBL_Brunch);
                cmd.Parameters.AddWithValue("@TBL_Department", Supervisor.TBL_Department);


                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        //Get the details of a particular Supervisor 

        public SupervisorInfo GetSupervisorData(int? id)
        {
            SupervisorInfo Supervisor = new SupervisorInfo();

            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand("GetSupervisorsById", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Supervisor_id", id);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Supervisor.Supervisor_id = Convert.ToInt32(rdr["Supervisor_id"]);
                    Supervisor.Name = rdr["Name"].ToString();
                    Supervisor.Password = rdr["Password"].ToString();
                    Supervisor.Email = rdr["Email"].ToString();
                    Supervisor.Gender = rdr["Gender"].ToString();
                    Supervisor.Position = rdr["Position"].ToString();
                    Supervisor.TBL_Brunch = rdr["TBL_Brunch"].ToString();
                    Supervisor.TBL_Department = rdr["TBL_Department"].ToString();

                }
            }
            return Supervisor;
        }
    }
}
