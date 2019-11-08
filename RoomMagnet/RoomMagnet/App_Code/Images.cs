using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Image
/// </summary>
public class Images
{
    public static Images[] images = new Images[8];
    public static int imageCount = 0;
    private Byte [] ByteCode;
    public Images()
    {

        imageCount++;
    }
    public void setByteCode(Byte [] imageByte)
    {
        this.ByteCode = imageByte;
    }
    public Byte [] getByte()
    {
        return this.ByteCode;
    }
}