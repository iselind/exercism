#include "allergies.h"

namespace allergies
{
    allergy_test::allergy_test(int score)
    {
        this->score = score;
    }
    bool allergy_test::is_allergic_to(string item)
    {
        if (score == 0)
            return false;

        int s = items[item];
        return (score & s) != 0;
    }
    unordered_set<std::string> allergy_test::get_allergies()
    {
        unordered_set<std::string> result{};

        for (auto [key, value] : items)
        {
            if (is_allergic_to(key))
                result.emplace(key);
        }

        return result;
    }
} // namespace allergies
