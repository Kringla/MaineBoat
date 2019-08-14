using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maling.DataAccess.Model
{
    public partial class MalingStatus
    {
        public int MSID { get; set; }
        public int? MalID { get; set; }
        public int? LagerID { get; set; }
        public int? EmbID { get; set; }
        [StringLength(25)]
        public string FyllGrad { get; set; }
        [StringLength(255)]
        public string Merknad { get; set; }

        [ForeignKey("EmbID")]
        [InverseProperty("MalingStatus")]
        public virtual xEmballasje Emb { get; set; }
        [ForeignKey("LagerID")]
        [InverseProperty("MalingStatus")]
        public virtual xLager Lager { get; set; }
        [ForeignKey("MalID")]
        [InverseProperty("MalingStatus")]
        public virtual MalingSlag Mal { get; set; }
    }
}