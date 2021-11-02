using System;

enum LogLevel
{
    Trace,
    Debug,
    Info,
    Warning,
    Error,
    Fatal,
    Unknown
}

static class LogLine
{
    public static LogLevel ParseLogLevel(string logLine)
    {
        var parts = logLine.Split(':');
        switch (parts[0])
        {
            case "[TRC]":
                return LogLevel.Trace;
            case "[DBG]":
                return LogLevel.Debug;
            case "[INF]":
                return LogLevel.Info;
            case "[WRN]":
                return LogLevel.Warning;
            case "[ERR]":
                return LogLevel.Error;
            case "[FTL]":
                return LogLevel.Fatal;
            default:
                return LogLevel.Unknown;
        }
    }

    public static string OutputForShortLog(LogLevel logLevel, string message)
    {
        // Instead of using level, I could have assigned the level to the entries in the enum.
        int level = 0;
        switch (logLevel)
        {
            case LogLevel.Unknown:
                level = 0;
                break;
            case LogLevel.Trace:
                level = 1;
                break;
            case LogLevel.Debug:
                level = 2;
                break;
            case LogLevel.Info:
                level = 4;
                break;
            case LogLevel.Warning:
                level = 5;
                break;
            case LogLevel.Error:
                level = 6;
                break;
            case LogLevel.Fatal:
                level = 42;
                break;
        }
        return $"{level}:{message}";
    }
}
