using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;

namespace AltaCal.Controllers
{
    [Route("api/[controller]")]
    public class CalendarDataController : Controller
    {
        AdminDbContext _context;

        public CalendarDataController(AdminDbContext adminDbContext)
        {
            _context = adminDbContext;
        }

        [HttpGet("[action]")]
        public IEnumerable<Arrangementer> GetArrangementer()
        {
            //Bare hente ut arragementer som er mer enn 1 dag gamle
            var minDate = DateTime.Now.Subtract(TimeSpan.FromDays(1));

            return _context.Arrangementers
                .OrderBy(x => x.Dato)
                .Where(x => x.Dato > minDate)
                .ToList();
        }

    }
}
