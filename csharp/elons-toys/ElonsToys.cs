using System;

class RemoteControlCar
{
    int batteryPercent = 100;
    int distanceMeters;

    public static RemoteControlCar Buy()
    {
        return new RemoteControlCar();
    }

    public string DistanceDisplay()
    {
        return $"Driven {distanceMeters} meters";
    }

    public string BatteryDisplay()
    {
        if (batteryPercent == 0)
        {
            return "Battery empty";
        }
        return $"Battery at {batteryPercent}%";
    }

    public void Drive()
    {
        if (batteryPercent > 0)
        {
            batteryPercent -= 1;
            distanceMeters += 20;
        }
    }
}
