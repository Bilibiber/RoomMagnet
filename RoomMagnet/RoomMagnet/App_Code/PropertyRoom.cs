using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class PropertyRoom
{
    private int RoomID;
    private String ImagePath;
    private DateTime EffectiveDate;
    private DateTime TerminationDate;
    private float MonthlyPrice;
    private DateTime LastUpdated;
    private String LastUpdatedBy;
    private int PropertyID;
    private int RenterID;


    public PropertyRoom()
    {

    }

    public void setRoomID(int RoomID)
    {
        this.RoomID = RoomID;
    }

    public void setImagePath(String ImagePath)
    {
        this.ImagePath = ImagePath;
    }
    public String getImagePath()
    {
        return ImagePath;
    }


}