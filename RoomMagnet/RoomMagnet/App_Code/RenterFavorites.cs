using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RenterFavorites
/// </summary>
public class RenterFavorites
{
    private int RenterID;
    private int FavoriteProperties;

    public RenterFavorites()
    {
        setRenterID(RenterID);
        setFavoriteProperties(FavoriteProperties);

    }

    public void setRenterID(int RenterID)
    {
        this.RenterID = RenterID;
    }

    public void setFavoriteProperties(int FavoriteProperties)
    {
        this.FavoriteProperties = FavoriteProperties;
    }

    public int getRenterID()
    {
        return this.RenterID;
    }

    public int getFavoriteProperties()
    {
        return this.FavoriteProperties;
    }

}