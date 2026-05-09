![RoundedTB](https://cdn.discordapp.com/attachments/272509873479221249/891555515799318568/unknown.png)

# RoundedTB
#### Add margins, rounded corners and segments to your taskbars!

![image](https://user-images.githubusercontent.com/31840547/134795141-76349eaf-12da-40f8-b2a0-d7b7c268d152.png)

## Download

Get the latest release from the [Releases page](https://github.com/SSShogunn/RoundedTB/releases).

> No installation required — just run `RoundedTB.exe`. The app lives in your system tray.

## Requirements

- Windows 11 (22H2 or newer, including 24H2 and 25H2)
- .NET 9 runtime — download from [dot.net](https://dotnet.microsoft.com/en-us/download/dotnet/9.0) if the app prompts for it

> Windows 10 may work but is not actively tested or supported.

## Features

- **Simple mode** — rounded corners and margins on the whole taskbar
- **Dynamic mode** — taskbar auto-resizes to fit only the open apps (like macOS Dock)
- **Independent margins** — set different margins per side; use negative values to attach the taskbar to a screen edge
- **Show/hide system tray** — toggle with `Win+F2`
- **Fill on maximise** — taskbar expands to full width when a window is maximised
- **Multi-monitor** — works on all connected displays
- **Auto-hide** — fade the taskbar in/out on hover (experimental)
- **TranslucentTB compatibility** — experimental, requires TranslucentTB 2021.5

## Usage

1. Run `RoundedTB.exe` — it appears in the system tray
2. Click the tray icon to open settings
3. Adjust corner radius and margins to taste
4. Enable **Dynamic mode** for the Dock-style experience
5. Right-click the tray icon to access startup, reset, and exit options

## Known Issues

- Auto-hide is experimental and may flicker, especially with Dynamic mode or TranslucentTB compatibility enabled
- Rounded corners are not antialiased — this is a Windows limitation
- Dynamic mode won't hide the left side of the taskbar on first launch if taskbar alignment has never been changed — workaround: switch alignment to Left and back to Center
- Dynamic mode may occasionally get stuck (too large / too small) — fix by moving a window to another monitor or briefly switching taskbar alignment
- Dynamic mode is only supported on horizontal taskbars (top or bottom)
- If the taskbar gets stuck after closing RoundedTB, restart Explorer from Task Manager

## Building from Source

```powershell
# Debug
dotnet build RoundedTB/RoundedTB.csproj

# Release
dotnet build RoundedTB/RoundedTB.csproj -c Release
```

Requires [.NET 9 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/9.0).

## Credits

Originally created by [torchgm](https://github.com/RoundedTB/RoundedTB).  
Updated for Windows 11 25H2 and .NET 9 by [SSShogunn](https://github.com/SSShogunn).
