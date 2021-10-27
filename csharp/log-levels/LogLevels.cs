using System;

static class LogLine
{
    public static string Message(string logLine)
    {
        var idx = logLine.IndexOf(':');
        return logLine.Substring(idx+1).Trim();
    }

    public static string LogLevel(string logLine)
    {
        var idx = logLine.IndexOf(':');
        var level = logLine.Substring(0, idx);
        level = level.Replace("[", "");
        level = level.Replace("]", "");
        return level.ToLower();
    }

    public static string Reformat(string logLine)
    {
        var msg = Message(logLine);
        var lvl = LogLevel(logLine);
        return $"{msg} ({lvl})";
    }
}
