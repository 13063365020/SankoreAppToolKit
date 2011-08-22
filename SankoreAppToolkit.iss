
; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{AEF8C20F-DCFE-4D06-962B-021525B552D8}
AppName=Sankore App Toolkit
AppVerName=Sankore App Toolkit
AppPublisher=Sankore

AppPublisherURL=http://dev.open-sankore.org
AppSupportURL=http://dev.open-sankore.org
AppUpdatesURL=http://dev.open-sankore.org

DefaultDirName={pf}\Sankore App Toolkit
DefaultGroupName=Sankore App Toolkit

OutputDir=.\install\win32\
OutputBaseFilename=Sankore App Toolkit
SetupIconFile=.\resources\win32\SankoreAppToolkit.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"
Name: "gr"; MessagesFile: "compiler:Languages\German.isl"
Name: "it"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "sp"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[InstallDelete]
;Type: filesandordirs ; Name: "{app}\doc"
;Type: files ; Name: "{app}\*.dll"

[Files]
Source: "..\Sankore-ThirdParty\microsoft\vcredist_x86.exe"; DestDir:"{tmp}"
Source: ".\build\win32\release\product\*.exe"; Excludes: "build,install"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\doc\*"; Excludes: "build,install";  DestDir: "{app}\doc"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\example.wgt\*"; Excludes: "build,install"; DestDir: "{app}\example.wgt"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\sample.wgt\*"; Excludes: "build,install"; DestDir: "{app}\sample.wgt"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\msg.config"; Excludes: "build,install"; DestDir: "{app}"; Flags: ignoreversion

;Qt base dll
Source: "..\Qt-sankore3.1\lib\QtScript4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Qt-sankore3.1\lib\QtGui4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Qt-sankore3.1\lib\QtXml4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Qt-sankore3.1\lib\QtCore4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Qt-sankore3.1\lib\QtWebKit4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Qt-sankore3.1\lib\phonon4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Qt-sankore3.1\lib\QtNetwork4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Qt-sankore3.1\lib\QtSvg4.dll"; DestDir: "{app}"; Flags: ignoreversion

;Qt plugins
Source: "..\Qt-sankore3.1\plugins\imageformats\qjpeg4.dll"; DestDir: "{app}\imageformats"; Flags: ignoreversion
Source: "..\Qt-sankore3.1\plugins\imageformats\qsvg4.dll"; DestDir: "{app}\imageformats"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\Sankore App Toolkit"; Filename: "{app}\SankoreAppToolkit.exe"
Name: "{group}\{cm:UninstallProgram,Sankore App Toolkit}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Sankore App Toolkit"; Filename: "{app}\SankoreAppToolkit.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Sankore App Toolkit"; Filename: "{app}\SankoreAppToolkit.exe"; Tasks: quicklaunchicon


[Registry]
Root: HKCR; Subkey: "SankoreFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\SankoreAppToolkit.exe,1"
Root: HKCR; Subkey: "SankoreFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\SankoreAppToolkit.exe"" ""%1"""

Root: HKLM; Subkey: "SOFTWARE\Sankore App Toolkit"; ValueType: string; ValueName: "Client application"; ValueData: "{app}\SankoreAppToolkit.exe"; Flags: uninsdeletevalue; Check: isProcessorNotX64
Root: HKLM; Subkey: "SOFTWARE\Sankore App Toolkit"; ValueType: dword; ValueName: "Transfer mode"; ValueData: "0"; Flags: uninsdeletevalue; Check: isProcessorNotX64
Root: HKLM; Subkey: "SOFTWARE\Sankore App Toolkit"; ValueType: dword; ValueName: "EMF: Hide page"; ValueData: "1"; Flags: uninsdeletevalue; Check: isProcessorNotX64
Root: HKLM; Subkey: "SOFTWARE\Sankore App Toolkit\Defaults"; ValueType: dword; ValueName: "PDF: Enabled"; ValueData: "1"; Flags: uninsdeletevalue; Check: isProcessorNotX64

Root: HKLM64; Subkey: "SOFTWARE\Sankore App Toolkit"; ValueType: string; ValueName: "Client application"; ValueData: "{app}\SankoreAppToolkit.exe"; Flags: uninsdeletevalue; Check: isProcessorX64
Root: HKLM64; Subkey: "SOFTWARE\Sankore App Toolkit"; ValueType: dword; ValueName: "Transfer mode"; ValueData: "0"; Flags: uninsdeletevalue; Check: isProcessorX64
Root: HKLM64; Subkey: "SOFTWARE\Sankore App Toolkit"; ValueType: dword; ValueName: "EMF: Hide page"; ValueData: "1"; Flags: uninsdeletevalue; Check: isProcessorX64
Root: HKLM64; Subkey: "SOFTWARE\Sankore App Toolkit\Defaults"; ValueType: dword; ValueName: "PDF: Enabled"; ValueData: "1"; Flags: uninsdeletevalue; Check: isProcessorX64

[Run]
Filename: "{tmp}\vcredist_x86.exe";WorkingDir:"{tmp}"
Filename: "{app}\SankoreAppToolkit.exe"; Description: "{cm:LaunchProgram,Sankore App Toolkit}"; Flags: nowait postinstall

[UninstallDelete]
; cleanup and delete whole installation directory
Name: {app}; Type: filesandordirs

[Code]
function isProcessorX64: Boolean;
begin
  Result := (ProcessorArchitecture = paX64);
end;

function isProcessorNotX64: Boolean;
begin
	Result := not isProcessorX64;
end;
