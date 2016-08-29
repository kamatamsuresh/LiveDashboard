using LiveDashboard.Hubs;
using Microsoft.Owin;
using Owin;
using System.Threading.Tasks;
[assembly: OwinStartup(typeof(LiveDashboard.Startup))]

namespace LiveDashboard
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // Any connection or hub wire up and configuration should go here
            app.MapSignalR();

            //PollingEngine pollingEngine = new PollingEngine(800);
            //Task.Factory.StartNew(async () => await pollingEngine.OnBoradcaseMessages());
        }
    }
}