using System;

public static class TelemetryBuffer
{
    private static (bool signed, byte bytesRequired) calc(long reading)
    {
        byte width = 0;
        bool isSignedType = false;

        if (reading <= short.MaxValue)
        {
            isSignedType = true;
            width = 16;
        }
        else if (reading <= ushort.MaxValue)
        {
            isSignedType = false;
            width = 16;
        }
        else if (reading <= int.MaxValue)
        {
            isSignedType = true;
            width = 32;
        }
        else if (reading <= uint.MaxValue)
        {
            isSignedType = false;
            width = 32;
        }
        else if (reading <= long.MaxValue)
        {
            isSignedType = true;
            width = 64;
        }

        (bool signed, byte bytesRequired) result = (isSignedType, (byte)(width / 8));
        Console.WriteLine("reading '{0}' is signed ({1}) and bytesRequired is ({2}/{3})",
                reading, result.signed, result.bytesRequired, width);
        return result;
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
