; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "QPULSECAPTURE"
#define MyAppVersion "3.0.4.0"
#define MyAppURL "https://github.com/pi-null-mezon/QPULSECAPTURE.git"
#define MyAppExeName "QPULSECAPTURE.exe"

#define QtLibs "C:\Qt\5.5\msvc2013\bin"
#define OpencvLibs "C:\Programming\3rdParties\opencv300\build\x86\vc12\bin"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{98D47D33-A1F1-4EB5-8E58-EB2445FBE0E6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=C:\Programming\QPULSECAPTURE\LICENSE
InfoBeforeFile=C:\Programming\QPULSECAPTURE\README.md
InfoAfterFile=C:\Programming\QPULSECAPTURE\Resources\Docs\Show after installation.txt
OutputDir=C:\Programming\Releases
OutputBaseFilename={#MyAppName}_v{#MyAppVersion}
SetupIconFile=C:\Programming\QPULSECAPTURE\Resources\Docs\Setup.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "English"; MessagesFile: "compiler:Default.isl"
Name: "Russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Programming\Qpulsecapture\build\build-Sources-Desktop_Qt_5_5_1_MSVC2013_32bit-Release\release\QPULSECAPTURE.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\icudt54.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\icuin54.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\icuuc54.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\enginio.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\Qt5Concurrent.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\Qt5Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\Qt5Gui.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\Qt5Multimedia.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\Qt5MultimediaWidgets.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\Qt5Network.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\Qt5OpenGL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\Qt5Widgets.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\Qt5Xml.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QtLibs}\..\plugins\platforms\qminimal.dll"; DestDir: "{app}\platforms"; Flags: ignoreversion
Source: "{#QtLibs}\..\plugins\platforms\qoffscreen.dll"; DestDir: "{app}\platforms"; Flags: ignoreversion
Source: "{#QtLibs}\..\plugins\platforms\qwindows.dll"; DestDir: "{app}\platforms"; Flags: ignoreversion
Source: "{#QtLibs}\..\plugins\mediaservice\dsengine.dll"; DestDir: "{app}\mediaservice"; Flags: ignoreversion
Source: "{#QtLibs}\..\plugins\mediaservice\qtmedia_audioengine.dll"; DestDir: "{app}\mediaservice"; Flags: ignoreversion
Source: "{#QtLibs}\..\plugins\mediaservice\wmfengine.dll"; DestDir: "{app}\mediaservice"; Flags: ignoreversion
Source: "C:\Programming\QPULSECAPTURE\Resources\normal_heart_rate_at_rest.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Programming\3rdParties\WVCF_utility.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Programming\3rdParties\FFTW\fftw3-32\libfftw3-3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OpencvLibs}\opencv_core300.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OpencvLibs}\opencv_ffmpeg300.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OpencvLibs}\opencv_highgui300.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OpencvLibs}\opencv_imgproc300.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OpencvLibs}\opencv_objdetect300.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OpencvLibs}\opencv_videoio300.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OpencvLibs}\opencv_ml300.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OpencvLibs}\opencv_imgcodecs300.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OpencvLibs}\..\..\..\..\sources\data\haarcascades\haarcascade_frontalface_alt.xml"; DestDir: "{app}\haarcascades"; Flags: ignoreversion
Source: "{#OpencvLibs}\..\..\..\..\sources\data\lbpcascades\lbpcascade_frontalface.xml"; DestDir: "{app}\haarcascades"; Flags: ignoreversion
Source: "C:\Programming\QPULSECAPTURE\Resources\Docs\Translation_Rus.qm"; DestDir: "{app}"; Flags: ignoreversion; Languages: "Russian"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

