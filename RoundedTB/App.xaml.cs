using System.Windows;

namespace RoundedTB
{
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);
            WPFUI.Theme.Watcher.Start();
        }
    }
}
