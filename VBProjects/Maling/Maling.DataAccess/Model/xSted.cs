using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maling.DataAccess.Model
{
    public partial class xSted
    {
        public xSted()
        {
            Maling = new HashSet<Maling>();
        }

        public int StedID { get; set; }
        [Required]
        [StringLength(255)]
        public string StedBenevn { get; set; }

        [InverseProperty("Sted")]
        public virtual ICollection<Maling> Maling { get; set; }
    }
}