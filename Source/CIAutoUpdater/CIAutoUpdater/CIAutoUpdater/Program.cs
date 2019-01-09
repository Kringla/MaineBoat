using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using CIAutoUpdater.Logging;
using CIAutoUpdater.Properties;
using Microsoft.Win32;

namespace CIAutoUpdater
{
    static class Program
    {
        /* ARGS:
         "https://onedrive.live.com/download?cid=07FAA54DFF6507CA&resid=7FAA54DFF6507CA%21549546&authkey=ABCSsWfFp8gPI7Y" "16.07.2018 18:27:32" "C:\Users\cihlen\AppData\Local\Temp\ATestSetup.exe" "1" "/S"
         https://github.com/Kringla/MaineBoat/raw/master/Public/Installs/M314AdminSetup.exe
         https://raw.githubusercontent.com/Kringla/MaineBoat/master/Public/Installs/M314AdminSetup.exe
         https://rawgit.com/Kringla/MaineBoat/master/Public/Installs/M314AdminSetup.exe
         http://m314alta.org/installs/M314AdminSetup.exe
         */
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string []args)
        {
            EventLogger eventLogger = new EventLogger("CIAutoUpdater");

            try
            {
                var argsString = string.Empty;
                foreach (var arg in args)
                {
                    argsString += "\"" + arg + "\" ";
                }

                eventLogger.Info($"CIAutoUpdater started: {argsString}");
                if (args.Length < 3)
                {
                    ShowUsage();
                    return;
                }

                Uri uri;
                DateTime lastInstallTime;
                FileInfo destFile;
                bool runAfterDownload = false;
                string installArgs = string.Empty;

                try
                {
                    uri = new Uri(args[0].Trim());
                }
                catch (Exception ex)
                {
                    ShowUsage(ex.Message + ": Value=" + args[0]);
                    return;
                }

                try
                {
                    var dateTimeParts = args[1].Trim().Split(new []{' '}, StringSplitOptions.RemoveEmptyEntries);

                    var dateParts = dateTimeParts[0].Trim().Split(new char[] { '.' });
                    var day = Convert.ToInt32(dateParts[0]);
                    var month = Convert.ToInt32(dateParts[1]);
                    var year = Convert.ToInt32(dateParts[2]);

                    var timeParts = dateTimeParts[1].Trim().Split(new char[] { ':' });
                    var hour = Convert.ToInt32(timeParts[0]);
                    var min = Convert.ToInt32(timeParts[1]);
                    var second = 0;//Convert.ToInt32(timeParts[2]);

                    lastInstallTime = new DateTime(year, month, day, hour, min, second);
                    //lastInstallTime = DateTime.ParseExact(args[1].Trim(), "dd.MM.yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                }
                catch (Exception ex)
                {
                    ShowUsage(ex.Message + ": Value=" + args[1]);
                    return;
                }

                try
                {
                    destFile = new FileInfo(args[2].Trim());
                }
                catch (Exception ex)
                {
                    ShowUsage(ex.Message + ": Value=" + args[2]);
                    return;
                }

                if (args.Length > 3)
                {
                    runAfterDownload = args[3].Trim() == "1";
                }
                if (args.Length > 4)
                {
                    installArgs = args[4].Trim();
                }

                //MessageBox.Show($"Url={uri.ToString()}\nLastInstallTime={lastInstallTime}\nLastInstallTime={lastInstallTime}\nLastInstallTime={lastInstallTime}")

                AutoUpdate.AllowedContentTypes = Settings.Default.AllowedContentTypes.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                AutoUpdate autoUpdate = new AutoUpdate(uri.ToString(), lastInstallTime);
                if (autoUpdate.IsNewUpdateAvailable())
                {
                    autoUpdate.DownloadUpdate(destFile.FullName);

                    if (runAfterDownload)
                    {
                        eventLogger.Info($"Run file: {destFile.FullName} {installArgs}");
                        Process.Start(destFile.FullName, installArgs);
                    }
                }

                eventLogger.Info($"CIAutoUpdater completed: {argsString}");
            }
            catch (Exception ex)
            {
                eventLogger.Error($"Error: {ex}");

                if (Settings.Default.ShowErrors)
                    MessageBox.Show(ex.Message, null, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            //Application.EnableVisualStyles();
            //Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new AutoUpdateForm());
        }

        private static void ShowUsage(string error = "")
        {
            var msg = "Usage:\n<Url> <LastInstallTime> <DestinationFile> [1 or 0 (run, optional)] [run parameters, optional]";
            if (!string.IsNullOrEmpty(error))
                msg = error + "\n\n" + msg;
            MessageBox.Show(msg, null, MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }
}
