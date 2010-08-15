{ $HDR$}
{ ******************************************************************** }
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{ ******************************************************************** }
{ $Log:  209012: TCTrkUtils.pas 
{
{   Rev 1.0    18/10/2007 10:38:30 AM  CompileSystem    Version: 1.1.000
{ 1.1.0
}
{
{   Rev 1.0    3/8/2006 6:17:20 PM  Michael
{ Internal Track  utility
}
{
    Rev 1.3    05/11/2004 17:31:38  Ewan
  Just in case...
}
{
    Rev 1.3    05/11/2004 17:31:38  Ewan
  Latest Release
}
{
    Rev 1.3    05/11/2004 17:31:38  Ewan
  Latest Release
}
{
    Rev 1.3    05/11/2004 17:31:38  Ewan
  Just in case...
}
{
    Rev 1.2    07/02/2004 15:06:44  Ewan
  Latest changes
}
{
    Rev 1.1    07/02/2003 00:04:50  Ewan    Version: 7.1.1.35
  Released Version
}
unit TCTrkUtils;

interface

uses
  Windows,
  Classes,
  TCTrkTypes;

// Utility functions
function InstallDir: String;
function AddBackSlash( const APath: String ): String;
function RemoveBackSlash( const APath: String ): String;
function WinExecAndWait( CmdLine, Params: PChar; CmdShow: Word; Parent: HWnd; Wait: Boolean ): LongInt;
function GetCommandlineParameter( Param: String ): String;
function HasCommandLineParameter( Param: String ): Boolean;
function LocalDateToUTCDate( Date: TDateTime ): TDateTime;
function UTCDateToLocalDate( Date: TDateTime ): TDateTime;
function IssueTypeAsStr( TypeID: Integer ): String;

implementation

uses
  SysUtils,
(*  FileCtrl,*)
  ShellApi,
  TCTrkConst,
  Registry,
  IniFiles;

function IssueTypeAsStr( TypeID: Integer ): String;
begin
  case TypeID of
    it_Bug: Result := 'Bug Report';
    it_Todo: Result := 'Feature Request';
    it_Enhancement: Result := 'Enhancement';
    it_Task: Result := 'Task';
    it_WorkRequest: Result := 'Work Request';
    it_InfoRequest: Result := 'Information Request';
    it_ChangeRequest: Result := 'Change Request';
    it_Requirement: Result := 'Requirement';
    it_Idea: Result := 'New Idea';
  else
    Result := '<Unknown>';
  end;
end;

function LocalDateToUTCDate( Date: TDateTime ): TDateTime;
var
  DosDate: Integer;
  LocalTime: TFileTime;
  SystemTime: TFileTime;
begin
  if Date = 0 then
  begin
    Result := 0;
    Exit;
  end;
  // Get into TFileTime format
  DosDate := DateTimeToFileDate(Date);
  DosDateTimeToFileTime(LongRec(DosDate).Hi, LongRec(DosDate).Lo,
    LocalTime);
  // now convert to UTC
  LocalFileTimeToFileTime(LocalTime, SystemTime);
  // now convert back to TDateTime
  FileTimeToDosDateTime( SystemTime, LongRec(DosDate).Hi,
    LongRec(DosDate).Lo);
  Result := FileDateToDateTime(DosDate);
end;

function UTCDateToLocalDate( Date: TDateTime ): TDateTime;
var
  DosDate: Integer;
  SystemTime: TFileTime;
  LocalTime: TFileTime;
begin
  if Date = 0 then
  begin
    Result := 0;
    Exit;
  end;
  // get the date into the system format
  DosDate := DateTimeToFileDate(Date);
  DosDateTimeToFileTime(LongRec(DosDate).Hi, LongRec(DosDate).Lo,
    SystemTime);
  // convert to local time
  FileTimeToLocalFileTime(SystemTime, LocalTime);
  // convert back into TDateTime format
  FileTimeToDosDateTime(LocalTime, LongRec(DosDate).Hi,
    LongRec(DosDate).Lo);
  Result := FileDateToDateTime(DosDate);
end;

function HasCommandLineParameter( Param: String ): Boolean;
var
  i: Integer;
  Cmp, Str: String;
begin
  Result := False;
  Cmp := UpperCase( Param );
  for i := 1 to ParamCount do
  begin
    Str := UpperCase( ParamStr( i ) );
    if Pos( Cmp, Str ) = 1 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function GetCommandlineParameter( Param: String ): String;
var
  i: Integer;
  Cmp, Str: String;
begin
  Result := '';
  Cmp := UpperCase( Param );
  for i := 1 to ParamCount do
  begin
    Str := UpperCase( ParamStr( i ) );
    if Pos( Cmp, Str ) = 1 then
    begin
      Result := Copy( ParamStr( i ), Length( Cmp ) + 1, Length( ParamStr( i ) ) );
      Break;
    end;
  end;
end;

function WinExecAndWait( CmdLine, Params: PChar; CmdShow: Word; Parent: HWnd; Wait: Boolean ): LongInt;
var
  Ok: Boolean;
  Info: TShellExecuteInfo;
  Msg: TMsg;
  APath: String;
begin
  APath := ExtractFilePath( String( CmdLine ) );
  if DirectoryExists( APath ) then
    APath := Copy( APath, 1, Length( APath ) - 1 )
  else
    APath := '';
  FillChar(Info, SizeOf(Info), Chr(0));
  Info.cbSize := SizeOf(Info);
  Info.fMask := SEE_MASK_NOCLOSEPROCESS;
  Info.lpVerb := 'Open';
  Info.lpFile := CmdLine;
  Info.lpParameters := Params;
  Info.lpDirectory := PChar( APath );
  Info.nShow := CmdShow;
  Ok := Boolean(ShellExecuteEx(@Info));
  if Ok and Wait then
  begin
    // Set focus on the window
    while WaitForSingleObject(Info.hProcess, 100) = WAIT_TIMEOUT do
      PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE);
    Ok := GetExitCodeProcess(Info.hProcess, DWord(Result));
  end;
  if not Ok then
     Result := -1;
end;

function AddBackSlash( const APath: String ): String;
begin
  if Copy( APath, Length( APath ), 1 ) = '\' then
    Result := APath
  else
    Result := APath + '\';
end;

function RemoveBackSlash( const APath: String ): String;
begin
  if Copy( APath, Length( APath ), 1 ) = '\' then
    Result := Copy( APath, 1, Length( APath ) - 1 )
  else
    Result := APath;
end;

function InstallDir: String;
var
  pFileName: array[ 0..1024 ] of Char;
  IniFile: String;
begin
  Result := '';
  with TRegistry.Create do
  try
    if OpenKey( '\Software\Qsc\Team Coherence', False ) then
    try
      Result := ReadString( 'InstallDir' );
    finally
      CloseKey;
    end;
    if Result = '' then
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKey( '\Software\Qsc\Team Coherence', False ) then
      try
        Result := ReadString( 'InstallDir' );
      finally
        CloseKey;
      end;
    end;
  finally
    Free;
  end;
  if ( Result = '' ) or ( not DirectoryExists( Result ) ) then
  begin
    // Check the local Ini file...
    GetModuleFileName( hInstance, pFileName, 1024 );
    SetLength( IniFile, StrLen( pFileName ) );
    IniFile := ChangeFileExt( String( pFileName ), '.ini' );
    if FileExists( IniFile ) then
    begin
      with TIniFile.Create( IniFile ) do
      try
        Result := ReadString( 'Client', 'InstallDir', '' );
      finally
        Free;
      end;
    end;
  end;
  if ( Result = '' ) or ( not DirectoryExists( Result ) ) then
  begin
    GetModuleFileName( hInstance, pFileName, 1024 );
    SetLength( Result, StrLen( pFileName ) );
    Result := String( pFileName );
    Result := AddBackslash( ExtractFilePath( Result ) );
  end;
end;

end.
