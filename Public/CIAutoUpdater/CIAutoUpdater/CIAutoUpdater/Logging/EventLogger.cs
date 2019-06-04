using System;
using System.Diagnostics;
using System.Reflection;

namespace CIAutoUpdater.Logging
{
    public class EventLogger : WindowsLoggerBase
    {
        private readonly EventLog _eventLog;

        public EventLogger(string applicationName)
        {
            _eventLog = new EventLog();

            MaxEntryLength = 32766;


            //Set default ApplicationName.
            if (string.IsNullOrEmpty(applicationName))
            {
                var asm = Assembly.GetEntryAssembly();
                ApplicationName = asm != null
                    ? asm.EntryPoint.Module.ScopeName
                    : "ApplicationName";
            }
            else
                ApplicationName = applicationName;
        }

        public new string ApplicationName
        {
            get { return base.ApplicationName; }
            set
            {
                if (base.ApplicationName == value)
                    return;

                base.ApplicationName = value;

                EventSourceCreator.CreateSourceIfNotExists(ApplicationName, "Application");
                _eventLog.Source = ApplicationName;
            }
        }

        protected override void LogEntry(LogEntryType logType, string message)
        {
            if (DebugEnabled)
                Trace.WriteLine(message);

            try
            {
                var entry = string.Format("{0}\r\n\r\nStackTrace:\r\n{1}", message, GetStackTrace());
                if (entry.Length > MaxEntryLength)
                    entry = entry.Substring(0, MaxEntryLength);
                _eventLog.WriteEntry(entry, (EventLogEntryType)logType);
            }
            catch (Exception ex)
            {

                Trace.WriteLine(ex.ToString());
                throw;
            }
           
        }
    }
}