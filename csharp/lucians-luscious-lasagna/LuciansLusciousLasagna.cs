class Lasagna
{
    public int ExpectedMinutesInOven() {
        return 40;
    }

    public int RemainingMinutesInOven(int already) {
        return ExpectedMinutesInOven() - already;
    }

    public int PreparationTimeInMinutes(int layers) {
        return 2 * layers;
    }

    public int ElapsedTimeInMinutes(int layers, int already) {
        return PreparationTimeInMinutes(layers) + already;
    }
}
