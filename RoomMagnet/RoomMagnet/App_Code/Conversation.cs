using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Conversation
/// </summary>
public class Conversation
{
    private int ConversationID;
    private int SenderID;
    private int RecieverID;
    public Conversation(int ConversationID, int SenderID, int RecieverID)
    {
       
    }
    public void setConversationID(int ConversationID)
    {
        this.ConversationID = ConversationID;
    }
    public void setSenderID(int SenderID)
    {
        this.SenderID = SenderID;
    }
    public void setRecieverID(int RecieverID)
    {
        this.RecieverID = RecieverID;
    }
}