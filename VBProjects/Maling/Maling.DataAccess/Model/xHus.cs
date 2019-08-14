using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maling.DataAccess.Model
{
    public partial class xHus
    {
        public xHus()
        {
            Maling = new HashSet<Maling>();
        }

        public int HusID { get; set; }
        [StringLength(255)]
        public string HusBenevn { get; set; }

        [InverseProperty("Hus")]
        public virtual ICollection<Maling> Maling { get; set; }
    }
}