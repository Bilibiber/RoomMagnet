using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Image
/// </summary>
public class Image
{
    public static Image[] images = new Image[8];
    public static int imageCount = 0;
    private Byte [] ByteCode;
    public Image()
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