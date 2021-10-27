using System;

static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        department = department?.ToUpper();
        return (id == null ? "" : "[" + id + "] - ") + name + " - " + (department ?? "OWNER");
    }
}
