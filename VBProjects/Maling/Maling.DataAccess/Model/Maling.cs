using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maling.DataAccess.Model
{
    public partial class Maling
    {
        public int ID { get; set; }
        public int? HusID { get; set; }
        public bool? Ute { get; set; }
        public int? RomID { get; set; }
        public int? StedID { get; set; }
        public int? MalID { get; set; }
        [StringLength(255)]
        public string SistMalt { get; set; }

        [ForeignKey("HusID")]
        [InverseProperty("Maling")]
        public virtual xHus Hus { get; set; }
        [ForeignKey("RomID")]
        [InverseProperty("Maling")]
        public virtual xRom Rom { get; set; }
        [ForeignKey("StedID")]
        [InverseProperty("Maling")]
        public virtual xSted Sted { get; set; }
    }
}