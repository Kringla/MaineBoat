using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maling.DataAccess.Model
{
    public partial class xLager
    {
        public xLager()
        {
            MalingStatus = new HashSet<MalingStatus>();
        }

        public int LagerID { get; set; }
        [Required]
        [StringLength(255)]
        public string lagerBenevn { get; set; }

        [InverseProperty("Lager")]
        public virtual ICollection<MalingStatus> MalingStatus { get; set; }
    }
}