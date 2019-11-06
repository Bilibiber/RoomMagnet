using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }

        if (!IsPostBack)
        {
            SocketServer socket = new SocketServer(12345, "127.0.0.1", txtServerInfo);
            //启动线程  
            Thread thread = new Thread(new ThreadStart(socket.beginListen));
            thread.Start();
            // 在应用程序启动时运行的代码  
            //(new System.Threading.Thread(new System.Threading.ThreadStart(new Class1().CreatSocket))).Start();//开辟一个新线程  
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Socketclient client = new Socketclient(txtClientInfo, txtContent);
        client.StartClient();

    }
    public class Socketclient
    {
        TextBox txt;
        TextBox send_txt;
        public Socketclient(TextBox txt, TextBox send_txt)
        {
            this.txt = txt;
            this.send_txt = send_txt;
        }
        public void StartClient()
        {
            //传入数据的数据缓冲区.
            byte[] bytes = new byte[1024];

            // Connect to a remote device.
            try
            {
                // Establish the remote endpoint for the socket.
                // This example uses port 11000 on the local computer.
                //IPHostEntry ipHostInfo = Dns.Resolve(Dns.GetHostName());
                IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
                //获取服务器IP
                //int ipindex = ipHostInfo.AddressList.Count();
                //IPAddress ipAddress = ipHostInfo.AddressList[ipindex - 1];
                //IPEndPoint remoteEP = new IPEndPoint(ipAddress, 12345);


                //1.客户端与服务端地址是否一致；如果服务器使用net.tcp://127.0.0.1:8888，而客户端使用net.tcp://192.168.1.13:8888，这样是不行的，服务器端的地址也必须使用net.tcp://192.168.1.13:8888。
                //2. 服务端是否开启了防火墙，从而导致端口无法被客户端机器访问，这时你可以使用telnet命令(telnet ip port)看看是否能打开指定IP的指定端口，如果不行，那最直接的办法就是先关闭防火墙，如果你即要打开防火墙，还要让端口可访问，那就需要你自己进行设置了(google一下吧)，这里就不详说了。
                IPAddress address = IPAddress.Parse("127.0.0.1");
                IPEndPoint remoteEP = new IPEndPoint(address, 12345);



                // Create a TCP/IP  socket.
                Socket sender = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

                // Connect the socket to the remote endpoint. Catch any errors.
                try
                {
                    sender.Connect(remoteEP);
                    // Console.WriteLine("Socket connected to {0}",sender.RemoteEndPoint.ToString());
                    txt.Text += "\r\n" + sender.RemoteEndPoint.ToString() + "\r\n";
                    // Encode the data string into a byte array.
                    byte[] msg = Encoding.UTF8.GetBytes(send_txt.Text + "<EOF>");
                    // Send the data through the socket.
                    int bytesSent = sender.Send(msg);
                    // Receive the response from the remote device.
                    int bytesRec = sender.Receive(bytes);
                    //Console.WriteLine("Echoed test = {0}",Encoding.UTF8.GetString(bytes,0,bytesRec));
                    txt.Text += "\r\n" + Encoding.UTF8.GetString(bytes, 0, bytesRec) + "\r\n";//接收远程服务器信息

                    // Release the socket.
                    sender.Shutdown(SocketShutdown.Both);
                    sender.Close();
                }
                catch (ArgumentNullException ane)
                {
                    // Console.WriteLine("ArgumentNullException : {0}",ane.ToString());
                    txt.Text += "\r\n" + ane.ToString() + "\r\n";
                }
                catch (SocketException se)
                {
                    // Console.WriteLine("SocketException : {0}",se.ToString());
                    txt.Text += "\r\n" + se.ToString() + "\r\n";
                }
                catch (Exception e)
                {
                    // Console.WriteLine("Unexpected exception : {0}", e.ToString());
                    txt.Text += "\r\n" + e.ToString() + "\r\n";
                }
            }
            catch (Exception e)
            {
                // Console.WriteLine( e.ToString());
                txt.Text += "\r\n" + e.ToString() + "\r\n";
            }
        }
    }


    //服务器端
    public class SocketServer
    {

        int port;  //端口
        string host;//ip地址
        TextBox txt;
        /// <summary>
        /// 构造涵数
        /// </summary>
        /// <param name="ports">端口号</param>
        public SocketServer(int ports, string host, TextBox txt)
        {
            this.port = ports;
            this.host = host;
            this.txt = txt;
        }
        //开始监听
        public void beginListen()
        {
            try
            {
                IPAddress ip = IPAddress.Parse(host);//把ip地址字符串转换为IPAddress类型的实例
                IPEndPoint ipe = new IPEndPoint(ip, port);//用指定的端口和ip初始化IPEndPoint类的新实例
                                                          ///创建socket并开始监听
                Socket s = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);//创建一个socket对像，如果用udp协议，则要用SocketType.Dgram类型的套接字
                s.Bind(ipe);//绑定EndPoint对像（端口和ip地址）
                s.Listen(0);//开始监听
                txt.Text += "等待客户端连接";
                // Console.WriteLine("等待客户端连接");
                //定义循环，以便可以简历多次连接
                while (true)
                {
                    Socket temp = s.Accept();//为新建连接创建新的socket               
                    while (true)
                    {
                        string recvStr = "";
                        byte[] recvBytes = new byte[1024];
                        int bytes;
                        bytes = temp.Receive(recvBytes, recvBytes.Length, 0);//从客户端接受信息
                        recvStr += Encoding.UTF8.GetString(recvBytes, 0, bytes);
                        txt.Text += "\r\n" + recvStr + "\r\n";
                        if (recvStr.IndexOf("<EOF>") > -1)
                        {
                            break;
                        }
                    }
                    //给client端返回信息
                    // Console.WriteLine("server get message:{0}", recvStr);//把客户端传来的信息显示出来

                    string sendStr = "消息 upload OK";
                    byte[] bs = Encoding.UTF8.GetBytes(sendStr);
                    temp.Send(bs, bs.Length, 0);//返回信息给客户端
                    temp.Shutdown(SocketShutdown.Both);
                    temp.Close();

                }
            }
            catch (Exception ex)
            {
                string str = ex.ToString();
                txt.Text += "\r\n" + str + "\r\n";
            }
        }
    }
}

