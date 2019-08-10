using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maling.DataAccess.Model
{
    public partial class xEmballasje
    {
        public xEmballasje()
        {
            MalingStatus = new HashSet<MalingStatus>();
        }

        public int EmbID { get; set; }
        [StringLength(255)]
        public string EmbBenevn { get; set; }

        [InverseProperty("Emb")]
        public virtual ICollection<MalingStatus> MalingStatus { get; set; }
    }
}