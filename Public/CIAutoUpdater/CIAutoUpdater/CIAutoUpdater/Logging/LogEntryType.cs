namespace CIAutoUpdater.Logging
{
    /// <summary>
    /// Specifies the type of an log entry.
    /// </summary>
    /// <filterpriority>2</filterpriority>
    public enum LogEntryType
    {
        Error = 1,
        Warning = 2,
        Information = 4,
        SuccessAudit = 8,
        FailureAudit = 16,
    }
}
