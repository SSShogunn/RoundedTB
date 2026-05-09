![RoundedTB](https://cdn.discordapp.com/attachments/272509873479221249/891555515799318568/unknown.png)

# RoundedTB
#### Add margins, rounded corners and segments to your taskbars!

![image](https://user-images.githubusercontent.com/31840547/134795141-76349eaf-12da-40f8-b2a0-d7b7c268d152.png)

## Download

Get the latest installer from the [Releases page](https://github.com/SSShogunn/RoundedTB/releases).

Download `RoundedTB-vX.X.X-Setup.exe`, run it, and follow the wizard.

## Requirements

- Windows 11 22H2 or newer (including 24H2 and 25H2)
- No separate runtime needed — everything is bundled in the installer

## Installation

1. Download `RoundedTB-vX.X.X-Setup.exe` from the [Releases page](https://github.com/SSShogunn/RoundedTB/releases)
2. Run the installer — it will request admin access to install to `Program Files`
3. Optionally tick **"Start RoundedTB automatically when Windows starts"** during setup
4. Click **Launch RoundedTB** at the end of the wizard

RoundedTB runs in the **system tray** — look for its icon in the bottom-right notification area. Click it to open the settings window.

## Uninstalling

Open Windows **Settings → Apps → Installed apps**, search for RoundedTB, and click **Uninstall**.  
This will stop any running instance and remove all installed files.

## Features

- **Simple mode** — rounded corners and margins on the whole taskbar
- **Dynamic mode** — taskbar auto-resizes to fit only open apps (like macOS Dock)
- **Independent margins** — different margin per side; negative values attach the taskbar to a screen edge
- **Show/hide system tray** — toggle with `Win+F2`
- **Fill on maximise** — taskbar expands to full width when a window is maximised
- **Multi-monitor** — works across all displays
- **Auto-hide** — fade taskbar in/out on hover (experimental)

## Known Issues

- Auto-hide is experimental and may flicker, especially combined with Dynamic mode
- Rounded corners are not antialiased — this is a Windows limitation
- Dynamic mode won't hide the left side of the taskbar on first launch if taskbar alignment has never been changed — fix: switch alignment to Left and back to Center
- Dynamic mode may occasionally get stuck — fix: move a window to another monitor or briefly switch taskbar alignment
- Dynamic mode only works on horizontal taskbars (top or bottom of screen)
- If the taskbar looks wrong after closing RoundedTB, restart Explorer from Task Manager

## Building from Source

Requires [.NET 9 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/9.0).

```powershell
# Debug
dotnet build RoundedTB/RoundedTB.csproj

# Release
dotnet build RoundedTB/RoundedTB.csproj -c Release
```

## Credits

Originally created by [torchgm](https://github.com/RoundedTB/RoundedTB).  
Updated for Windows 11 25H2 compatibility and .NET 9 by [SSShogunn](https://github.com/SSShogunn).
