using System;
using System.Collections.Generic;

public static class Languages
{
    public static List<string> NewList()
    {
        return new List<string>();
    }

    public static List<string> GetExistingLanguages()
    {
        List<string> lst = new List<string>();
        lst.Add("C#");
        lst.Add("Clojure");
        lst.Add("Elm");
        return lst;
    }

    public static List<string> AddLanguage(List<string> languages, string language)
    {
        languages.Add(language);
        return languages;
    }

    public static int CountLanguages(List<string> languages)
    {
        return languages.Count;
    }

    public static bool HasLanguage(List<string> languages, string language)
    {
        foreach (string lang in languages)
        {
            if (lang == language)
            {
                return true;
            }
        }
        return false;
    }

    public static List<string> ReverseList(List<string> languages)
    {
        languages.Reverse();
        return languages;
    }

    public static bool IsExciting(List<string> languages)
    {
        if (languages.Count > 0 && languages[0] == "C#")
        {
            return true;
        }
        if (languages.Count > 1 && languages.Count < 4 && languages[1] == "C#")
        {
            return true;
        }
        return false;
    }

    public static List<string> RemoveLanguage(List<string> languages, string language)
    {
        List<string> newList = new List<string>();
        foreach (string lang in languages)
        {
            if (lang == language)
            {
                continue;
            }
            newList.Add(lang);
        }
        return newList;
    }

    public static bool IsUnique(List<string> languages)
    {
        languages.Sort();
        string previous = "";
        foreach (string lang in languages)
        {
            if (lang == previous)
            {
                return false;
            }
            previous = lang;
        }
        return true;
    }
}
