{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2001 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  26510: TCVcsUtils.pas }
{
    Rev 1.13    26/10/2008 11:58:08  Ewan
  Latest versions. 
}
{
    Rev 1.12    03/08/2008 22:16:56  Ewan
  Latest release (7.1.4.20). For Tiburon
}
{
    Rev 1.11    19/06/2008 08:18:02  Ewan
  New release. Seems to have fixed the 'Object not Found' issue.
}
{
    Rev 1.10    10/03/2008 10:18:30  Ewan
  New release - Hopefully last before major upgrade
}
{
    Rev 1.9    06/10/2004 21:28:28  Ewan
  Check in to update Linux
}
{
    Rev 1.9    06/10/2004 21:28:28  Ewan
  Latest Release
}
{
    Rev 1.9    06/10/2004 21:28:28  Ewan
  Latest Release
}
{
    Rev 1.9    06/10/2004 21:28:28  Ewan
  Latest Release
}
{
    Rev 1.9    06/10/2004 21:28:28  Ewan
  Check in to update Linux
}
{
    Rev 1.8    23/04/2004 23:11:42  Ewan    Version: 7.1.2.85
  Latest Changes and Server Test
}
{
    Rev 1.8    23/04/2004 23:11:42  Ewan    Version: 7.1.2.80
  New Installer, etc
}
{
    Rev 1.7    11/04/2004 21:38:22  Ewan
  FileListView Changes
}
{
    Rev 1.6    04/06/2003 15:46:04  Ewan    Version: 7.1.2.5
  June Release
}
{
    Rev 1.5    01/02/2003 14:50:24  Ewan
  Testing
}
{
{   Rev 1.4    02/10/2002 00:47:10  Ewan    Version: 7.1 Beta 3
{ Beta release 3
}
{
{   Rev 1.3    18/09/2002 22:59:30  Ewan    Version: 7.1 Beta 3
{ Prior to redeveloping Builder
}
{
{   Rev 1.2    10/02/2002 23:33:04  Ewan    Version: 7.0.2.14
}
{
{   Rev 1.2    11/02/2002 00:33:04  Ewan
{ Release 7.0.2.0
}
{
{   Rev 1.1    08/02/2002 23:52:12  Ewan
{ This should be a very long comment and shoud stretch over a few lines.
{ Maximum Width should be around 76 characters and, if there are enough
{ spaces, should form a neat block.
{
{ I will repeat myself here, just as a test to see if I can stretch things or
{ get it to be fooled. Never know, though...
}
{
{   Rev 1.0    06/02/2002 11:05:44  Ewan
{ Initial Revision
}
unit TCVcsUtils;

interface

uses
  {$IFDEF LINUX}
  Libc,
  {$ELSE}
  Windows,
  {$ENDIF}
  Classes,
  TCVcsTypes;

// Utility functions
function InstallDir: String;
function SettingsDir: String;
function AddBackSlash( const APath: String ): String;
function RemoveBackSlash( const APath: String ): String;

function InitializeCheckOutInfo: PCheckOutInfo;
procedure ReleaseCheckOutInfo( Info: PCheckOutInfo );
function InitializeCheckInInfo: PCheckInInfo;
procedure ReleaseCheckInInfo( Info: PCheckInInfo );
function IsReadOnly( const FileName: string ): Boolean;
procedure MakeReadOnly( const TheFileName: string );
procedure MakeWritable( const TheFileName: string );
function ListToPChar( Items: TStrings; const Chars: PAnsiChar; const BuffSize: Integer ): Integer;
procedure PCharToList( Chars: PAnsiChar; const Items: TStrings );
procedure SccListToPChar( Units: TStrings; const Chars: PAnsiChar );
procedure SccGetListFromChars( PUnits: PAnsiChar; const Units: TStrings );
function GetCommandlineParameter( Param: String ): String;
function HasCommandLineParameter( Param: String ): Boolean;
{$IFNDEF LINUX}
function WinExecAndWait( CmdLine, Params: PChar; CmdShow: Word; Parent: HWnd; Wait: Boolean ): LongInt;
{$ENDIF}

type
  TGPVTempStream = class( THandleStream )    // To handle very large files...
  private
    AHandle: Integer;
    FFileName: String;
    function GetUniqueFile: String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
  end;


var
  InstallPath: String = '';

implementation

uses
  SysUtils,
  {$IFDEF LINUX}
  {$ELSE}
{$WARN UNIT_PLATFORM OFF}
  FileCtrl,
{$WARN UNIT_PLATFORM ON}
  ShellApi,
  Registry,
  IniFiles,
  {$ENDIF}
  TCVcsConst;

// TGPVTempStream

constructor TGPVTempStream.Create;
begin
  FFileName := GetUniqueFile;
  AHandle := FileCreate( FFileName );
  if AHandle < 0 then
    raise EFCreateError.CreateFmt( 'Could not create temporary file ''%s''', [ FFileName ] )
  else
    inherited Create( AHandle );
end;

procedure TGPVTempStream.Clear;
begin
  SetSize( 0 );
end;

function TGPVTempStream.GetUniqueFile: String;
{$IFNDEF LINUX}
var
  TempFileName: array[0..255] of Char;
  TempPath: array[ 0..255 ] of Char;
{$ENDIF}
begin
  {$IFDEF LINUX}
  Result := tempnam( '/tmp', 'TTS' );
  {$ELSE}
  GetTempPath( 255, TempPath );
  GetTempFileName( TempPath, 'TTS', 0, TempFileName );
  Result := StrPas( TempFileName );
  {$ENDIF}
end;

destructor TGPVTempStream.Destroy;
begin
  if AHandle >= 0 then
    FileClose( AHandle );
  DeleteFile( FFileName );
  inherited Destroy;
end;

{ functions }

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

function CalcListSize( Items: TStrings ): Integer;
begin
  Result := Length( StringReplace( Items.Text, #13#10, #13, [ rfReplaceAll ] ) ) + 1;
end;

procedure SccListToPChar( Units: TStrings; const Chars: PAnsiChar );
var
  i, j: LongInt;
  Counter: LongInt;
begin
  StrCopy( Chars, '' );
  Counter := 0;
  for i := 0 to Units.Count - 1 do
  begin
    for j := 1 to Length( Units[ i ] ) do
    begin
      Chars[ Counter ] := AnsiChar(Units[ i ][ j ]);
      Inc( Counter );
    end;
    Chars[ Counter ] := #13;
    Inc( Counter );
  end;
  Chars[ Counter ] := #0;
end;

// Hack
procedure AnsiFromChar(pIn: PAnsiChar; const pOut: PAnsiChar);
var
  i, j, Len: Integer;
  pTemp: PByteArray;
  ZeroCount: Integer;
begin
  if (StrLen(pIn) > 1) and (pIn[1] = #0) then
  begin
    for i := 0 to (StrLen(pIn) * 2) - 2 do
      pOut[i] := #0;
    pTemp := PByteArray(pIn);
    Len := StrLen(pIn) * 2;
    j := 0;
    ZeroCount := 0;
    for i := 0 to Len - 2 do
    begin
      if (pTemp[i] <> 0) then
      begin
        pOut[j] := AnsiChar(pTemp[i]);
        j := j + 1;
        ZeroCount := 0;
      end
      else
        ZeroCount := ZeroCount + 1;
      if ZeroCount > 1 then
        Break;
    end;
    pOut[j] := #0;
  end
  else
    StrCopy(pOut, PAnsiChar(pIn));
end;

procedure SccGetListFromChars( PUnits: PAnsiChar; const Units: TStrings );
var
  Str: String;
  i: LongInt;
  pOut: PAnsiChar;
begin
  Units.Clear;
  Str := '';
  GetMem(pOut, StrLen(PUnits) * 2);
  try
    AnsiFromChar(PUnits, pOut);
    for i := 0 to StrLen( pOut ) do
    begin
      if POut[ i ] = #13 then
      begin
        Units.Add( Str );
        Str := '';
      end
      else
      begin
        if pOut[ i ] = #0 then
        begin
          if Str <> '' then
            Units.Add( Str );
          Break;
        end
        else
        begin
          Str := Str + Char(pOut[ i ]);
        end;
      end
    end;
  finally
    FreeMem(pOut);
  end;
end;

// Converts the passed TStrings into a PAnsiChar
// Returns 0 if successful, else returns the required memory. Chars can be nil
function ListToPChar( Items: TStrings; const Chars: PAnsiChar; const BuffSize: Integer ): Integer;
begin
  Result := CalcListSize( Items );
  if Assigned( Chars ) and ( BuffSize <= Result ) then
  begin
    FillChar( Chars^, BuffSize, 0 );
    StrCopy( Chars, PAnsiChar( AnsiString(StringReplace( Items.Text, #13#10, #13, [ rfReplaceAll ] )) ) );
    Result := 0;
  end;
end;

// Fills Items with the strings contained in Chars
procedure PCharToList( Chars: PAnsiChar; const Items: TStrings );
begin
  Items.Clear;
  Items.Text := String( AnsiString(Chars));
end;

{$IFNDEF LINUX}
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
{$ENDIF}

const
  {$IFDEF LINUX}
  Backslash = '/';
  {$ELSE}
  Backslash = '\';
  {$ENDIF}

function AddBackSlash( const APath: String ): String;
begin
  if Copy( APath, Length( APath ), 1 ) = Backslash then
    Result := APath
  else
    Result := APath + Backslash;
end;

function RemoveBackSlash( const APath: String ): String;
begin
  if Copy( APath, Length( APath ), 1 ) = Backslash then
    Result := Copy( APath, 1, Length( APath ) - 1 )
  else
    Result := APath;
end;

{$IFDEF LINUX}
function InstallDir: String;
var
  pFileName: array[ 0..1024 ] of Char;
begin
  if InstallPath <> '' then
    Result := AddBackslash( InstallPath )
  else
  begin
    GetModuleFileName( hInstance, pFileName, 1024 );
    SetLength( Result, StrLen( pFileName ) );
    Result := String( pFileName );
    Result := AddBackslash( ExtractFilePath( Result ) );
  end;
end;
{$ELSE}
function InstallDir: String;
var
  pFileName: array[ 0..1024 ] of Char;
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
  finally
    Free;
  end;
  if ( Result = '' ) or ( not DirectoryExists( Result ) ) then
  begin
    GetModuleFileName( hInstance, pFileName, 1024 );
    SetLength( Result, StrLen( pFileName ) );
    Result := String( pFileName );
    Result := AddBackslash( ExtractFilePath( Result ) );
    // If nothing is found, set the default...
    with TRegistry.Create do
    try
      if OpenKey( '\Software\Qsc\Team Coherence', False ) then
      try
        WriteString( 'InstallDir', Result );
      finally
        CloseKey;
      end;
    finally
      Free;
    end;
  end;
end;
{$ENDIF}

{$IFDEF LINUX}
function ExpandEnv( Str: String ): String;
var
  Env, Val: String;
begin
  Result := Str;
  while ( Pos( '%', Result ) > 0 ) do
  begin
    Env := Copy( Result, Pos( '%', Result ) + 1, Length( Result ) );
    Env := Copy( Env, 1, Pos( '%', Env ) - 1 );
    Val := GetEnvironmentVariable( Env );
    if Val <> '' then
      Result := StringReplace( Result, '%' + Env + '%', Val, [ rfIgnoreCase ] )
    else
      Break;
  end;
end;
{$ELSE}
function ExpandEnv( Str: String ): String;
var
  Size, Reqd: Integer;
  pRes: PChar;
begin
  Result := Str;
  Size := 512;
  if Pos( '%', Str ) > 0 then
  begin
    GetMem( pRes, Size );
    try
      Reqd := ExpandEnvironmentStrings( PChar( Str ), pRes, Size );
      if Reqd > Size then
      begin
        FreeMem( pRes, Size );
        Size := Reqd;
        GetMem( pRes, Size );
        ExpandEnvironmentStrings( PChar( Str ), pRes, Size );
      end;
      SetLength( Result, StrLen( pRes ) );
      Result := String( pRes );
    finally
      FreeMem( pRes, Size );
    end;
  end;
end;
{$ENDIF}

function SettingsDir: String;
var
  WebAccess: Boolean;
begin
  Result := InstallDir;
  {$IFNDEF LINUX}
  WebAccess := False;
  // Check for TRKMain.ini in the InstallDir
  if FileExists( AddBackslash( InstallDir ) + 'TRKMain.ini' ) then
  begin
    with TIniFile.Create( AddBackslash( InstallDir ) + 'TRKMain.ini' ) do
    try
      // If WebAccess is true, then all settings are stored in the InstallDir
      WebAccess := ReadBool( 'ServerSide', 'WebAccess', False );
    finally
      Free;
    end;
  end;
  if not WebAccess then
  begin
    Result := AddBackslash( ExpandEnv( '%AppData%' ) ) + 'TeamCoherence\';
    try
      if not DirectoryExists( Result ) then
        ForceDirectories( Result );
      if not DirectoryExists( Result ) then
      begin
        Result := AddBackslash( ExpandEnv( '%UserProfile%' ) ) + 'Application Data\TeamCoherence\';
        try
          if not DirectoryExists( Result ) then
            ForceDirectories( Result );
          if not DirectoryExists( Result ) then
            Result := InstallDir;
        except
          Result := InstallDir;
        end;
      end;
    except
      Result := InstallDir;
    end;
  end;
  {$ENDIF}
end;

function InitializeCheckOutInfo: PCheckOutInfo;
begin
  New( Result );
  GetMem( Result.Comments, 65536 );
  StrCopy( Result.Comments, '' );
  GetMem( Result.Extra, 65536 );
  StrCopy( Result.Extra, '' );
  GetMem( Result.Revision, 255 );
  StrCopy( Result.Revision, '' );
  GetMem( Result.LocalPath, 512 );
  StrCopy( Result.LocalPath, '' );
  Result.VersionID := 0;
  Result.AssignVersionID := 0;
  Result.Overwrite := False;
  Result.Flags := 0;
end;

procedure ReleaseCheckOutInfo( Info: PCheckOutInfo );
begin
  if Assigned( Info ) and ( Integer( Info ) > $400 ) then
  begin
    FreeMem( Info.Comments );
    FreeMem( Info.Extra );
    FreeMem( Info.Revision, 255 );
    FreeMem( Info.LocalPath, 512 );
    Dispose( Info );
  end;
end;

function InitializeCheckInInfo: PCheckInInfo;
begin
  New( Result );
  GetMem( Result.Comments, 65536 );
  StrCopy( Result.Comments, '' );
  GetMem( Result.Extra, 65536 );
  StrCopy( Result.Extra, '' );
  Result.VersionID := 0;
  Result.Flags := ci_MakeWorkfileReadonly or ci_CheckInIfUnchanged or ci_UseLockComments;
end;

procedure ReleaseCheckInInfo( Info: PCheckInInfo );
begin
  if Assigned( Info ) and ( Integer( Info ) > $400 ) then
  begin
    FreeMem( Info.Comments );
    FreeMem( Info.Extra );
    Dispose( Info );
  end;
end;

function IsReadOnly( const FileName: string ): Boolean;
{$IFDEF LINUX}
var
  StatBuffer: TStatBuf;
{$ENDIF}
begin
  if FileExists( FileName ) then
  begin
    {$IFDEF LINUX}
    if ( stat( PAnsiChar( FileName ), StatBuffer ) = 0 ) then
    begin
      if ( StatBuffer.st_mode and S_IWRITE ) = 0 then
        Result := True
      else
        Result := False;
    end
    else
      Result := False;
    {$ELSE}
    {$WARN SYMBOL_PLATFORM OFF}
    Result := ( ( FileGetAttr( FileName ) and faReadOnly ) > 0 )
    {$WARN SYMBOL_PLATFORM ON}
    {$ENDIF}
  end
  else
    Result := False;
end;

procedure MakeReadOnly( const TheFileName: string );
{$IFDEF LINUX}
var
  aMode: Integer;
{$ENDIF}
begin
  if FileExists( TheFileName ) then
  begin
    {$IFDEF LINUX}
    aMode := S_IREAD;
    chmod( PAnsiChar( TheFileName ), aMode );
    {$ELSE}
    {$WARN SYMBOL_PLATFORM OFF}
    FileSetAttr( TheFileName, FileGetAttr( TheFileName ) or faReadOnly );
    {$WARN SYMBOL_PLATFORM ON}
    {$ENDIF}
  end;
end;

procedure MakeWritable( const TheFileName: string );
{$IFDEF LINUX}
var
  aMode: Integer;
{$ENDIF}
begin
  if FileExists( TheFileName ) then
  begin
    {$IFDEF LINUX}
    aMode := S_IREAD or S_IWRITE;
    chmod( PAnsiChar( TheFileName ), aMode );
    {$ELSE}
    {$WARN SYMBOL_PLATFORM OFF}
    FileSetAttr( TheFileName, FileGetAttr( TheFileName ) and not faReadOnly );
    {$WARN SYMBOL_PLATFORM ON}
    {$ENDIF}
  end;
end;

end.
