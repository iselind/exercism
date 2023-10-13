#include <string>

using namespace std;

namespace log_line
{
    string message(string log_line)
    {
        auto delimiter = log_line.find(':');
        return log_line.substr(delimiter + 2);
    }
    string log_level(string log_line)
    {
        auto delimiter = log_line.find(']');
        return log_line.substr(1, delimiter - 1);
    }
    string reformat(string log_line)
    {
        return message(log_line) + " (" + log_level(log_line) + ")";
    }
} // namespace log_line
