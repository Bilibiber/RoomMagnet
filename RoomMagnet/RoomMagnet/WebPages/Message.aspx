<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="WebPages_Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
   <div>
            <span id="webSocketStatusSpan"></span>
            <br />
            <span id="webSocketReceiveDataSpan"></span>
            <br />
            <span>Please Enter Your Message here</span>
            <br />
            <input id="nameTextBox" type="text" value="" />
            <input type="button" value="Send data" onclick="SendData();" />
            <input type="button" value="Close WebSocket" onclick="CloseWebSocket();" />
        </div>

    <script type="text/javascript">

        var webSocketStatusSpan = document.getElementById("webSocketStatusSpan");
        var webSocketReceiveDataSpan = document.getElementById("webSocketReceiveDataSpan");
        var nameTextBox = document.getElementById("nameTextBox");

        var webSocket;

        //HTTP处理程序的地址
        //var handlerUrl = "ws://localhost:2659/SimpleWebSocket/WebSocketHandler.ashx";
        var handlerUrl = "ws://localhost:59379/WebSocketHandler.ashx";

        function SendData() {

            //初始化WebSocket
            InitWebSocket();

            //如果WebSocket打开，发送数据
            if (webSocket.OPEN && webSocket.readyState == 1)
                webSocket.send(nameTextBox.value);

            //如果WebSocket关闭，显示消息
            if (webSocket.readyState == 2 || webSocket.readyState == 3)
                webSocketStatusSpan.innerText = "Message Server is Closed，Can't Send Message";
        }

        function CloseWebSocket() {
            webSocket.close();
        }

        function InitWebSocket() {

            //如果WebSocket对象未初始化，我们将初始化它
            if (webSocket == undefined) {
                webSocket = new WebSocket(handlerUrl);
                //打开连接处理程序
                webSocket.onopen = function () {
                    webSocketStatusSpan.innerText = "Message Server is on.";
                    webSocket.send(nameTextBox.value);
                };

                //消息数据处理程序
                webSocket.onmessage = function (e) {
                    webSocketReceiveDataSpan.innerText = e.data;
                };

                //关闭事件处理程序
                webSocket.onclose = function () {
                    webSocketStatusSpan.innerText = "Message Server closed.";
                };

                //错误事件处理程序
                webSocket.onerror = function (e) {
                    webSocketStatusSpan.innerText = e.message;
                }
            }
        }
    </script>
    </asp:Content>
