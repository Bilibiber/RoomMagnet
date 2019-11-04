using System;

/// <summary>
/// Summary description for User
/// </summary>
public class Users
{
    private string firstName;
    private string lastName;
    private string middleName;
    private string gender;
    private string email;
    private string passWord;
    private string roles;
    private DateTime birthday;
    private string backgroundURL;
    private DateTime lastUpdated;
    private string lastUpdatedBy;
    public static int UserCount = 0;
    public static Users[] UserArray = new Users[1000];

    public Users(string firstName, string LastName, string email, string passWord, string DateofBirth)
    {
        string name = firstName + " " + LastName;
        setFirstName(firstName);
        setLastName(LastName);
        setMiddleName(middleName);
        setEmail(email);
        setPassword(passWord);
        setLastupdated(DateTime.Now);
        setLastUpdatedBy(name);
        UserCount++;
        DateTime DOB = Convert.ToDateTime(DateofBirth);
        setBirthday(DOB);
    }

    public void setFirstName(string firstName)
    {
        this.firstName = firstName;
    }

    public string getFirstName()
    {
        return this.firstName;
    }

    public void setLastName(string lastName)
    {
        this.lastName = lastName;
    }

    public string getLastName()
    {
        return this.lastName;
    }

    public void setMiddleName(string middleName)
    {
        this.middleName = middleName;
    }

    public string getMiddleName()
    {
        return this.middleName;
    }

    public void setEmail(string email)
    {
        this.email = email;
    }

    public string getEmail()
    {
        return this.email;
    }

    public void setPassword(string passWord)
    {
        this.passWord = passWord;
    }

    public string getPassword()
    {
        return this.passWord;
    }

    public void setBirthday(DateTime birthday)
    {
        this.birthday = birthday;
    }

    public DateTime getBirthday()
    {
        return this.birthday;
    }

    public void setURL(string URL)
    {
        this.backgroundURL = URL;
    }

    public string getURL()
    {
        return this.backgroundURL;
    }

    public void setLastupdated(DateTime updated)
    {
        this.lastUpdated = updated;
    }

    public DateTime getLastUpdated()
    {
        return this.lastUpdated;
    }

    public void setLastUpdatedBy(string name)
    {
        this.lastUpdatedBy = name;
    }

    public string getLastUpdatedBy()
    {
        return this.lastUpdatedBy;
    }
}