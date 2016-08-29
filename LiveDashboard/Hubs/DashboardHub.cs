using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using System.Threading.Tasks;

namespace LiveDashboard.Hubs
{
    public class DashboardHub : Hub
    {
        public void Send(string invertal)
        {
            int pollingtime = Convert.ToInt32(invertal);
            if (pollingtime > 1)
            {
                PollingEngine pollingEngine = new PollingEngine(pollingtime);
                Task.Factory.StartNew(async () => await pollingEngine.OnBoradcaseMessages());
            }
        }
    }
}