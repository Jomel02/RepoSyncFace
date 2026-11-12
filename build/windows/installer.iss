; Inno Setup 6.3+ script for SynchFace.
; Packages a release folder made by:
;   WindowsBuilder.py --build-type dfl-windows --release-dir <folder> --backend <cuda|directml> --release
;
; Compile (from this folder) with:
;   ISCC.exe /DBackend=NVIDIA    /DSourceDir="<path to SynchFace_NVIDIA_Release>"    installer.iss
;   ISCC.exe /DBackend=DirectX12 /DSourceDir="<path to SynchFace_DirectX12_Release>" installer.iss
; Optional: /DAppVersion=1.0.1  /DOutputDir="<folder>"  /DSplit (split into Setup.exe + .bin files)
; Pass SourceDir as a full path without "..": some onnx test files are nested deeply
; and a longer path goes over Windows' 260 character limit.

#ifndef Backend
  #define Backend "DirectX12"
#endif
#ifndef SourceDir
  #error Pass /DSourceDir="<release folder>" to ISCC.exe
#endif
#ifndef AppVersion
  #define AppVersion "1.0.0"
#endif
#ifndef OutputDir
  ; Outside the repo: WindowsBuilder.py copies the whole repo into each build.
  #define OutputDir "..\..\..\Installers"
#endif

#if !FileExists(AddBackslash(SourceDir) + "_internal\SynchFace\release_build.txt")
  #error SourceDir is not a --release build (it may contain non-commercial InsightFace models)
#endif

#define AppName "SynchFace"
#define SourceUrl "https://github.com/Jomel02/DeepFaceLive"

[Setup]
; Both backends share one AppId: installing one replaces the other.
AppId={{D0CB9B9F-5F68-457D-8175-007B59A61705}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion} ({#Backend})
AppPublisherURL={#SourceUrl}
AppSupportURL={#SourceUrl}
AppComments=Modified version of DeepFaceLive by iperov. GNU GPL v3.
; Per-user install to a writable folder: the app writes to {app}\userdata.
PrivilegesRequired=lowest
DefaultDirName={localappdata}\Programs\{#AppName}
DefaultGroupName={#AppName}
DisableProgramGroupPage=yes
LicenseFile=..\..\LICENSE
SetupIconFile=app_icon.ico
UninstallDisplayIcon={app}\app_icon.ico
UninstallDisplayName={#AppName} ({#Backend})
OutputDir={#OutputDir}
OutputBaseFilename={#AppName}_{#Backend}_Setup
Compression=lzma2/max
SolidCompression=yes
LZMANumBlockThreads=4
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
WizardStyle=modern
#ifdef Split
DiskSpanning=yes
DiskSliceSize=max
#endif

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "app_icon.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#AppName}"; Filename: "{app}\SynchFace.bat"; WorkingDir: "{app}"; IconFilename: "{app}\app_icon.ico"
Name: "{autoprograms}\Uninstall {#AppName}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#AppName}"; Filename: "{app}\SynchFace.bat"; WorkingDir: "{app}"; IconFilename: "{app}\app_icon.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\SynchFace.bat"; WorkingDir: "{app}"; Description: "{cm:LaunchProgram,{#AppName}}"; Flags: nowait postinstall skipifsilent shellexec

[InstallDelete]
; Clean program files from a previous install (e.g. the other backend), keep userdata.
Type: filesandordirs; Name: "{app}\_internal"

[UninstallDelete]
; Remove files the app creates at runtime inside the program folder (caches, temp).
; {app}\userdata (the user's own models, videos and settings) is kept.
Type: filesandordirs; Name: "{app}\_internal"

[Code]
// Some bundled Python files are nested ~160 characters deep; Windows limits paths
// to 260 characters, so the install folder itself must stay short.
const
  MaxDirLength = 100;

function DirTooLongMessage(): String;
begin
  Result := 'The installation folder path is too long (' + IntToStr(Length(WizardDirValue)) +
            ' characters). Please choose a folder of ' + IntToStr(MaxDirLength) + ' characters or less.';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if (CurPageID = wpSelectDir) and (Length(WizardDirValue) > MaxDirLength) then
  begin
    MsgBox(DirTooLongMessage(), mbError, MB_OK);
    Result := False;
  end;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  Result := '';
  if Length(WizardDirValue) > MaxDirLength then
    Result := DirTooLongMessage();
end;
