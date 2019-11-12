<%@ WebHandler Language="C#" Class="WebSocketHandler" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.WebSockets;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.WebSockets;

public class WebSocketHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        //检查 查询是否是WebSocket请求
        if (HttpContext.Current.IsWebSocketRequest)
        {
            //如果是，我们附加异步处理程序
            context.AcceptWebSocketRequest(WebSocketRequestHandler);
        }
    }

    public bool IsReusable { get { return false; } }

    //异步请求处理程序
    public async Task WebSocketRequestHandler(AspNetWebSocketContext webSocketContext)
    {
        //获取当前的WebSocket对象
        WebSocket webSocket = webSocketContext.WebSocket;

        /*
         * 我们定义一个常数，它将表示接收到的数据的大小。 它是由我们建立的，我们可以设定任何值。 我们知道在这种情况下，发送的数据的大小非常小。
        */
        const int maxMessageSize = 1024;

        
        var receivedDataBuffer = new ArraySegment<Byte>(new Byte[maxMessageSize]);

        var cancellationToken = new CancellationToken();

        
        while (webSocket.State == WebSocketState.Open)
        {
            
            WebSocketReceiveResult webSocketReceiveResult = await webSocket.ReceiveAsync(receivedDataBuffer, cancellationToken);

            
            if (webSocketReceiveResult.MessageType == WebSocketMessageType.Close)
            {
                await webSocket.CloseAsync(WebSocketCloseStatus.NormalClosure, String.Empty, cancellationToken);
            }
            else
            {
                byte[] payloadData = receivedDataBuffer.Array.Where(b => b != 0).ToArray();

                
                string receiveString = System.Text.Encoding.UTF8.GetString(payloadData, 0, payloadData.Length);

                
                var newString = String.Format("Message: " + receiveString + "Time {0}", DateTime.Now.ToString());
                Byte[] bytes = System.Text.Encoding.UTF8.GetBytes(newString);

                
                await webSocket.SendAsync(new ArraySegment<byte>(bytes), WebSocketMessageType.Text, true, cancellationToken);
            }

        }
    }
}