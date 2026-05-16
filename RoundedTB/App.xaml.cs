using System.Diagnostics;
using System.Windows;

namespace RoundedTB
{
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
#if DEBUG
            Trace.Listeners.Add(new ConsoleTraceListener());
#endif
            base.OnStartup(e);
            WPFUI.Theme.Watcher.Start();
        }
    }
}
