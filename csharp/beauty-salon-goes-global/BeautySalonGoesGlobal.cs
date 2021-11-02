using System;
using System.Runtime.InteropServices;


public enum Location
{
    NewYork,
    London,
    Paris
}

public enum AlertLevel
{
    Early,
    Standard,
    Late
}

public static class Appointment
{
    public static DateTime ShowLocalTime(DateTime dtUtc)
    {
        return dtUtc.ToLocalTime();
    }

    private static TimeZoneInfo LocationToTimeZone(Location location)
    {
        string timeZoneID = "";
        if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
        {
            switch (location)
            {
                case Location.NewYork:
                    timeZoneID = "Eastern Standard Time";
                    break;
                case Location.Paris:
                    timeZoneID = "W. Europe Standard Time";
                    break;
                case Location.London:
                    timeZoneID = "GMT Standard Time";
                    break;
            }
        }
        else
        {
            // For Mac and Linux
            switch (location)
            {
                case Location.NewYork:
                    timeZoneID = "America/New_York";
                    break;
                case Location.Paris:
                    timeZoneID = "Europe/Paris";
                    break;
                case Location.London:
                    timeZoneID = "Europe/London";
                    break;
            }
        }
        return TimeZoneInfo.FindSystemTimeZoneById(timeZoneID);
    }

    public static DateTime Schedule(string appointmentDateDescription, Location location)
    {

        return TimeZoneInfo.ConvertTimeToUtc(
                DateTime.Parse(appointmentDateDescription),
                LocationToTimeZone(location));
    }

    public static DateTime GetAlertTime(DateTime appointment, AlertLevel alertLevel)
    {
        TimeSpan diff = TimeSpan.Zero;
        switch (alertLevel)
        {
            case AlertLevel.Early:
                diff = TimeSpan.FromHours(24);
                break;
            case AlertLevel.Standard:
                diff = TimeSpan.FromMinutes(60 + 45);
                break;
            case AlertLevel.Late:
                diff = TimeSpan.FromMinutes(30);
                break;
        }
        return appointment.Subtract(diff);
    }

    public static bool HasDaylightSavingChanged(DateTime dt, Location location)
    {
        DateTime sevenDaysAgo = dt.Subtract(TimeSpan.FromDays(7));

        // Make sure both DateTimes are converted back to UTC from location
        dt = TimeZoneInfo.ConvertTimeToUtc(dt, LocationToTimeZone(location));
        sevenDaysAgo = TimeZoneInfo.ConvertTimeToUtc(sevenDaysAgo, LocationToTimeZone(location));

        return dt.Hour != sevenDaysAgo.Hour;
    }

    public static DateTime NormalizeDateTime(string dtStr, Location location)
    {
        throw new NotImplementedException("Please implement the (static) Appointment.NormalizeDateTime() method");
    }
}
