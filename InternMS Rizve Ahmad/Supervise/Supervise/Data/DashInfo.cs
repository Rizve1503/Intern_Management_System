using System.ComponentModel.DataAnnotations;

namespace Supervise.Data
{
    public class DashInfo
    {
        public int FinishedInterns { get; set; }
        public int TotalInterns { get; set; }
        public int WaitingInterns { get; set; }
    }
}
