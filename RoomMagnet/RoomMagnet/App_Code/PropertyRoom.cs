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

    public void setEffectiveDate(DateTime EffectiveDate)
    {
        this.EffectiveDate = EffectiveDate;
    }

    public void setTerminationDate(DateTime TerminationDate)
    {
        this.TerminationDate = TerminationDate;
    }

    public void setMonthlyPrice(float MonthlyPrice)
    {
        this.MonthlyPrice = MonthlyPrice;
    }

    public void setLastUpdated(DateTime LastUpdated)
    {
        this.LastUpdated = LastUpdated;
    }

    public void setLastUpdatedBy(String LastUpdatedBy)
    {
        this.LastUpdatedBy = LastUpdatedBy;
    }

    public void setPropertyID(int PropertyID)
    {
        this.PropertyID = PropertyID;
    }

    public void setRenterID(int RenterID)
    {
        this.RenterID = RenterID;
    }

    //ChrisColeBranch PropertyRoom Finalized list of setters to push to MasterBranch  (PLZ WORK v4 FOR TRENT)

    public int getRoomID()
    {
        return RoomID;
    }

    public String getImagePath()
    {
        return this.ImagePath;
    }

    public DateTime getEffectiveDate()
    {
        return this.EffectiveDate;
    }

    public DateTime getTerminationDate()
    {
        return this.TerminationDate;
    }
}

  