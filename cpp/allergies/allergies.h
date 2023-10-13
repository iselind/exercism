#if !defined(ALLERGIES_H)
#define ALLERGIES_H

#include <string>
#include <unordered_set>
#include <map>

using namespace std;

namespace allergies
{
    class allergy_test
    {
    public:
        allergy_test(int);
        bool is_allergic_to(string);
        unordered_set<std::string> get_allergies();

    private:
        int score;
        map<string, int> items{
            {"eggs", 1},
            {"peanuts", 2},
            {"shellfish", 4},
            {"strawberries", 8},
            {"tomatoes", 16},
            {"chocolate", 32},
            {"pollen", 64},
            {"cats", 128}};
    };
} // namespace allergies

#endif // ALLERGIES_H
