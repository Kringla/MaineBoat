using Microsoft.VisualStudio.TestTools.UnitTesting;
using CIAutoUpdater;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CIAutoUpdater.Tests
{
    [TestClass()]
    public class AutoUpdateTests
    {
        private const string updateUrl = "https://github.com/Kringla/MaineBoat/raw/master/Public/Installs/M314AdminSetup.exe"; //M314AppsSetup.exe
        //private string destinationUpdateFile = Path.GetTempPath() + "AutoUpdateSetupTest.exe";

        [TestMethod()]
        public void IsNewUpdateAvailable_NoUpdate_Test()
        {
            var autoUpdate = new AutoUpdate(updateUrl, DateTime.Now);
            var result = autoUpdate.IsNewUpdateAvailable();
            Assert.IsFalse(result);
        }

        [TestMethod()]
        public void IsNewUpdateAvailable_NewUpdateIsAvailable_Test()
        {
            var autoUpdate = new AutoUpdate(updateUrl, new DateTime(2018,7,13, 14,0,0));
            var result = autoUpdate.IsNewUpdateAvailable();
            Assert.IsTrue(result);
        }

        [TestMethod()]
        public void AutoUpdate_DownloadUpdate_Test()
        {
            var destinationUpdateFile = Path.GetTempPath() +  "AutoUpdateSetupTest.exe";

            var autoUpdate = new AutoUpdate(updateUrl, DateTime.Now);
            autoUpdate.DownloadUpdate(destinationUpdateFile);
            Assert.IsTrue(File.Exists(destinationUpdateFile));
        }
    }
}