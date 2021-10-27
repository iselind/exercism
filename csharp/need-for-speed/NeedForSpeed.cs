using System;

class RemoteControlCar
{
    int batteryPercent = 100;
    int distance;
    int speed;
    int batteryDrain;
    // TODO: define the constructor for the 'RemoteControlCar' class
    public RemoteControlCar(int speed, int batteryDrain)
    {
        this.batteryDrain = batteryDrain;
        this.speed = speed;
        this.distance = 0;
    }

    public bool BatteryDrained()
    {
        return batteryPercent < batteryDrain;
    }

    public int DistanceDriven()
    {
        return distance;
    }

    public void Drive()
    {
        if (!BatteryDrained())
        {
            distance += speed;
            batteryPercent -= batteryDrain;
        }
    }

    public static RemoteControlCar Nitro()
    {
        return new RemoteControlCar(50, 4);
    }
}

class RaceTrack
{
    int distance;
    public RaceTrack(int distance)
    {
        this.distance = distance;
    }

    public bool CarCanFinish(RemoteControlCar car)
    {
        while (car.DistanceDriven() < distance)
        {
            if (car.BatteryDrained())
            {
                return false;
            }
            car.Drive();
        }
        return true;
    }
}
