using System;

static class SavingsAccount
{
    public static float InterestRate(decimal balance)
    {
        if (balance < 0)
        {
            return 3.213f;
        }

        if (balance < 1000)
        {
            return 0.5f;
        }

        if (balance < 5000)
        {
            return 1.621f;
        }

        // More than $5000 as balance
        return 2.475f;
    }

    public static decimal Interest(decimal balance)
    {
        return ((decimal)InterestRate(balance) / 100m) * balance;
    }

    public static decimal AnnualBalanceUpdate(decimal balance)
    {
        return balance + Interest(balance);
    }

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        int years = 0;
        while (balance < targetBalance)
        {
            years += 1;
            balance = AnnualBalanceUpdate(balance);
        }
        return years;
    }
}
