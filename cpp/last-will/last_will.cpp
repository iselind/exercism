// Enter your code below the lines of the families' information

// Secret knowledge of the Zhang family:
namespace zhang
{
    int bank_number_part(int secret_modifier)
    {
        int zhang_part{8'541};
        return (zhang_part * secret_modifier) % 10000;
    }
    namespace red
    {
        int code_fragment() { return 512; }
    }
    namespace blue
    {
        int code_fragment() { return 677; }
    }
}

// Secret knowledge of the Khan family:
namespace khan
{
    int bank_number_part(int secret_modifier)
    {
        int khan_part{4'142};
        return (khan_part * secret_modifier) % 10000;
    }
    namespace red
    {
        int code_fragment() { return 148; }
    }
    namespace blue
    {
        int code_fragment() { return 875; }
    }
}

// Secret knowledge of the Garcia family:
namespace garcia
{
    int bank_number_part(int secret_modifier)
    {
        int garcia_part{4'023};
        return (garcia_part * secret_modifier) % 10000;
    }
    namespace red
    {
        int code_fragment() { return 118; }
    }
    namespace blue
    {
        int code_fragment() { return 923; }
    }
}

namespace estate_executor
{
    int assemble_account_number(int secret_modifier)
    {
        return garcia::bank_number_part(secret_modifier) + khan::bank_number_part(secret_modifier) + zhang::bank_number_part(secret_modifier);
    }

    int assemble_code()
    {
        int blues = 0;
        int reds = 0;

        blues += garcia::blue::code_fragment();
        blues += khan::blue::code_fragment();
        blues += zhang::blue::code_fragment();

        reds += garcia::red::code_fragment();
        reds += khan::red::code_fragment();
        reds += zhang::red::code_fragment();

        return blues * reds;
    }
}
// Enter your code below
