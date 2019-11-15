using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Web;

/// <summary>
/// Summary description for SocketBuilder
/// </summary>
public class SocketBuilder
{
    Socket socket;
    EndPoint epLocal, epRemote;
    public SocketBuilder()
    {
        socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReuseAddress, true);
    }
    private string getlocalIP()
    {
        IPHostEntry HOST;
        HOST = Dns.GetHostEntry(Dns.GetHostName());

        foreach (IPAddress ip in HOST.AddressList)
        {
            if (ip.AddressFamily == AddressFamily.InterNetwork)
            {
                return ip.ToString();
            }
        }
        return "127.0.0.1";
    }
}