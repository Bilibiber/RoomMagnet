using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Sockets;
using System.Text;

public partial class WebPages_WebSocket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            var socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);


            //renference：http://msdn.microsoft.com/zh-cn/library/system.net.sockets.socket.bind.aspx
            socket.Bind(new IPEndPoint(IPAddress.Any, 4530));


            //renference：http://msdn.microsoft.com/zh-cn/library/system.net.sockets.socket.listen(v=VS.100).aspx
            socket.Listen(4);

            

            //开始接受客户端连接请求
            //renference：http://msdn.microsoft.com/zh-cn/library/system.net.sockets.socket.beginaccept.aspx
            socket.BeginAccept(new AsyncCallback((ar) =>
            {
                //这就是客户端的Socket实例，我们后续可以将其保存起来
                var client = socket.EndAccept(ar);

                //给客户端发送一个欢迎消息
                client.Send(Encoding.Unicode.GetBytes("Hi there, I received your message at " + DateTime.Now.ToString()));
            }), null);

            SocketConnection.Text = "Ready to Send Message";
        }
        catch (Exception)
        {
            SocketConnection.Text = "Disconnected";
        }

    }
}