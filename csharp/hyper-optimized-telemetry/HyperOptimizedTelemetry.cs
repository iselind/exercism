using System;

public static class TelemetryBuffer
{
    private static (bool signed, byte bytesRequired) calc(long reading)
    {
        byte width = 0;
        if (reading < 0)
        {
            if (reading >= sbyte.MinValue)
            {
                width = 8;
            }
            else if (reading >= short.MinValue)
            {
                width = 16;
            }
            else if (reading >= int.MinValue)
            {
                width = 32;
            }
            else if (reading >= long.MinValue)
            {
                width = 64;
            }
        }
        else
        {
            if (reading <= byte.MaxValue)
            {
                width = 8;
            }
            else if (reading <= ushort.MaxValue)
            {
                width = 16;
            }
            else if (reading <= uint.MaxValue)
            {
                width = 32;
            }
            else if (reading <= long.MaxValue)
            {
                width = 64;
            }
        }
        return (reading < 0, (byte)(width / 8));
    }

    public static byte[] ToBuffer(long reading)
    {
        byte[] val = BitConverter.GetBytes(reading);
        (bool signed, byte bytesRequired) meta = calc(reading);
        byte[] result = new byte[val.Length + 1];

        if (meta.signed)
        {
            // Signed thing
            result[0] = (byte)(256 - meta.bytesRequired);
        }
        else
        {
            // Unsigned thing
            result[0] = meta.bytesRequired;
        }

        int idx = 1;
        foreach (byte v in val)
        {
            if (idx >= result.Length)
            {
                break;
            }

            result[idx] = v;
            idx++;
        }

        Console.WriteLine("[{0}]", string.Join(", ", result));
        return result;
    }

    public static long FromBuffer(byte[] buffer)
    {
        throw new NotImplementedException("Please implement the static TelemetryBuffer.FromBuffer() method");
    }
}
