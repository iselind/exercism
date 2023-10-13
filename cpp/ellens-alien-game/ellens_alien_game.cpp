namespace targets
{
    class Alien
    {
    public:
        Alien(int x, int y)
        {
            x_coordinate = x;
            y_coordinate = y;
        }
        int x_coordinate;
        int y_coordinate;
        int get_health()
        {
            return health;
        }
        bool hit()
        {
            if (health > 0)
                health--;

            return true; // Shield is not up
        }
        bool is_alive()
        {
            return health > 0;
        }
        bool teleport(int x_new, int y_new)
        {
            x_coordinate = x_new;
            y_coordinate = y_new;
            return true; // Successful teleportation
        }
        bool collision_detection(Alien other)
        {
            if (x_coordinate != other.x_coordinate)
                return false;
            if (y_coordinate != other.y_coordinate)
                return false;

            return true;
        }

    private:
        int health = 3;
    };

} // namespace targets
