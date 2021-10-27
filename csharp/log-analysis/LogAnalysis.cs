using System;

public static class LogAnalysis 
{
    // TODO: define the 'SubstringAfter()' extension method on the `string` type
    public static string SubstringAfter(this string str, string sep) {
        var idx = str.IndexOf(sep);
        return str.Substring(idx + sep.Length);
    }

    // TODO: define the 'SubstringBetween()' extension method on the `string` type
    public static string SubstringBetween(this string str, string firstSep, string secondSep) {
        var firstIdx = str.IndexOf(firstSep);
        var secondIdx = str.IndexOf(secondSep);
        return str.Substring(firstIdx+firstSep.Length, secondIdx-firstIdx-firstSep.Length);
    }
    
    // TODO: define the 'Message()' extension method on the `string` type
    public static string Message(this string str) {
        return str.SubstringAfter(": ");
    }

    // TODO: define the 'LogLevel()' extension method on the `string` type
    public static string LogLevel(this string str) {
        return str.SubstringBetween("[", "]");
    }
}
