using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Maling.DataAccess.Model
{
    public partial class xMalBasis
    {
        public xMalBasis()
        {
            MalingSlag = new HashSet<MalingSlag>();
        }

        public int MalBasisID { get; set; }
        [Required]
        [StringLength(255)]
        public string MalBasisBenevn { get; set; }

        [InverseProperty("MalBasis")]
        public virtual ICollection<MalingSlag> MalingSlag { get; set; }
    }
}