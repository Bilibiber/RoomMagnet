using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for Conversation
/// </summary>
public class Conversation
{
    private int ConversationID;
    private int SenderID;
    private int ReceiverID;
    private int latestMessageID;
    public static Conversation[] conversations = new Conversation[100000];
    public static int ConversationCount = 0;
    public Conversation(int SenderID, int RecieverID)
    {
        setConversationID(ConversationID);
        setSenderID(SenderID);
        setRecieverID(RecieverID);
        ConversationCount++;
    }
    public Conversation()
    {
        ConversationCount++;
    }
    public void setConversationID(int ConversationID)
    {
        this.ConversationID = ConversationID;
    }
    public void setSenderID(int SenderID)
    {
        this.SenderID = SenderID;
    }
    public void setRecieverID(int ReceiverID)
    {
        this.ReceiverID = ReceiverID;
    }
    public void setlatestMessage(int latestMessageID)
    {
        this.latestMessageID = latestMessageID;
    }
    public int getConversationID()
    {
        return this.ConversationID;
    }
    public int getSenderID()
    {
        return this.SenderID;
    }
    public int getRecieverID()
    {
        return this.ReceiverID;
    }
    public int getLatestMessageID()
    {
        return this.latestMessageID;
    }

}