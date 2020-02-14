; This script is best executed by the ]runmake user command

#define MyAppVersion "2.0.0.47"
#define MyAppName "KeyPress"
#define MyAppExeName "KeyPress.exe"
#define MyAppPublisher "APLTeam Ltd"
#define MyAppURL "https://github.com/aplteam/KeyPress"
#define MyBlank " "
#define TargetDir "Dist\"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
AppId={{97092AA5-183D-45D6-B334-7A6605DA30BD}

AppName="{#MyAppName}"
AppVersion={#MyAppVersion}
AppVerName={#MyAppName}{#MyBlank}{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={userdocs}\\MyUCMDs\\{#MyAppName}
DefaultGroupName={#MyAppPublisher}\{#MyAppName}
AllowNoIcons=yes
OutputDir={#TargetDir}
OutputBaseFilename="SetUp_{#MyAppName}_{#MyAppVersion}"
Compression=lzma
SolidCompression=yes
PrivilegesRequired=Lowest

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"; LicenseFile: "License";

[Registry]
; Globals

[Dirs]

[Files]
Source: "KeyPress.dyalog"; DestDir: "{app}\..";
Source: "{#TargetDir}\{#MyAppExeName}"; DestDir: "{app}"
Source: "LICENSE"; DestDir: "{app}"
; The Conga DLLs are only needed for a potential Ride (debugging)
; Source: "conga32ssl32.dll"; DestDir: "{app}";
; Source: "conga32_32.dll"; DestDir: "{app}";
; NOTE: Don't use "Flags: ignoreversion" on any shared system files


[Run]

[Tasks]

[Code]