﻿using System;

public class Property
{
    private String title;
    private String StreetAddress;
    private String City;
    private String HomeState;
    private String Country;
    private String ZipCode;
    private int SquareFootage;
    private int RentPrice;
    private DateTime StartDate;
    private DateTime EndDate;
    private String Filters;
    private String ImagePath;
    private DateTime LastUpdated;
    private String LastUpdatedBy;
    private int HostID;
    public static int PropertyCount = 0;
    public static Property[] Properties = new Property[1000];

    public Property(String title, String StreetAddress, String City, String HomeState, String Country, String ZipCode,
        int SquareFootage, int RentPrice, DateTime StartDate, DateTime EndDate, String Filters, 
        String ImagePath, DateTime LastUpdated, String LastUpdatedBy, int HostID)
    {
        setTitle(title);
        setStreetAddress(StreetAddress);
        setCity(City);
        setState(HomeState);
        setCountry(Country);
        setZipCode(ZipCode);
        setSquareFootage(SquareFootage);
        setRentPrice(RentPrice);
        setStartDate(StartDate);
        setEndDate(EndDate);
        setFilters(Filters);
        setImagePath(ImagePath);
        setHostID(HostID);
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
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

    public void setSquareFootage(int SquareFootage)
    {
        this.SquareFootage = SquareFootage;
    }

    public int getSquareFootage()
    {
        return SquareFootage;
    }

   

    public void setRentPrice(int RentPrice)
    {
        this.RentPrice = RentPrice;
    }

    public int getRentPrice()
    {
        return RentPrice;
    }


    public void setStartDate(DateTime StartDate)
    {
        this.StartDate = StartDate;
    }

    public DateTime getStartDate()
    {
        return StartDate;
    }
    public void setEndDate(DateTime EndDate)
    {
        this.EndDate = EndDate;
    }

    public DateTime getEndDate()
    {
        return EndDate;
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

    public void setHostID(int HostID)
    {
        this.HostID = HostID;
    }

    public int getHostID()
    {
        return HostID;
    }
}