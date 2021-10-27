using System;

class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek()
    {
        return new int[] { 0, 2, 5, 3, 7, 8, 4 };
    }

    public int Today()
    {
        var todayIdx = birdsPerDay.Length - 1;
        return birdsPerDay[todayIdx];
    }

    public void IncrementTodaysCount()
    {
        var todayIdx = birdsPerDay.Length - 1;
        birdsPerDay[todayIdx] += 1;
    }

    public bool HasDayWithoutBirds()
    {
        foreach (int count in birdsPerDay)
        {
            if (count == 0)
            {
                return true;
            }
        }
        return false;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        int count = 0;
        for (int i = 0; i < numberOfDays; i++)
        {
            count += birdsPerDay[i];
        }
        return count;
    }

    public int BusyDays()
    {
        int count = 0;
        foreach (int birds in birdsPerDay)
        {
            if (birds >= 5)
            {
                count += 1;
            }
        }
        return count;
    }
}
