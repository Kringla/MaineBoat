using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maling.DataAccess.Model
{
    public partial class MalingSlag
    {
        public MalingSlag()
        {
            MalingStatus = new HashSet<MalingStatus>();
        }

        public int MalID { get; set; }
        public int? MalBasisID { get; set; }
        [StringLength(255)]
        public string MalingFabrikat { get; set; }
        [StringLength(255)]
        public string Farge { get; set; }
        [StringLength(255)]
        public string Blankhet { get; set; }
        [StringLength(255)]
        public string Fargekode { get; set; }

        [ForeignKey("MalBasisID")]
        [InverseProperty("MalingSlag")]
        public virtual xMalBasis MalBasis { get; set; }
        [InverseProperty("Mal")]
        public virtual ICollection<MalingStatus> MalingStatus { get; set; }
    }
}