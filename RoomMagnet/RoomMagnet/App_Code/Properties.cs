using System;

public class Property
{
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
    public static int PropertyCount = 0;
    public static Property[] Properties = new Property[1000];

    public Property(String StreetAddress, String City, String HomeState,
        String Country, String ZipCode, String Filters, String ImagePath, DateTime LastUpdated,
        String LastUpdatedBy, int HostID)
    {
        setStreetAddress(StreetAddress);
        setCity(City);
        setState(HomeState);
        setCountry(Country);
        setZipCode(ZipCode);
        setFilters(Filters);
        setImagePath(ImagePath);
    }

    public void setStreetAddress(String StreetAddress)
    {
        this.StreetAddress = StreetAddress;
    }

    public String getStreetAddress()
    {
        return StreetAddress;
    }

    public void setCity(String City)
    {
        this.City = City;
    }

    public String getCity()
    {
        return City;
    }

    public void setCountry(String Country)
    {
        this.Country = Country;
    }

    public String getCountry()
    {
        return Country;
    }

    public void setState(String State)
    {
        this.HomeState = State;
    }

    public String getState()
    {
        return HomeState;
    }

    public void setZipCode(String ZipCode)
    {
        this.ZipCode = ZipCode;
    }

    public String getZipCode()
    {
        return ZipCode;
    }

    public void setFilters(String Filters)
    {
        this.Filters = Filters;
    }

    public String getFilters()
    {
        return Filters;
    }

    public void setImagePath(String ImagePath)
    {
        this.ImagePath = ImagePath;
    }

    public String getImagePath()
    {
        return ImagePath;
    }

    public void setLastUpdated(DateTime LastUpdated)
    {
        this.LastUpdated = LastUpdated;
    }

    public DateTime getLastUpdated()
    {
        return LastUpdated;
    }

    public void setLastUpdatedBy(String LastUpdatedBy)
    {
        this.LastUpdatedBy = LastUpdatedBy;
    }

    public String getLastUpdatedBy()
    {
        return LastUpdatedBy;
    }
}