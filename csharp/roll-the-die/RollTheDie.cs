using System;

public class Player
{
    Random r = new Random();
    public int RollDie()
    {
        return (int)(r.NextDouble() * 17.0 + 1.0);
    }

    public double GenerateSpellStrength()
    {
        return 100.0 * r.NextDouble();
    }
}
