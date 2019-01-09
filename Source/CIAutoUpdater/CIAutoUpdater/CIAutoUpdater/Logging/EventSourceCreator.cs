using System.ComponentModel;
using System.Diagnostics;
using System.Security;

namespace CIAutoUpdater.Logging
{
    internal class EventSourceCreator
    {
        public static void CreateSourceIfNotExists(string sourceName, string targetLogName)
        {
            try
            {
                if (!EventLog.SourceExists(sourceName))
                {
                    EventLog.CreateEventSource(sourceName, targetLogName);
                    EventLog.WriteEntry(sourceName, "Event source created");
                }
            }
            catch (SecurityException sex)
            {
                if (!CreateEventSourceWithEventCreateTool(sourceName, targetLogName))
                    throw new SecurityException(string.Format("Cannot create the log named '{0}'", sourceName), sex);
            }
        }

        private static bool CreateEventSourceWithEventCreateTool(string sourceName, string targetLogName)
        {
            try
            {
                const string eventLogCreateToolName = @"eventcreate";
                string eventLogCreateToolArguments =
                    string.Format(
                        " /ID 1 /L {0} /T INFORMATION  /SO \"{1}\" /D \"{1} source created.\"",
                        targetLogName,
                        sourceName);

                using (Process proc = new Process
                                   {
                                       StartInfo =
                                       {
                                           FileName = eventLogCreateToolName,
                                           Arguments = eventLogCreateToolArguments,
                                           Verb = "runas"
                                       }
                                   })
                {
                    proc.Start();
                    proc.WaitForExit();
                    return proc.ExitCode == 0;
                }
            }
            catch (Win32Exception)
            {
                //note: handle if user clicks 'No' on run as administrator UAC dialog
                return false;
            }
        }
    }
}