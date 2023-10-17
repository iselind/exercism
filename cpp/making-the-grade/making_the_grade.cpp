#include <array>
#include <string>
#include <vector>
#include <cmath>
#include <algorithm>

int my_floor(double s)
{
    return (int)std::floor(s);
}

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores)
{
    std::vector<int> bar;

    std::transform(student_scores.cbegin(), student_scores.cend(), std::back_inserter(bar), [](double s)
                   { return (int)std::floor(s); });
    return bar;
}

// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores)
{
    int count = 0;

    for (auto score : student_scores)
    {
        if (score <= 40)
            count++;
    }
    return count;
}

// Determine how many of the provided student scores were 'the best' based on the provided threshold.
std::vector<int> above_threshold(std::vector<int> student_scores, int threshold)
{
    std::vector<int> bar;

    for (auto score : student_scores)
    {
        if (score >= threshold)
            bar.push_back(score);
    }
    return bar;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score)
{
    int increment = (int)std::floor((highest_score - 40) / 4);

    return {41 + 0 * increment, 41 + 1 * increment, 41 + 2 * increment, 41 + 3 * increment};
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(std::vector<int> student_scores, std::vector<std::string> student_names)
{
    std::vector<std::string> bar;

    for (int idx = 0; idx < student_names.size(); idx++)
    {
        int rank = idx + 1;
        bar.push_back(std::to_string(rank) + ". " + student_names[idx] + ": " + std::to_string(student_scores[idx]));
    }

    return bar;
}

// Create a string that contains the name of the first student to make a perfect score on the exam.
std::string perfect_score(std::vector<int> student_scores, std::vector<std::string> student_names)
{
    int idx = 0;
    while (idx < student_scores.size())
    {
        if (student_scores[idx] == 100)
            return student_names[idx];
        idx++;
    }

    return "";
}
