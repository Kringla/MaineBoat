using System;

namespace CIAutoUpdater.Logging
{
    public interface ILogger
    {
        bool DebugEnabled { get; set; }

        void Debug(string message);
        void Debug(Exception exception);


        void Info(string message);

        void Warn(string message);

        void Error(string message);

        void Exception(Exception exception);
    }
}