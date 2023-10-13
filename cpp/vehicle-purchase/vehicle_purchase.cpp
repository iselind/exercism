#include "vehicle_purchase.h"

namespace vehicle_purchase
{

    // needs_license determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
    bool needs_license(std::string kind)
    {
        return kind.compare("car") == 0 || kind.compare("truck") == 0;
    }

    // choose_vehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
    std::string choose_vehicle(std::string option1, std::string option2)
    {
        if (option1 < option2)
        {
            return option1 + " is clearly the better choice.";
        }
        else
        {
            return option2 + " is clearly the better choice.";
        }
    }

    // calculate_resell_price calculates how much a vehicle can resell for at a certain age.
    double calculate_resell_price(double original_price, double age)
    {
        double discount;
        if (age < 3)
        {
            discount = 0.8; // 80%
        }
        else if (age >= 10)
        {
            discount = 0.5; // 50%
        }
        else
        {
            discount = 0.7; // 70%
        }
        return original_price * discount;
    }

} // namespace vehicle_purchase
