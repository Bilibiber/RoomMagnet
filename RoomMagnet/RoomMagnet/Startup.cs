using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.Owin;
using Owin;


[assembly: OwinStartup(typeof(RoomMagnet.Hubs.Startup))]

namespace RoomMagnet.Hubs
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=316888
            app.MapSignalR();
        }
       
    }
}
