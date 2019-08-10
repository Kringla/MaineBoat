using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maling.DataAccess.Model
{
    public partial class xRom
    {
        public xRom()
        {
            Maling = new HashSet<Maling>();
        }

        public int RomID { get; set; }
        [StringLength(255)]
        public string RomBenevn { get; set; }

        [InverseProperty("Rom")]
        public virtual ICollection<Maling> Maling { get; set; }
    }
}