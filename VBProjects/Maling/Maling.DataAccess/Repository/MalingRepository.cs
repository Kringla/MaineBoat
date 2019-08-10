using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Maling.DataAccess.Model;
using Microsoft.EntityFrameworkCore;

namespace Maling.DataAccess.Repository
{
    public class MalingRepository
    {
        private GBIDBContext _context;

        public MalingRepository()
        {
            string ConnectionString = "";

            if (string.IsNullOrEmpty(ConnectionString))
            {
                var dbConn = _context?.Database?.GetDbConnection();
                ConnectionString = dbConn != null ? dbConn.ConnectionString : ConfigurationManager.ConnectionStrings["ReleaseConnectionString"].ConnectionString;
            }

            var options = new DbContextOptionsBuilder<GBIDBContext>();
            options.UseSqlServer(ConnectionString);

            _context = new GBIDBContext(options.Options);
        }

        public List<Model.Maling> GetMaling()
        {
            return _context.Maling.ToList();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fargeFilter">Siden fargeFilter = null så er denne parameteren optional</param>
        /// <returns></returns>
        public List<Model.MalingSlag> GetMalingSlag(string fargeFilter = null)
        {
            var query = _context.MalingSlag.AsQueryable();

            if (!string.IsNullOrWhiteSpace(fargeFilter))
                query = query.Where(x => x.Farge.Contains(fargeFilter)).AsQueryable();

            //Først her blir data faktisk hentet fra db
            return query.ToList();
        }

        public MalingSlag GetMalingSlag(int malId)
        {
            return _context.MalingSlag.SingleOrDefault(x=>x.MalID == malId);
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        public void AddMalingSlag(MalingSlag item, bool save)
        {
            _context.MalingSlag.Add(item);
            if (save)
                _context.SaveChanges();
        }

        public void DeleteMalingSlag(MalingSlag item, bool save)
        {
            _context.MalingSlag.Remove(item);
            if (save)
                _context.SaveChanges();
        }
    }
}
