using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using Maling.DataAccess.Model;
using Maling.DataAccess.Repository;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Maling.DataAccessTest
{
    [TestClass]
    public class MalingTests
    {
        #region Eksempel på hvordan man kan initialisere kode en gang for alle test-metoder

        private MalingRepository _db;

        [TestInitialize]
        public void TestInit()
        {
            _db = new MalingRepository();
        }

            #endregion

        [TestMethod]
        public void GetAllMalingTest()
        {
            //Hente alle 
            MalingRepository repo = new MalingRepository();

            var result = repo.GetMaling();

            Debug.WriteLine("GetMaling Result count: " + result.Count);
            Assert.AreNotEqual(0, result.Count, "Kunne ikke hente noen resultater fra db.");
        }

        [TestMethod]
        public void GetAllMalingSlagTest()
        {
            //Hente alle 

            MalingRepository repo = new MalingRepository();
            var result = repo.GetMalingSlag();

            Debug.WriteLine("GetMalingSlag Result count: " + result.Count);
            Assert.AreNotEqual(0, result.Count, "Kunne ikke hente noen resultater fra db.");
        }

        [TestMethod]
        public void GetMalingSlagFilterByATest()
        {
            //Hente alle 

            MalingRepository repo = new MalingRepository();
            var result = repo.GetMalingSlag("a");

            Debug.WriteLine("GetMalingSlag Result count: " + result.Count);
            Assert.AreNotEqual(0, result.Count, "Kunne ikke hente noen resultater fra db.");
        }

        [TestMethod]
        public void UpdateMalingSlagFargeTest()
        {
            MalingRepository repo = new MalingRepository();

            var malingSlag = repo.GetMalingSlag(1); //Hente ut med id=1 
       
            Assert.IsNotNull(malingSlag);
            Debug.WriteLine("UpdateMalingSlagFarge Farge Before: " + malingSlag.Farge);

            var originalFarge = malingSlag.Farge; //Original value
            const string testFarge = "Test Farge";

            malingSlag.Farge = testFarge; //Change value

            repo.SaveChanges(); //Commit
            
            var malingSlagUpdated = repo.GetMalingSlag(1);
            Assert.IsNotNull(malingSlag);

            var updatedFarge = malingSlagUpdated.Farge;
            Debug.WriteLine("UpdateMalingSlagFarge Farge After: " + updatedFarge);

            //Set back to original value
            malingSlagUpdated.Farge = originalFarge;
            repo.SaveChanges();

            Assert.AreEqual(testFarge, updatedFarge, "Fargene er ikke like!");
        }

        [TestMethod]
        public void AddMalingSlagFargeTest()
        {
            MalingRepository repo = new MalingRepository();

            MalingSlag newItem = new MalingSlag
            {
                Farge = "Farge",
                Blankhet = "Blankhet",
                Fargekode = "Fargekode",
                MalingFabrikat = "MalingFabrikat"
            };

            repo.AddMalingSlag(newItem, false); //Hente ut med id=1 

            repo.SaveChanges(); //Commit

            var newId = newItem.MalID;
            Assert.AreNotEqual(0, newId);

            //Delete AND commit
            repo.DeleteMalingSlag(newItem, true);

            var shouldNotExistItem = repo.GetMalingSlag(newId);
            Assert.IsNull(shouldNotExistItem);
        }
    }
}
