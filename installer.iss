#define AppName "RoundedTB"
#define AppVersion "1.0.1"
#define AppPublisher "SSShogunn"
#define AppURL "https://github.com/SSShogunn/RoundedTB"
#define AppExeName "RoundedTB.exe"

[Setup]
AppId={{F3A2C1B4-8E6D-4F2A-9C5B-1D7E3F4A2B8C}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}/issues
AppUpdatesURL={#AppURL}/releases
DefaultDirName={autopf}\{#AppName}
PrivilegesRequired=admin
DisableProgramGroupPage=yes
DisableReadyPage=yes
UsePreviousTasks=yes
OutputDir=installer-output
OutputBaseFilename=RoundedTB-{#AppVersion}-Setup
SetupIconFile=RoundedTB\RoundedTB.ico
UninstallDisplayIcon={app}\{#AppExeName}
UninstallDisplayName={#AppName}
Compression=lzma
SolidCompression=yes
WizardStyle=modern
MinVersion=10.0.22621

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional icons:"; Flags: unchecked
Name: "startup"; Description: "Start {#AppName} automatically when &Windows starts"; GroupDescription: "Startup:"

[Files]
Source: "publish\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\{#AppName}"; Filename: "{app}\{#AppExeName}"
Name: "{autodesktop}\{#AppName}";  Filename: "{app}\{#AppExeName}"; Tasks: desktopicon

[Registry]
; Per-user startup so each user controls their own taskbar experience
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; \
  ValueType: string; ValueName: "{#AppName}"; \
  ValueData: """{app}\{#AppExeName}"""; \
  Flags: uninsdeletevalue; Tasks: startup

[Run]
Filename: "{app}\{#AppExeName}"; \
  Description: "Launch {#AppName}"; \
  Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "taskkill.exe"; Parameters: "/F /IM {#AppExeName}"; \
  Flags: runhidden; RunOnceId: "KillApp"

[Code]
function NetDesktop9Installed(): Boolean;
var
  FindRec: TFindRec;
begin
  Result := False;
  if FindFirst(ExpandConstant('{commonpf64}') + '\dotnet\shared\Microsoft.WindowsDesktop.App\9.*', FindRec) then
  begin
    Result := True;
    FindClose(FindRec);
  end;
end;

function InitializeSetup(): Boolean;
begin
  Result := True;
  if not NetDesktop9Installed() then
  begin
    MsgBox(
      '.NET 9 Windows Desktop Runtime is required to run RoundedTB.' + #13#10#13#10 +
      'Please install it from:' + #13#10 +
      'https://dotnet.microsoft.com/en-us/download/dotnet/9.0' + #13#10#13#10 +
      'Download the ".NET Desktop Runtime 9.x" x64 installer, run it, then re-run this setup.',
      mbError, MB_OK);
    Result := False;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
begin
  if CurStep = ssInstall then
    Exec(ExpandConstant('{sys}\taskkill.exe'), '/F /IM {#AppExeName}', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
end;
