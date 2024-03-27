using System.ComponentModel.DataAnnotations;

namespace Supervise.Data
{
    public class InternInfo
    {
        public int Internid { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Phone { get; set; }
        [Required]
        public string NID { get; set; }
        [Required]
        public string Gender { get; set; }
        [Required]
        public DateTime DOB { get; set; } = DateTime.Now;
        [Required]
        public string Varsity_name { get; set; }
        [Required]
        public string Duration { get; set; }
        [Required]
        public string Religion { get; set; }
        [Required]
        public string Marital_status { get; set; }
        [Required]
        /* public string Present_division { get; set; }
         [Required]
         public string Present_district { get; set; }
         [Required]
         public string Present_thanna { get; set; }
         [Required]*/
        public string Present_address_house { get; set; }
        [Required]
        /* public string Permanent_division { get; set; }
        [Required]
        public string Permanent_district { get; set; }
        [Required]
        public string Permanent_thanna { get; set; }
        [Required]*/
        public string Parmanent_address_house { get; set; }
        [Required]
        public string Father_name { get; set; }
        [Required]
        public string Mother_name { get; set; }
        [Required]
        public string Facebook_URL { get; set; }
        [Required]
        public string Linkedin_URL { get; set; }
        [Required]
        public string TBL_Brunch { get; set; }
        [Required]
        public string TBL_Department { get; set; }
        [Required]
        public DateTime Apply_Date { get; set; }
        //public DateTime Apply_date { get; internal set; }
        [Required]
        public string Status { get; set; }
        [Required]
        public int Supervisor_id { get; set; }

    }
}
