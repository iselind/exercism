using System;
using System.Collections.Generic;

public static class DialingCodes
{
    public static Dictionary<int, string> GetEmptyDictionary()
    {
        return new Dictionary<int, string>();
    }

    public static Dictionary<int, string> GetExistingDictionary()
    {
        return new Dictionary<int, string>
        {
            {  1 ,"United States of America"},
            { 55 ,"Brazil"},
            { 91 ,"India"}
        };
    }

    public static Dictionary<int, string> AddCountryToEmptyDictionary(int CountryCode, string CountryName)
    {
        var dict = GetEmptyDictionary();
        dict[CountryCode] = CountryName;
        return dict;
    }

    public static Dictionary<int, string> AddCountryToExistingDictionary(
        Dictionary<int, string> existingDictionary, int countryCode, string CountryName)
    {
        existingDictionary[countryCode] = CountryName;
        return existingDictionary;
    }

    public static string GetCountryNameFromDictionary(
        Dictionary<int, string> existingDictionary, int countryCode)
    {
        if (existingDictionary.ContainsKey(countryCode))
        {
            return existingDictionary[countryCode];
        }
        else
        {
            return "";
        }
    }
    public static Dictionary<int, string> UpdateDictionary(
        Dictionary<int, string> existingDictionary, int countryCode, string countryName)
    {
        if (existingDictionary.ContainsKey(countryCode))
        {
            return AddCountryToExistingDictionary(existingDictionary, countryCode, countryName);
        }
        else
        {
            return existingDictionary;
        }
    }

    public static Dictionary<int, string> RemoveCountryFromDictionary(
        Dictionary<int, string> existingDictionary, int countryCode)
    {
        existingDictionary.Remove(countryCode);
        return existingDictionary;
    }
    public static bool CheckCodeExists(Dictionary<int, string> existingDictionary, int countryCode)
    {
        return existingDictionary.ContainsKey(countryCode);
    }

    public static string FindLongestCountryName(Dictionary<int, string> existingDictionary)
    {
        string longestSoFar = "";
        foreach (string countryName in existingDictionary.Values)
        {
            if (countryName.Length > longestSoFar.Length)
            {
                longestSoFar = countryName;
            }
        }
        return longestSoFar;
    }
}
