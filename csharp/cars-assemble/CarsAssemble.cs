using System;

static class AssemblyLine
{
    public static double ProductionRatePerHour(int speed)
    {
        var fullProduction = 221*speed;
        if (speed < 5) {
            return fullProduction;
        } else if (speed < 9) {
            return fullProduction*0.9;
        } else if (speed == 9) {
            return fullProduction*0.8;
        } else {
            return fullProduction*0.77;
        }
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int)(ProductionRatePerHour(speed)/60.0);
    }
}
