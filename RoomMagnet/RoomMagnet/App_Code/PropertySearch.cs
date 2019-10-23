using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PropertySearch
/// </summary>
public class PropertySearch
{
    private int SearchID;
    private String SearchHistory;
    private DateTime SearchTime;
    private int UserID;

    public PropertySearch(int SearchID, String SearchHistory, DateTime SearchTime, int UserID)
    {
        setSearchID(SearchID);
        setSearchHistory(SearchHistory);
        setSearchTime(SearchTime);
        setUserID(UserID);
      
    }

    public void setSearchID(int SearchID)
    {
        this.SearchID = SearchID;
    }

    public void setSearchHistory(String SearchHistory)
    {
        this.SearchHistory = SearchHistory;
    }

    public void setSearchTime(DateTime SearchTime)
    {
        this.SearchTime = SearchTime;
    }

    public void setUserID(int UserID)
    {
        this.UserID = UserID;
    }

    public int getSearchID()
    {
        return this.SearchID;
    }

    public String getSearchHistory()
    {
        return this.SearchHistory;
    }
        
    public DateTime getSearchTime()
    {
        return this.SearchTime;
    }

    public int getUserID()
    {
        return this.UserID;
    }




















}