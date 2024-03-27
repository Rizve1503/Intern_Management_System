using System.ComponentModel.DataAnnotations;

namespace Supervise.Data
{
    public class AttendanceInfo
    {
        public int InternId { get; set; }
        public DateTime Date { get; set; }
        public string IsPresent { get; set; }
        public DateTime? TimeIn { get; set; }
        public DateTime? TimeOut { get; set; }
        public bool IsCameLate { get; set; }
        public bool IsLeaveEarly { get; set; }
        public TimeSpan? Duration { get; set; }
    }

}
