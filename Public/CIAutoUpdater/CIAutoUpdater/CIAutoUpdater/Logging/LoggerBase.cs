using System;

namespace CIAutoUpdater.Logging
{
    public abstract class LoggerBase : ILogger
    {
        #region Public Properties

        public string ApplicationName { get; set; }

        //If Debug is enabled it will log stack traces including source file info :)
        public bool DebugEnabled { get; set; }

        public int MaxEntryLength { get; set; }

        #endregion

        #region Public Methods

        public void Debug(string message)
        {
            if (DebugEnabled)
                LogEntry(LogEntryType.Information, message);
        }

        public void Debug(Exception exception)
        {
            if (DebugEnabled)
                LogEntry(LogEntryType.Error, exception.ToString());
        }

        public void Info(string message)
        {
            Info(string.Empty, message);
        }

        public void Info(string source, string message)
        {
            LogEntry(LogEntryType.Information, message);
        }

        public void Warn(string message)
        {
             LogEntry(LogEntryType.Warning, message);
        }

        public void Error(string message)
        {
            LogEntry(LogEntryType.Error, message);
        }


        public void Exception(Exception exception)
        {
            Exception(string.Empty, exception);
        }

        public void Exception(string source, Exception exception)
        {
            LogEntry(LogEntryType.Error, exception.ToString());
        }

        #endregion

        protected abstract void LogEntry(LogEntryType logType, string message);
        
        #region StackTrace

        protected abstract string GetStackTrace();
        
        #endregion

    }
}