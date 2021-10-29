using System;

public static class TelemetryBuffer
{
    private static (bool signed, byte bytesRequired) calc(long reading)
    {
        byte width = 0;
        bool isSignedType = false;

        if (reading <= short.MaxValue && reading >= short.MinValue)
        {
            isSignedType = true;
            width = 16;
        }
        else if (reading <= ushort.MaxValue && reading >= ushort.MinValue)
        {
            isSignedType = false;
            width = 16;
        }
        else if (reading <= int.MaxValue && reading >= int.MinValue)
        {
            isSignedType = true;
            width = 32;
        }
        else if (reading <= uint.MaxValue && reading >= uint.MinValue)
        {
            isSignedType = false;
            width = 32;
        }
        else if (reading <= long.MaxValue && reading >= long.MinValue)
        {
            isSignedType = true;
            width = 64;
        }

        (bool signed, byte bytesRequired) result = (isSignedType, (byte)(width / 8));
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
            if (reading < 0 && idx > meta.bytesRequired)
            {
                break;
            }
            if (idx >= result.Length)
            {
                break;
            }

            result[idx] = v;
            idx++;
        }

        return result;
    }

    public static long FromBuffer(byte[] buffer)
    {
        switch (buffer[0])
        {
            case 1 + byte.MaxValue - 8:
                return BitConverter.ToInt64(buffer, 1);
            case 1 + byte.MaxValue - 4:
                return BitConverter.ToInt32(buffer, 1);
            case 1 + byte.MaxValue - 2:
                return BitConverter.ToInt16(buffer, 1);
            case 2:
                return BitConverter.ToUInt16(buffer, 1);
            case 4:
                return BitConverter.ToUInt32(buffer, 1);
            default:
                Console.WriteLine("default case chosen");
                return 0;
        }
    }
}
