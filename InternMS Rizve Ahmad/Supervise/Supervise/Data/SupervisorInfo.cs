using System.ComponentModel.DataAnnotations;

namespace Supervise.Data
{
    public class SupervisorInfo
    {
        public int Supervisor_id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Gender { get; set; }
        [Required]
        public string Position { get; set; }
        [Required]
        public string TBL_Brunch { get; set; }
        [Required]
        public string TBL_Department { get; set; }

    }
}
