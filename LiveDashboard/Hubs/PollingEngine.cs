using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Web.Hosting;
using LiveDashboard.Hubs;

namespace LiveDashboard.Hubs
{
    public class PollingEngine
    {
        private IHubContext _hubs;
        private readonly int _pollIntervalMillis;
        static Random _rand;

        public PollingEngine(int pollIntervalMillis)
        {
            //HostingEnvironment.RegisterObject(this);
            _hubs = GlobalHost.ConnectionManager.GetHubContext<DashboardHub>();
            _pollIntervalMillis = pollIntervalMillis;
            _rand = new Random();
        }

        public async Task OnBoradcaseMessages()
        {
            //Monitor for infinity!
            while (true)
            {
                await Task.Delay(_pollIntervalMillis);
                _hubs.Clients.All.broadcastMessage(_rand.Next().ToString());
            }
        }

        public void Stop(bool immediate)
        {
            //HostingEnvironment.UnregisterObject(this);
        }
    }
}