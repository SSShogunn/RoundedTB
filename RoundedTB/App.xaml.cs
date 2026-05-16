using System;
using System.Windows;

namespace RoundedTB
{
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);
            DispatcherUnhandledException += (s, ex) =>
            {
                MessageBox.Show(ex.Exception.ToString(), "RoundedTB — Startup Error", MessageBoxButton.OK, MessageBoxImage.Error);
                ex.Handled = true;
                Shutdown(1);
            };
            WPFUI.Theme.Watcher.Start();
        }
    }
}
