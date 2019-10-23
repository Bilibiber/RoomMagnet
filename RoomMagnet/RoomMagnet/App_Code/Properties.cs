using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Property
{

    private int PropertyID;
    private String StreetAddress;
    private String City;
    private String HomeState;
    private String Country;
    private String ZipCode;
    private String Filters;
    private String ImagePath;
    private DateTime LastUpdated;
    private String LastUpdatedBy;
    private int HostID;
    public Property(int PropertyID, String StreetAddress, String City, String HomeState,
        String Country, String ZipCode, String Filters, String ImagePath, DateTime LastUpdated,
        String LastUpdatedBy, int HostID)
    {

    }
    public void setPropertyID(int PropertyID)
    {
        this.PropertyID = PropertyID;
    }
    public void setStreetAddress(String StreetAddress)
    {
        this.StreetAddress = StreetAddress;
    }
    public void setCity(String City)
    {
        this.City = City;
    }
    public void setCountry(String Country)
    {
        this.Country = Country;
    }
    public void setZipCode(String ZipCode)
    {
        this.ZipCode = ZipCode;
    }
    public void setFilters(String Filters)
    {
        this.Filters = Filters;
    }
    public void setImagePath(String ImagePath)
    {
        this.ImagePath = ImagePath;
    }

}