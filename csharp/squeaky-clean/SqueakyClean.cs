using System;
using System.Text;

public static class Identifier
{
    public static string Clean(string identifier)
    {
        bool capitalize = false;
        StringBuilder sb = new StringBuilder();
        foreach (char c in identifier)
        {
            switch (c)
            {
                case ' ':
                    sb.Append('_');
                    break;
                case '\0':
                    sb.Append("CTRL");
                    break;
                case '-':
                    capitalize = true;
                    break;
                default:
                    if (!Char.IsLetter(c))
                    {
                        continue;
                    }

                    if (c >= 'α' && c <= 'ω')
                    {
                        continue;
                    }

                    if (capitalize)
                    {
                        sb.Append(Char.ToUpper(c));
                        capitalize = false;
                    }
                    else
                    {
                        sb.Append(c);
                    }
                    break;
            }
        }
        return sb.ToString();
    }
}
