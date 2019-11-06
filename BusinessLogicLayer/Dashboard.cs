using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class Dashboard
    {
        [DisplayName("Total Movies Watched By All Users")] public int TotalCountForAllDownloads { get; set; }
        [DisplayName("Total Movies Watched By You")] public int TotalCountForThisUser { get; set; }
        //[DisplayName("Average Downloaded Movie Length")] public double AverageCountOfAllDownloads { get; set; }
        [DisplayName("Total Duration Of All Watched Movies")] public double TotalDurationMoviesDownloaded { get; set; }
        [DisplayName("Average Duration Of All Watched Movies")] public double AverageDurationOfMoviesDownloaded { get; set; }
        [DisplayName("Total Movie Duration Watched By You")] public double TotalDurationForThisUser { get; set; }
        [DisplayName("Average Movie Duration Watched By You")] public double AverageDurationForThisUser { get; set; }
        [DisplayName("Total Duration Of All Movies")] public double TotalLengthOfAllMovies { get; set; }
        [DisplayName("Average Duration Of All Movies")] public double AverageLengthOfAllMovies { get; set; }

    }
}
