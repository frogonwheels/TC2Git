{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2001 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  12658: TCIntf.pas }
{
    Rev 1.45    17/04/2009 20:04:30  Ewan
  Just in case...
}
{
    Rev 1.44    02/03/2009 22:33:58  Ewan
  New release to fix Shadow Folders, and security enhancements.
}
{
    Rev 1.43    01/11/2008 17:48:12  Ewan    Version: 7.1.4.27
  Latest versions. 
}
{
    Rev 1.42    26/10/2008 11:58:04  Ewan
  Latest versions. 
}
{
    Rev 1.41    03/08/2008 22:16:52  Ewan
  Latest release (7.1.4.20). For Tiburon
}
{
    Rev 1.40    10/03/2008 10:18:26  Ewan
  New release - Hopefully last before major upgrade
}
{
    Rev 1.39    04/02/2008 11:26:32  Ewan
  Testing
}
{
    Rev 1.38    03/02/2008 19:35:20  Ewan
  Back to normal
}
{
    Rev 1.35    25/12/2005 02:18:58  Ewan
  New Version (7.2 and 7.1.3.30) - 25/12/05
  Web Updated #8
  FastMM4
}
{
    Rev 1.35    25/12/2005 02:18:58  Ewan
  New Version (7.2 and 7.1.3.30) - 25/12/05
  Web Updated #8
  FastMM4
}
{
    Rev 1.34    05/04/2005 15:41:52  Ewan
  Fix for HTML Edit
  New Triggers
  Updated Help Files
  Enforce Views
}
{
    Rev 1.33    16/03/2005 23:59:38  Ewan
  New fixes and performance enhancements
}
{
    Rev 1.32    25/02/2005 15:37:18  Ewan
  New performance improvements for Server
}
{
    Rev 1.31    20/01/2005 18:49:28  Ewan
  Latest Release
}
{
    Rev 1.31    20/01/2005 18:49:28  Ewan
  Latest Release
}
{
    Rev 1.31    20/01/2005 18:49:28  Ewan
  Latest Release
}
{
    Rev 1.30    06/10/2004 21:27:38  Ewan
  Check in to update Linux
}
{
    Rev 1.29    18/07/2004 23:48:50  Ewan    Version: 7.1.2.90
  Linux Fix
}
{
    Rev 1.27    18/07/2004 18:21:44  Ewan    Version: 7.1.2.90
  Latest Release
}
{
    Rev 1.26    23/04/2004 23:11:40  Ewan    Version: 7.1.2.85
  Latest Changes and Server Test
}
{
    Rev 1.26    23/04/2004 23:11:40  Ewan    Version: 7.1.2.80
  New Installer, etc
}
{
    Rev 1.25    16/04/2004 21:04:04  Ewan
  Latest
}
{
    Rev 1.24    11/03/2004 17:52:04  Ewan    Version: 7.1.2.72
  Latest Release
}
{
    Rev 1.23    20/02/2004 15:38:38  Ewan
  Test Checkin
}
{
    Rev 1.22    11/02/2004 10:58:44  Ewan
  Checkin for Linux
}
{
    Rev 1.21    07/02/2004 15:08:38  Ewan
  Latest changes
}
{
    Rev 1.20    20/10/2003 23:34:02  Ewan
  Pre-Build
}
{
    Rev 1.19    13/10/2003 10:25:50  Ewan
  Backup Checkin
}
{
    Rev 1.18    18/09/2003 15:56:06  Ewan
  Temp
}
{
    Rev 1.17    15/09/2003 17:35:44  Ewan
  Combining Delphi & Kylix
}
{
    Rev 1.16    22/08/2003 00:12:30  Ewan
  Just in case things go haywire
}
{
    Rev 1.15    13/03/2003 23:15:52  Ewan    Version: 7.1.1.38
  Fixed threads to prevent Invalid Stream methods. New Release
}
{
    Rev 1.14    07/02/2003 00:06:28  Ewan    Version: 7.1.1.35
  Released Version
}
{
    Rev 1.13    27/11/2002 15:16:28  Ewan
  Test Checkin
}
{
    Rev 1.12    27/11/2002 01:19:44  Ewan    Version: 7.1.1.20
  Latest release. Final one before Linux port
}
{
{   Rev 1.11    24/10/2002 23:03:42  Ewan    Version: 7.1 Release
{ Final release of TC 7.1
}
{
{   Rev 1.10    11/10/2002 00:26:12  Ewan
{ After Move to new Machine
}
{
{   Rev 1.9    02/10/2002 00:47:08  Ewan    Version: 7.1 Beta 3
{ Beta release 3
}
{
{   Rev 1.8    18/09/2002 22:59:28  Ewan    Version: 7.1 Beta 3
{ Prior to redeveloping Builder
}
{
{   Rev 1.7    24/08/2002 01:53:08  Ewan    Version: 7.1 Beta 2
{ Beta 2
}
{
{   Rev 1.6    03/04/2002 02:26:38  Ewan    Version: 7.0.2.14
}
{
{   Rev 1.6    03/04/2002 02:26:38  Ewan    Version: 7.0.2.7
{ Support for Visual Studio .NET
}
{
{   Rev 1.5    11/02/2002 00:33:02  Ewan
{ Release 7.0.2.0
}
{
{   Rev 1.4    18/01/2002 15:56:30  Ewan    Version: 7.0.1.23
}
{
{   Rev 1.3    26/11/2001 22:05:44  Ewan
{ Prior to new release
}
{
{   Rev 1.2    25/09/2001 22:25:40  Ewan
{ Just in case
}
{
{   Rev 1.1    19/09/2001 22:17:20  Ewan
{ Just in case - 19-Sept-2001
}
{
{   Rev 1.0    16/07/2001 23:54:54
{ Initial Revision
}

unit TCIntf;

interface

uses {$IFDEF LINUX}Libc, {$ELSE}Windows, {$ENDIF}Classes, TCVcsTypes, TCVcsConst;

// Interface functions (UI)
function TCVcsInitialize( Handle: Cardinal ): Integer;
procedure TCVcsAutoUpdateCache( Enable: Boolean );
function TCVcsBrowseFolder( ACaption, Description, FileMask: String; DlgType: Word; var AnID: Cardinal; var ObjectName: String; CanSelectProject: Boolean ): Boolean;
function TCVcsLockFile( AFile: String; Lock: Boolean ): Integer;
function TCVcsCheckInFile( AFile: String; AddNew: Boolean ): Integer;
function TCVcsCheckOutFile( AFile: String; Lock: Boolean ): Integer;
function TCVcsUndoCheckOutFile( AFile: String ): Integer;
function TCVcsCreateProject( var ProjID: Cardinal; AName: String ): Integer;
function TCVcsCurrentUserName: String;
function TCVcsCurrentConnection: String;
function TCVcsProjectIDByName( AName: String ): Cardinal;
function TCVcsFileMainExtension( AFile: String ): String;
procedure TCVcsShowArchiveManager( AFile: String );
procedure TCVcsShowArchiveManagerEx( AConnection, AView, AFile: String );
function TCVcsGetFileStatus( FileID: Cardinal; var Locked, LockedByMe, MultipleLocks, Modified, OutOfDate: Boolean ): Boolean;
function TCVcsGetFileStatusEx( FileID: Cardinal; var CheckedInTimestamp: Integer; var Locked, LockedByMe, MultipleLocks, Modified, OutOfDate: Boolean ): Boolean;
function TCVcsIsFileArchived( FileName: String; var ID: Cardinal ): Boolean;
function TCVcsHaveLock( FileID: Cardinal ): Boolean;
function TCVcsCheckInFiles( FileList: TStrings; AddNew, NewProject: Boolean ): Integer;
function TCVcsCheckInFilesEx( ProjectID: Cardinal; FileList: TStrings; CheckInInfo: PCheckInInfo; AddNew: Boolean ): Integer;
function TCVcsCheckOutFiles( FileList: TStrings; Lock: Boolean ): Integer;
function TCVcsCheckOutFilesEx( FileList: TStrings; CheckOutInfo: PCheckOutInfo; ShowStatus: Boolean = True; ShowProgress: Boolean = True ): Integer;
function TCVcsGetCheckOutInfo( const Info: PCheckOutInfo; AllowChangeWorking: Boolean ): Boolean;
function TCVcsGetCheckOutInfoEx( ProjectID: Cardinal; const Info: PCheckOutInfo; AllowChangeWorking: Boolean ): Boolean;
function TCVcsGetCheckOutInfoScc( hWnd: Cardinal; ProjectID: Cardinal; const Info: PCheckOutInfo; AllowChangeWorking: Boolean ): Boolean;
function TCVcsGetCheckInInfo( const Info: PCheckInInfo ): Boolean;
function TCVcsGetCheckInInfoEx( ProjectID: Cardinal; const Info: PCheckInInfo ): Boolean;
function TCVcsGetCheckInInfoScc( hWnd: Cardinal; ProjectID: Cardinal; const Info: PCheckInInfo ): Boolean;
function TCVcsUndoCheckOutFiles( FileList: TStrings ): Integer;
function TCVcsRemoveFiles( ProjectID: Cardinal; FileList: TStrings ): Integer;
function TCVcsRenameFile( FileID: Cardinal; NewName: String ): Integer;
procedure TCVcsShowHistory( FileList: TStrings; OutFile: String = ''; Columns: Integer = hrNone; Version: Cardinal = 0; Promotion: Cardinal = 0;
                            FromVer: Cardinal = 0; ToVer: Cardinal = 0; FromDate: TDateTime = 0; ToDate: TDateTime = 0;
                            IncFromVersion: Boolean = False; FileDetails: Boolean = False; ShowNotes: Boolean = False );
procedure TCVcsShowProperties( FileName: String );
procedure TCVcsShowWorkfileDifferences( FileName, Revision: String; ShowDiffs: Boolean; var Status: Integer );
function TCVcsGetFileID( FileName: String ): Cardinal;
function TCVcsGetViewBaseID: Cardinal;
function TCVcsGetViewID: Cardinal;
procedure TCVcsRefreshCache;
procedure TCVcsAbout;
procedure TCVcsGetViews( const Views: TStrings; var ActiveIndex: Integer );
function TCVcsSelectView( ViewName: String ): Integer;
procedure TCVcsSelectConnection( NewConnection: String = '' );
procedure TCVcsMergeGroups( Root: Cardinal; ShowProgress: Boolean; fbProc: TMergeFeedbackProc );
procedure TCVcsSelectConnectionEx( NewConnection: String; LoadCacheOnLoginFail, LoadCacheOnConnectFail: Boolean );
procedure TCVcsShowConnectionInfo;
function TCVcsLogin: Boolean;
function TCVcsGetObjectVersions( const ID: Integer; const VersionList: TStrings ): Integer;
function TCVcsFolderIDByDisplayPath( Path: String ): Cardinal;
function TCVcsErrorString( ID: Integer ): String;
procedure TCVcsShowHelp( HelpFile: String; Topic: Word );
procedure TCVcsRelease;
// Interface functions (Non-UI)
function VcsConnect( const Connection, Name, Password: String ): Integer;
procedure VcsBeginAction( ActionRef: Integer; Action: Word );
procedure VcsEndAction( ActionRef: Integer; Action: Word );
function VcsErrorString( ErrorCode: Integer ): String;
function VcsGetAddinInfo( ObjectID: Cardinal; AddinName: String; const ValuePairs: TStrings ): Integer;
function VcsGetIssues( FileID: Cardinal; var Revisions, Issues: TCardinalArray ): Boolean;
procedure VcsCurrentConnection( var Connection, Username: String; var Connected: Boolean );
function VcsSetMergeInfo( FileID, RevisionID, MergedFrom: Cardinal ): Integer;
function VcsGetCommonRoot( FileID, Revision1, Revision2: Cardinal; var CommonRevision: Cardinal ): Integer;
function VcsGetBranchInfo( FileID, RevisionID: Cardinal; var BranchedFrom, BranchTip: Cardinal ): Integer;
function VcsAddConnection( Name, Description, Host: String; Port: Integer; Params: String; var Msg: String ): Boolean;
function VcsUpdateConnection( Name: String; Params: String; var Msg: String ): Boolean;
function VcsDeleteConnection( Name: String; var Msg: String ): Boolean;
function VcsEnumConnections( EnumProc: TEnumConnections; Data: Pointer ): Integer;
function VcsEnumViews( EnumProc: TEnumViews; Data: Pointer ): Integer;
function VcsEnumProjects( EnumProc: TEnumProjects; Data: Pointer ): Integer;
function VcsEnumFolders( RootID: Cardinal; EnumProc: TEnumFolders; Data: Pointer; Recursive: Boolean ): Integer;
function VcsEnumFiles( RootID: Cardinal; EnumProc: TEnumFiles; Data: Pointer; Recursive: Boolean ): Integer;
function VcsEnumNewFiles( RootID: Cardinal; EnumProc: TEnumNewFiles; Data: Pointer; Recursive: Boolean ): Integer;
function VcsEnumRevisions( FileID: Cardinal; EnumProc: TEnumRevisions; Data: Pointer ): Integer;
function VcsEnumLabels( RootID, RevID: Cardinal; LabelType: Integer; EnumProc: TEnumLabels; Data: Pointer ): Integer;
function VcsSetView( ViewID: Cardinal ): Integer;
function VcsDeleteView( ViewID: Cardinal ): Integer;
function VcsAddView( var ViewID: Cardinal; ViewName, Description, Projects: String; BasisID: Cardinal; Shared: Boolean ): Integer;
function VcsUpdateView( ViewID: Cardinal; ViewName, Description, Projects: String; BasisID: Cardinal; Shared: Boolean ): Integer;
function VcsAddProject( var ProjID: Cardinal; Name: String ): Integer;
function VcsRenameProject( ProjID: Cardinal; Name: String ): Integer;
function VcsDeleteProject( ProjID: Cardinal ): Integer;
function VcsAddFolder( var FolderID: Cardinal; ParentID: Cardinal; Name, Path: String ): Integer;
function VcsRenameFolder( FolderID: Cardinal; Name, Path: String; ReflectInSubFolders: Boolean ): Integer;
function VcsDeleteFolder( FolderID: Cardinal ): Integer;
function VcsDeleteFile( FileID: Cardinal ): Integer;
function VcsRemoveObject( ObjectID: Cardinal ): Integer;
function VcsAddVersionLabel( var LabelID: Cardinal; Name, Comments: String ): Integer;
function VcsAddVersionLabelEx( var LabelID: Cardinal; Name, Comments: String; ProjectID: Cardinal ): Integer;
function VcsDeleteVersionLabel( LabelID: Cardinal ): Integer;
function VcsModifyVersionLabel( LabelID: Cardinal; Name, Comments: String ): Integer;
function VcsAttachVersionLabel( FileID, RevisionID, VersionID: Cardinal; CanMove: Boolean ): Integer;
function VcsDetachVersionLabel( FileID, RevisionID, VersionID: Cardinal ): Integer;
function VcsPromote( FileID, PromotionID: Cardinal ): Integer;
function VcsNextPromotionLabel( var PromotionID: Cardinal; var PromotionLabel: String ): Integer;
function VcsGetFileID( var FileID: Cardinal; FilePath: String ): Integer;
function VcsGetFileWorkingPath( FileID: Cardinal; var Path: String ): Integer;
function VcsGetFileCheckoutPath( FileID: Cardinal; var LockedRevision: Cardinal; var FullPath: String; var BranchedFrom, BranchTip: Cardinal ): Integer;
function VcsGetFileGroupExt( FileName: String; var Ext: String ): Integer;
function VcsChangeFileExt( Original, NewExt: String ): string;
function VcsGetFileGroupExtensions( FileName: String; var Ext: String ): Integer;
function VcsGetFolderInfo( FolderID: Cardinal; var FolderName, TCPath, LocalFolder, Extra: String; var ParentID: Cardinal; var FolderCount, FileCount: Integer ): Integer;
function VcsFileStatus( var ParentID, FileID: Cardinal; var FilePath, LockedBy: String; var Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; var IsVirtual, Frozen: Boolean ): Integer;
function VcsCheckInFile( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; FileName: String; CheckInInfo: PCheckInInfo ): Integer;
function VcsCheckInFileEx( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; FileName, SourceFile: String; DateTimeOverride: TDateTime; CheckInInfo: PCheckInInfo; UserOverride: String = '' ): Integer;
function VcsCheckOutFile( FileID: Cardinal; var RevisionID: Cardinal; CheckOutInfo: PCheckOutInfo ): Integer;
function VcsUncheckOutFile( FileID: Cardinal ): Integer;
function VcsShareFile( var NewFileID: Cardinal; SourceFileID, TargetFolderID: Cardinal ): Integer;
function VcsUnshareFile( FileID: Cardinal ): Integer;
function VcsMoveFile( SourceFileID, TargetFolderID: Cardinal ): Integer;
function VcsLock( FileID, RevisionID: Cardinal; FullPath, LockComments: String; Lock, UpdateStatusOnLock: Boolean ): Integer;
//function VcsGetObjectNotes( ObjectID: Cardinal; var Notes: String ): Integer;
//function VcsSetObjectNotes( ObjectID: Cardinal; Notes: String ): Integer;
function VcsDisconnect: Integer;
// Temporary functions not yet implemented in the exported API, but given here to give an idea of what is possible...
function VcsGetAssociations( FileID: Cardinal; Addin: String; IDs: TCardinalArray ): Boolean;
// Internal use
function TCVcsGetFileList( RootID: Cardinal; const Files: TStrings ): Boolean;
function TCVcsGetFileListForFolders( ProjectID: Cardinal; const Folders, Files: TStrings; Recursive: Boolean ): Boolean;
function TCVcsGetObjectType( var ObjID: Cardinal; ProjID: Cardinal; AName: String ): Integer;
function TCVcsSelectProject( var ProjName: String; var ProjID: Cardinal; CanCreate: Boolean ): Boolean;
function TCSelectFiles( const Files: TStrings ): Boolean;
procedure TCVcsSetCaller( CallerName: String );
// Import/Export functionality
function VcsImport( FileName: String; Progress: TImportExportProgress ): Integer;
function VcsExport( What: Integer; ProjectID: Cardinal; FileName: String; Progress: TImportExportProgress ): Integer;
// For the SCC API only
function TCVcsSccSelectProject( var Name, Path: String; var ProjID, FolderID: Cardinal; CanCreate, IncludeFolders: Boolean ): Boolean;
function TCVcsSccProjectInfoByName( AName: String; var ProjID, FolderID: Cardinal ): Boolean;
function TCVcsSccCheckInFilesEx( ProjectID, FolderID: Cardinal; FileList: TStrings; CheckInInfo: PCheckInInfo; AddNew: Boolean ): Integer;
function TCVcsSccUndoCheckOutFiles( FileList: TStrings ): Integer;
function TCVcsSccRemoveFiles( ProjectID: Cardinal; FileList: TStrings ): Integer;
function TCVcsSccCheckOutFilesEx( FileList: TStrings; CheckOutInfo: PCheckOutInfo; ShowStatus: Boolean = True; ShowProgress: Boolean = True ): Integer;
function TCVcsSccIsFileArchived( ProjectID, FolderID: Cardinal; FileName: String; var ID: Cardinal ): Boolean;
function TCVcsSccGetFileStatusEx( ProjectID, FolderID, FileID: Cardinal; var CheckedInTimestamp: Integer; var Locked, LockedByMe, MultipleLocks, Modified, OutOfDate: Boolean ): Boolean;
function TCVcsSccQuickDiff( ProjectID, FolderID, FileID: Cardinal; Options: Integer ): Integer;
function TCVcsForceCheckinComments: Boolean;
// Testing
function VcsBackup(): Integer;

const
  VcsInterfaceFile = 'GPVMain.Dll';

var
  LibPath: String = '';

implementation

uses
  {$IFDEF DEBUGAPI}
  CsIntf,
  {$ENDIF}
  SysUtils,
  FileCtrl,
  ShellApi,
  TCVcsUtils,
  IniFiles;

var
  LibHandle: Cardinal = 0;

type
  TTCVcsInitialize = function ( Handle: Cardinal; LoadCache: Boolean; ProgressProc: TSplashProgress ): Integer; stdcall;
  TTCVcsAutoUpdateCache = procedure ( Enable: Boolean ); stdcall;
  TTCVcsBrowseFolder = function ( pCaption, pDescription, pFileMask: PChar; DlgType: Word; var AnID: Cardinal; const pObjectName: PChar; CanSelectProject: Boolean ): Boolean; stdcall;
  TTCVcsCurrentUserName = function ( const pUserName: PChar ): Integer; stdcall;
  TTCVcsCreateProject = function ( var ProjID: Cardinal; pName: PChar ): Integer; stdcall;
  TTCVcsSelectProject = function ( const pProjName: PChar; var ProjID: Cardinal; CanCreate: Boolean ): Boolean; stdcall;
  TTCVcsCurrentConnection = function ( const pConnection: PChar ): Integer; stdcall;
  TTCVcsFileMainExtension = function ( pFile: PChar; const pExt: PChar ): Integer; stdcall;
  TTCVcsProjectIDByName = function ( const pName: PChar ): Cardinal; stdcall;
  TTCVcsGetFileList = function ( RootID: Cardinal; const pFiles: PChar; var Size: Integer ): Boolean; stdcall;
  TTCVcsGetFileListForFolders = function ( ProjectID: Cardinal; const pFolders, pFiles: PChar; var Size: Integer; Recursive: Boolean ): Boolean; stdcall;
  TTCVcsGetFileStatus = function ( FileID: Cardinal; var Locked, LockedByMe, MultipleLocks, Modified, OutOfDate: Boolean ): Boolean; stdcall;
  TTCVcsGetFileStatusEx = function ( FileID: Cardinal; var CheckedInTimestamp: Integer; var Locked, LockedByMe, MultipleLocks, Modified, OutOfDate: Boolean ): Boolean; stdcall;
  TTCVcsGetObjectType = function ( var ObjID: Cardinal; ProjID: Cardinal; pName: PChar ): Integer; stdcall;
  TTCVcsIsFileArchived = function ( pFileName: PChar; var ID: Cardinal ): Boolean; stdcall;
  TTCVcsHaveLock = function ( FileID: Cardinal ): Boolean; stdcall;
  TTCVcsLockFile = function ( pFile: PChar; Lock: Boolean ): Integer; stdcall;
  TTCVcsCheckInFiles = function ( FileList: PChar; AddNew, NewProject: Boolean ): Integer; stdcall;
  TTCVcsCheckInFilesEx = function ( ProjectID: Cardinal; FileList: PChar; CheckInInfo: PCheckInInfo; AddNew: Boolean ): Integer; stdcall;
  TTCVcsGetCheckOutInfo = function ( const Info: PCheckOutInfo; AllowChangeWorking: Boolean ): Boolean; stdcall;
  TTCVcsGetCheckOutInfoEx = function ( ProjectID: Cardinal; const Info: PCheckOutInfo; AllowChangeWorking: Boolean ): Boolean; stdcall;
  TTCVcsGetCheckOutInfoScc = function ( hWnd: Cardinal; ProjectID: Cardinal; const Info: PCheckOutInfo; AllowChangeWorking: Boolean ): Boolean; stdcall;
  TTCVcsGetCheckInInfo = function ( const Info: PCheckInInfo ): Boolean; stdcall;
  TTCVcsGetCheckInInfoEx = function ( ProjectID: Cardinal; const Info: PCheckInInfo ): Boolean; stdcall;
  TTCVcsGetCheckInInfoScc = function ( hWnd: Cardinal; ProjectID: Cardinal; const Info: PCheckInInfo ): Boolean; stdcall;
  TTCVcsCheckOutFiles = function ( FileList: PChar; Lock: Boolean ): Integer; stdcall;
  TTCVcsCheckOutFilesEx = function ( FileList: PChar; CheckOutInfo: PCheckOutInfo; ShowStatus, ShowProgress: Boolean ): Integer; stdcall;
  TTCVcsUndoCheckOutFiles = function ( FileList: PChar ): Integer; stdcall;
  TTCVcsRemoveFiles = function ( ProjectID: Cardinal; FileList: PChar ): Integer; stdcall;
  TTCVcsRenameFile = function ( FileID: Cardinal; pNewName: PChar ): Integer; stdcall;
  TTCVcsShowProperties = procedure ( pFileName: PChar ); stdcall;
  TTCVcsShowHistory = procedure ( pFileList, pOutFile: PChar; Columns: Integer; Version, Promotion, FromVer, ToVer: Cardinal; FromDate, ToDate: Integer; IncFromVersion, FileDetails, ShowHistory: Boolean ); stdcall;
  TTCVcsShowWorkfileDifferences = procedure ( pFileName, pRevision: PChar; ShowDiffs: Boolean; var Status: Integer ); stdcall;
  TTCVcsGetFileID = function ( pFileName: PChar ): Cardinal; stdcall;
  TTCVcsGetViewBaseID = function : Cardinal; stdcall;
  TTCVcsGetViewID = function : Cardinal; stdcall;
  TTCVcsAbout = procedure; stdcall;
  TTCVcsRefreshCache = procedure; stdcall;
  TTCVcsGetViews = procedure ( const pViews: PChar; var ActiveIndex: Integer ); stdcall;
  TTCVcsSelectView = function ( pViewName: PChar ): Integer; stdcall;
  TTCVcsSelectConnection = procedure ( pConnection: PChar ); stdcall;
  TTCVcsSelectConnectionEx = procedure ( pConnection: PChar; LoadCacheOnLoginFail, LoadCacheOnConnectFail: Boolean ); stdcall;
  TTCVcsMergeGroups = procedure ( Root: Cardinal; ShowProgress: Boolean; fbProc: TMergeFeedbackProc ); stdcall;
  TTCVcsShowConnectionInfo = procedure; stdcall;
  TVcsSetMergeInfo = function ( FileID, RevisionID, MergedFrom: Cardinal ): Integer; stdcall;
  TVcsGetCommonRoot = function ( FileID, Revision1, Revision2: Cardinal; var CommonRevision: Cardinal ): Integer; stdcall;
  TVcsGetBranchInfo = function ( FileID, RevisionID: Cardinal; var BranchedFrom, BranchTip: Cardinal ): Integer; stdcall;
  TTCVcsLogin = function : Boolean; stdcall;
  TTCVcsGetObjectVersions = function ( const ID: Integer; const Stream: TStream ): Integer; stdcall;
  TTCVcsErrorString = procedure ( ID: Integer; const pMsg: PChar ); stdcall;
  TTCVcsFolderIDByDisplayPath = function ( pPath: PChar ): Cardinal; stdcall;
  TTCVcsShowHelp = procedure ( pHelpFile: pChar; Topic: Word ); stdcall;
  TTCVcsRelease = procedure; stdcall;
  // Non-UI
  TVcsConnect = function ( pConnection, pName, pPassword: PChar ): Integer; stdcall;
  TVcsBeginAction = procedure ( ActionRef: Integer; Action: Word ); stdcall;
  TVcsEndAction = procedure ( ActionRef: Integer; Action: Word ); stdcall;
  TVcsErrorString = function ( ErrorCode: Integer; const ErrorString: PChar; var Size: Integer ): Integer; stdcall;
  TVcsCurrentConnection = procedure ( const pConnection, pUsername: PChar; var Connected: Boolean ); stdcall;
  TVcsGetAddinInfo = function ( ObjectID: Cardinal; pAddinName: PChar; const pValuePairs: PChar; var Size: Integer ): Integer; stdcall;
  TVcsAddConnection = function ( pName, pDescription, pHost: PChar; Port: Integer; pParams: PChar; const pMsg: PChar ): Boolean; stdcall;
  TVcsUpdateConnection = function ( pName: PChar; pParams: PChar; const pMsg: PChar ): Boolean; stdcall;
  TVcsDeleteConnection = function ( pName: PChar; const pMsg: PChar ): Boolean; stdcall;
  TVcsEnumConnections = function ( Context, Data: Pointer; EnumProc: TIntEnumConnections ): Integer; stdcall;
  TVcsEnumViews = function ( Context, Data: Pointer; EnumProc: TIntEnumViews ): Integer; stdcall;
  TVcsEnumProjects = function ( Context, Data: Pointer; EnumProc: TIntEnumProjects ): Integer; stdcall;
  TVcsEnumFolders = function ( RootID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumFolders; Recursive: Boolean ): Integer; stdcall;
  TVcsEnumFiles = function ( RootID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumFiles; Recursive: Boolean ): Integer; stdcall;
  TVcsEnumNewFiles = function ( RootID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumNewFiles; Recursive: Boolean ): Integer; stdcall;
  TVcsEnumRevisions = function ( FileID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumRevisions ): Integer; stdcall;
  TVcsEnumLabels = function ( RootID, RevID: Cardinal; LabelType: Integer; Context, Data: Pointer; EnumProc: TIntEnumLabels ): Integer; stdcall;
  TVcsSetView = function ( ViewID: Cardinal ): Integer; stdcall;
  TVcsDeleteView = function ( ViewID: Cardinal ): Integer; stdcall;
  TVcsAddView = function ( var ViewID: Cardinal; pName, pDescription, pProjects: PChar; BasisID: Cardinal; Shared: Boolean ): Integer; stdcall;
  TVcsUpdateView = function ( ViewID: Cardinal; pName, pDescription, pProjects: PChar; BasisID: Cardinal; Shared: Boolean ): Integer; stdcall;
  TVcsGetFolderInfo = function ( FolderID: Cardinal; const pName, pTCPath, pLocalFolder, pExtra: PChar; var ParentID: Cardinal; var FolderCount, FileCount: Integer ): Integer; stdcall;
  TVcsAddProject = function ( var ProjID: Cardinal; pName: PChar ): Integer; stdcall;
  TVcsRenameProject = function ( ProjID: Cardinal; pName: PChar ): Integer; stdcall;
  TVcsDeleteProject = function ( ProjID: Cardinal ): Integer; stdcall;
  TVcsAddFolder = function ( var FolderID: Cardinal; ParentID: Cardinal; pName, pPath: PChar ): Integer; stdcall;
  TVcsRenameFolder = function ( FolderID: Cardinal; pName, pPath: PChar; ReflectInSubFolders: Boolean ): Integer; stdcall;
  TVcsDeleteFolder = function ( FolderID: Cardinal ): Integer; stdcall;
  TVcsDeleteFile = function ( FileID: Cardinal ): Integer; stdcall;
  TVcsRemoveObject = function ( ObjectID: Cardinal ): Integer; stdcall;
  TVcsAddVersionLabel = function ( var LabelID: Cardinal; pName, pComment: PChar ): Integer; stdcall;
  TVcsAddVersionLabelEx = function ( var LabelID: Cardinal; pName, pComment: PChar; ProjectID: Cardinal ): Integer; stdcall;
  TVcsDeleteVersionLabel = function ( LabelID: Cardinal ): Integer; stdcall;
  TVcsModifyVersionLabel = function ( LabelID: Cardinal; pName, pComment: PChar ): Integer; stdcall;
  TVcsAttachVersionLabel = function ( FileID, RevisionID, VersionID: Cardinal; CanMove: Boolean ): Integer; stdcall;
  TVcsDetachVersionLabel = function ( FileID, RevisionID, VersionID: Cardinal ): Integer; stdcall;
  TVcsPromote = function ( FileID, PromotionID: Cardinal ): Integer; stdcall;
  TVcsNextPromotionLabel = function ( var PromotionID: Cardinal; const pPromotionLabel: PChar ): Integer; stdcall;
  TVcsFileStatus = function ( var ParentID, FileID: Cardinal; const pFilePath, pLockedBy: PChar; var Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; var IsVirtual, Frozen: Boolean ): Integer; stdcall;
  TVcsGetFileID = function ( var FileID: Cardinal; pFilePath: PChar ): Integer; stdcall;
  TVcsGetFileWorkingPath = function ( FileID: Cardinal; const pFilePath: PChar ): Integer; stdcall;
  TVcsGetFileCheckoutPath = function ( FileID: Cardinal; var LockedRevision: Cardinal; const pFullPath: PChar; var BranchedFrom, BranchTip: Cardinal ): Integer; stdcall;
  TVcsGetFileGroupExt = function ( pFileName: PChar; const pExt: PChar ): Integer; stdcall;
  TVcsChangeFileExt = function ( pOriginal, pNewExt: PChar; const pResult: PChar ): Integer; stdcall;
  TVcsGetFileGroupExtensions = function ( pFileName: PChar; const pExt: PChar ): Integer; stdcall;
  TVcsCheckInFile = function ( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; pFileName: PChar; CheckInInfo: PCheckInInfo ): Integer; stdcall;
  TVcsCheckInFileEx = function ( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; pFileName, pSourceFile, pUserName: PChar; DateTimeOverride: Integer; CheckInInfo: PCheckInInfo ): Integer; stdcall;
  TVcsCheckOutFile = function ( FileID: Cardinal; var RevisionID: Cardinal; CheckOutInfo: PCheckOutInfo ): Integer; stdcall;
  TVcsUncheckOutFile = function ( FileID: Cardinal ): Integer; stdcall;
  TVcsShareFile = function ( var NewFileID: Cardinal; SourceFileID, TargetFolderID: Cardinal ): Integer; stdcall;
  TVcsUnshareFile = function ( FileID: Cardinal ): Integer; stdcall;
  TVcsMoveFile = function ( SourceFileID, TargetFolderID: Cardinal ): Integer; stdcall;
  TVcsDisconnect = function: Integer; stdcall;
  TVcsLock = function ( FileID, RevisionID: Cardinal; pFullPath, pLockComments: PChar; Lock, UpdateStatusOnLock: Boolean ): Integer; stdcall;
  // Internal (SCC API)
  TTCVcsSccSelectProject = function ( const pName, pPath: PChar; var ProjID, FolderID: Cardinal; CanCreate, IncludeFolders: Boolean ): Boolean; stdcall;
  TTCVcsSccProjectInfoByName = function ( pName: String; var ProjID, FolderID: Cardinal ): Boolean; stdcall;
  TTCVcsSccCheckInFilesEx = function ( ProjectID, FolderID: Cardinal; FileList: PChar; CheckInInfo: PCheckInInfo; AddNew: Boolean ): Integer; stdcall;
  TTCVcsSccIsFileArchived = function ( ProjectID, FolderID: Cardinal; pFileName: PChar; var ID: Cardinal ): Boolean; stdcall;
  TTCVcsForceCheckinComments = function: Boolean; stdcall;
  TTCVcsSccUndoCheckOutFiles = function ( FileList: PChar ): Integer; stdcall;
  TTCVcsSccRemoveFiles = function ( ProjectID: Cardinal; FileList: PChar ): Integer; stdcall;
  TTCVcsSccCheckOutFilesEx = function ( FileList: PChar; CheckOutInfo: PCheckOutInfo; ShowStatus, ShowProgress: Boolean ): Integer; stdcall;
  TTCVcsSccGetFileStatusEx = function ( ProjectID, FolderID, FileID: Cardinal; var CheckedInTimestamp: Integer; var Locked, LockedByMe, MultipleLocks, Modified, OutOfDate: Boolean ): Boolean; stdcall;
  TTCVcsSccQuickDiff = function ( ProjectID, FolderID, FileID: Cardinal; Options: Integer ): Integer; stdcall;
  TTCSelectFiles = function ( const pFiles: TStream ): Boolean; stdcall;
  TTCVcsSetCaller = procedure ( pCallerName: PChar ); stdcall;
  // Export/Import
  TVcsBeginExport = function ( What: Integer; ProjectID: Cardinal ): Integer; stdcall;
  TVcsGetExportProgress = function : Integer; stdcall;
  TVcsGetExportResult = function : Integer; stdcall;
  TVcsGetExportSize = function : Integer; stdcall;
  TVcsGetExportData = function ( Start, Size: Integer; const Stream: TStream ): Integer; stdcall;
  TVcsEndExport = function : Integer; stdcall;
  TVcsBeginImport = function : Integer; stdcall;
  TVcsSetImportData = function ( const Data: TStream ): Integer; stdcall;
  TVcsDoImport = function : Integer; stdcall;
  TVcsGetImportProgress = function : Integer; stdcall;
  TVcsGetImportResult = function : Integer; stdcall;
  TVcsEndImport = function : Integer; stdcall;
  // Testing
  TVcsBackup = function (): Integer; stdcall;

var
  PVcsBeginAction: TVcsBeginAction = nil;
  PVcsEndAction: TVcsEndAction = nil;
  PTCVcsInitialize: TTCVcsInitialize = nil;
  PTCVcsAutoUpdateCache: TTCVcsAutoUpdateCache = nil;
  PTCVcsBrowseFolder: TTCVcsBrowseFolder = nil;
  PTCVcsIsFileArchived: TTCVcsIsFileArchived = nil;
  PTCVcsCurrentUserName: TTCVcsCurrentUserName = nil;
  PTCVcsCreateProject: TTCVcsCreateProject = nil;
  PTCVcsSelectProject: TTCVcsSelectProject = nil;
  PTCSelectFiles: TTCSelectFiles = nil;
  PTCVcsSetCaller: TTCVcsSetCaller = nil;
  PTCVcsCurrentConnection: TTCVcsCurrentConnection = nil;
  PTCVcsFileMainExtension: TTCVcsFileMainExtension = nil;
  PTCVcsProjectIDByName: TTCVcsProjectIDByName = nil;
  PTCVcsGetFileList: TTCVcsGetFileList = nil;
  PTCVcsGetFileListForFolders: TTCVcsGetFileListForFolders = nil;
  PTCVcsGetFileStatus: TTCVcsGetFileStatus = nil;
  PTCVcsGetFileStatusEx: TTCVcsGetFileStatusEx = nil;
  PTCVcsGetObjectType: TTCVcsGetObjectType = nil;
  PTCVcsHaveLock: TTCVcsHaveLock = nil;
  PTCVcsLockFile: TTCVcsLockFile = nil;
  PTCVcsCheckInFiles: TTCVcsCheckInFiles = nil;
  PTCVcsGetCheckInInfo: TTCVcsGetCheckInInfo = nil;
  PTCVcsGetCheckInInfoEx: TTCVcsGetCheckInInfoEx = nil;
  PTCVcsGetCheckInInfoScc: TTCVcsGetCheckInInfoScc = nil;
  PTCVcsCheckInFilesEx: TTCVcsCheckInFilesEx = nil;
  PTCVcsGetCheckOutInfo: TTCVcsGetCheckOutInfo = nil;
  PTCVcsGetCheckOutInfoEx: TTCVcsGetCheckOutInfoEx = nil;
  PTCVcsGetCheckOutInfoScc: TTCVcsGetCheckOutInfoScc = nil;
  PTCVcsCheckOutFiles: TTCVcsCheckOutFiles = nil;
  PTCVcsCheckOutFilesEx: TTCVcsCheckOutFilesEx = nil;
  PTCVcsUndoCheckOutFiles: TTCVcsUndoCheckOutFiles = nil;
  PTCVcsRemoveFiles: TTCVcsRemoveFiles = nil;
  PTCVcsRenameFile: TTCVcsRenameFile = nil;
  PTCVcsShowProperties: TTCVcsShowProperties = nil;
  PTCVcsShowWorkfileDifferences: TTCVcsShowWorkfileDifferences = nil;
  PTCVcsErrorString: TTCVcsErrorString = nil;
  PTCVcsFolderIDByDisplayPath: TTCVcsFolderIDByDisplayPath = nil;
  PTCVcsShowHelp: TTCVcsShowHelp = nil;
  PTCVcsShowHistory: TTCVcsShowHistory = nil;
  PTCVcsGetFileID: TTCVcsGetFileID = nil;
  PTCVcsGetViewBaseID: TTCVcsGetViewBaseID = nil;
  PTCVcsGetViewID: TTCVcsGetViewID = nil;
  PTCVcsAbout: TTCVcsAbout = nil;
  PTCVcsRefreshCache: TTCVcsRefreshCache = nil;
  PTCVcsGetViews: TTCVcsGetViews = nil;
  PTCVcsSelectView: TTCVcsSelectView = nil;
  PTCVcsSelectConnection: TTCVcsSelectConnection = nil;
  PTCVcsMergeGroups: TTCVcsMergeGroups = nil;
  PTCVcsSelectConnectionEx: TTCVcsSelectConnectionEx = nil;
  PTCVcsShowConnectionInfo: TTCVcsShowConnectionInfo = nil;
  PTCVcsLogin: TTCVcsLogin = nil;
  PTCVcsGetObjectVersions: TTCVcsGetObjectVersions = nil;
  PTCVcsRelease: TTCVcsRelease = nil;
  // Non-UI
  PVcsConnect: TVcsConnect = nil;
  PVcsErrorString: TVcsErrorString = nil;
  PVcsPromote: TVcsPromote = nil;
  PVcsNextPromotionLabel: TVcsNextPromotionLabel = nil;
  PVcsCurrentConnection: TVcsCurrentConnection = nil;
  PVcsAddConnection: TVcsAddConnection = nil;
  PVcsUpdateConnection: TVcsUpdateConnection = nil;
  PVcsDeleteConnection: TVcsDeleteConnection = nil;
  PVcsEnumConnections: TVcsEnumConnections = nil;
  PVcsGetFolderInfo: TVcsGetFolderInfo = nil;
  PVcsEnumViews: TVcsEnumViews = nil;
  PVcsGetAddinInfo: TVcsGetAddinInfo = nil;
  PVcsEnumProjects: TVcsEnumProjects = nil;
  PVcsEnumFolders: TVcsEnumFolders = nil;
  PVcsEnumFiles: TVcsEnumFiles = nil;
  PVcsEnumNewFiles: TVcsEnumNewFiles = nil;
  PVcsEnumRevisions: TVcsEnumRevisions = nil;
  PVcsEnumLabels: TVcsEnumLabels = nil;
  PVcsSetView: TVcsSetView = nil;
  PVcsDeleteView: TVcsDeleteView = nil;
  PVcsAddView: TVcsAddView = nil;
  PVcsUpdateView: TVcsUpdateView = nil;
  PVcsAddProject: TVcsAddProject = nil;
  PVcsRenameProject: TVcsRenameProject = nil;
  PVcsDeleteProject: TVcsDeleteProject = nil;
  PVcsAddFolder: TVcsAddFolder = nil;
  PVcsRenameFolder: TVcsRenameFolder = nil;
  PVcsDeleteFolder: TVcsDeleteFolder = nil;
  PVcsDeleteFile: TVcsDeleteFile = nil;
  PVcsRemoveObject: TVcsRemoveObject = nil;
  PVcsAddVersionLabel: TVcsAddVersionLabel = nil;
  PVcsAddVersionLabelEx: TVcsAddVersionLabelEx = nil;
  PVcsDeleteVersionLabel: TVcsDeleteVersionLabel = nil;
  PVcsModifyVersionLabel: TVcsModifyVersionLabel = nil;
  PVcsAttachVersionLabel: TVcsAttachVersionLabel = nil;
  PVcsDetachVersionLabel: TVcsDetachVersionLabel = nil;
  PVcsFileStatus: TVcsFileStatus = nil;
  PVcsGetFileID: TVcsGetFileID = nil;
  PVcsGetFileWorkingPath: TVcsGetFileWorkingPath = nil;
  PVcsGetFileCheckoutPath: TVcsGetFileCheckoutPath = nil;
  PVcsGetFileGroupExt: TVcsGetFileGroupExt = nil;
  PVcsChangeFileExt: TVcsChangeFileExt = nil;
  PVcsGetFileGroupExtensions: TVcsGetFileGroupExtensions = nil;
  PVcsCheckOutFile: TVcsCheckOutFile = nil;
  PVcsUncheckOutFile: TVcsUncheckOutFile = nil;
  PVcsSetMergeInfo: TVcsSetMergeInfo = nil;
  PVcsGetCommonRoot: TVcsGetCommonRoot = nil;
  PVcsGetBranchInfo: TVcsGetBranchInfo = nil;
  PVcsShareFile: TVcsShareFile = nil;
  PVcsUnshareFile: TVcsUnshareFile = nil;
  PVcsMoveFile: TVcsMoveFile = nil;
  PVcsLock: TVcsLock = nil;
  PVcsCheckInFile: TVcsCheckInFile = nil;
  PVcsCheckInFileEx: TVcsCheckInFileEx = nil;
  PVcsDisconnect: TVcsDisconnect = nil;
  // Internal (SCC API)
  PTCVcsSccSelectProject: TTCVcsSccSelectProject = nil;
  PTCVcsSccProjectInfoByName: TTCVcsSccProjectInfoByName = nil;
  PTCVcsSccCheckInFilesEx: TTCVcsSccCheckInFilesEx = nil;
  PTCVcsSccIsFileArchived: TTCVcsSccIsFileArchived = nil;
  PTCVcsForceCheckinComments: TTCVcsForceCheckinComments = nil;
  PTCVcsSccQuickDiff: TTCVcsSccQuickDiff = nil;
  PTCVcsSccUndoCheckOutFiles: TTCVcsSccUndoCheckOutFiles = nil;
  PTCVcsSccGetFileStatusEx: TTCVcsSccGetFileStatusEx = nil;
  PTCVcsSccRemoveFiles: TTCVcsSccRemoveFiles = nil;
  PTCVcsSccCheckOutFilesEx: TTCVcsSccCheckOutFilesEx = nil;
  // Import/Export
  PVcsBeginExport: TVcsBeginExport = nil;
  PVcsGetExportProgress: TVcsGetExportProgress = nil;
  PVcsGetExportResult: TVcsGetExportResult = nil;
  PVcsGetExportSize: TVcsGetExportSize = nil;
  PVcsGetExportData: TVcsGetExportData = nil;
  PVcsEndExport: TVcsEndExport = nil;
  PVcsBeginImport: TVcsBeginImport = nil;
  PVcsSetImportData: TVcsSetImportData = nil;
  PVcsDoImport: TVcsDoImport = nil;
  PVcsGetImportProgress: TVcsGetImportProgress = nil;
  PVcsGetImportResult: TVcsGetImportResult = nil;
  PVcsEndImport: TVcsEndImport = nil;
  // Testing
  PVcsBackup: TVcsBackup = nil;

procedure LoadIt;
var
  APath: String;
begin
  if LibHandle > 0 then Exit;
  if LibPath = '' then
    LibPath := InstallDir;
  APath := AddBackslash( LibPath ) + VcsInterfaceFile;
  if FileExists( APath ) then
  begin
    LibHandle := LoadLibrary( PChar( APath ) );
    if LibHandle > 0 then
    begin
      {$IFDEF DEBUGAPI}
      CodeSite.EnterMethod( 'Loading API (UI)' );
      {$ENDIF}
      PTCVcsInitialize := GetProcAddress( LibHandle, 'TCVcsInitialize' );
      PTCVcsAutoUpdateCache := GetProcAddress( LibHandle, 'TCVcsAutoUpdateCache' );
      PTCVcsBrowseFolder := GetProcAddress( LibHandle, 'TCBrowseFolder' );
      PTCVcsIsFileArchived := GetProcAddress( LibHandle, 'TCVcsIsFileArchived' );
      PTCVcsGetFileList := GetProcAddress( LibHandle, 'TCVcsGetFileList' );
      PTCVcsGetFileListForFolders := GetProcAddress( LibHandle, 'TCVcsGetFileListForFolders' );
      PTCVcsCurrentUserName := GetProcAddress( LibHandle, 'TCVcsCurrentUserName' );
      PTCVcsCreateProject := GetProcAddress( LibHandle, 'TCVcsCreateProject' );
      PTCVcsSelectProject := GetProcAddress( LibHandle, 'TCVcsSelectProject' );
      PTCVcsCurrentConnection := GetProcAddress( LibHandle, 'TCVcsCurrentConnection' );
      PTCVcsFileMainExtension := GetProcAddress( LibHandle, 'TCVcsFileMainExtension' );
      PTCVcsProjectIDByName := GetProcAddress( LibHandle, 'TCVcsProjectIDByName' );
      PTCVcsGetFileStatus := GetProcAddress( LibHandle, 'TCVcsGetFileStatus' );
      PTCVcsGetFileStatusEx := GetProcAddress( LibHandle, 'TCVcsGetFileStatusEx' );
      PTCVcsGetObjectType := GetProcAddress( LibHandle, 'TCVcsGetObjectType' );
      PTCVcsHaveLock := GetProcAddress( LibHandle, 'TCVcsHaveLock' );
      PTCVcsLockFile := GetProcAddress( LibHandle, 'TCVcsLockFile' );
      PTCVcsGetCheckOutInfo := GetProcAddress( LibHandle, 'TCVcsGetCheckOutInfo' );
      PTCVcsGetCheckOutInfoEx := GetProcAddress( LibHandle, 'TCVcsGetCheckOutInfoEx' );
      PTCVcsGetCheckOutInfoScc := GetProcAddress( LibHandle, 'TCVcsGetCheckOutInfoScc' );
      PTCVcsCheckOutFiles := GetProcAddress( LibHandle, 'TCVcsCheckOutFiles' );
      PTCVcsCheckOutFilesEx := GetProcAddress( LibHandle, 'TCVcsCheckOutFilesEx' );
      PTCVcsUndoCheckOutFiles := GetProcAddress( LibHandle, 'TCVcsUndoCheckOutFiles' );
      PTCVcsRemoveFiles := GetProcAddress( LibHandle, 'TCVcsRemoveFiles' );
      PTCVcsRenameFile := GetProcAddress( LibHandle, 'TCVcsRenameFile' );
      PTCVcsShowProperties := GetProcAddress( LibHandle, 'TCVcsShowProperties' );
      PTCVcsShowWorkfileDifferences := GetProcAddress( LibHandle, 'TCVcsShowWorkfileDifferences' );
      PTCVcsShowHistory := GetProcAddress( LibHandle, 'TCVcsShowHistory' );
      PTCVcsGetFileID := GetProcAddress( LibHandle, 'TCVcsGetFileID' );
      PTCVcsGetViewBaseID := GetProcAddress( LibHandle, 'TCVcsGetViewBaseID' );
      PTCVcsGetViewID := GetProcAddress( LibHandle, 'TCVcsGetViewID' );
      PTCVcsAbout := GetProcAddress( LibHandle, 'TCVcsAbout' );
      PTCVcsRefreshCache := GetProcAddress( LibHandle, 'TCVcsRefreshCache' );
      PTCVcsGetViews := GetProcAddress( LibHandle, 'TCVcsGetViews' );
      PTCVcsSelectView := GetProcAddress( LibHandle, 'TCVcsSelectView' );
      PTCVcsSelectConnection := GetProcAddress( LibHandle, 'TCVcsSelectConnection' );
      PTCVcsMergeGroups := GetProcAddress( LibHandle, 'TCVcsMergeGroups' );
      PTCVcsSelectConnectionEx := GetProcAddress( LibHandle, 'TCVcsSelectConnectionEx' );
      PTCVcsShowConnectionInfo := GetProcAddress( LibHandle, 'TCVcsShowConnectionInfo' );
      PTCVcsLogin := GetProcAddress( LibHandle, 'TCVcsLogin' );
      PTCVcsGetObjectVersions := GetProcAddress( LibHandle, 'TCGetObjectVersions' );
      PTCVcsErrorString := GetProcAddress( LibHandle, 'TCVcsErrorString' );
      PTCVcsFolderIDByDisplayPath := GetProcAddress( LibHandle, 'TCVcsFolderIDByDisplayPath' );
      PTCVcsShowHelp := GetProcAddress( LibHandle, 'TCVcsShowHelp' );
      PTCVcsCheckInFiles := GetProcAddress( LibHandle, 'TCVcsCheckInFiles' );
      PTCVcsGetCheckInInfo := GetProcAddress( LibHandle, 'TCVcsGetCheckInInfo' );
      PTCVcsGetCheckInInfoEx := GetProcAddress( LibHandle, 'TCVcsGetCheckInInfoEx' );
      PTCVcsGetCheckInInfoScc := GetProcAddress( LibHandle, 'TCVcsGetCheckInInfoScc' );
      PTCVcsCheckInFilesEx := GetProcAddress( LibHandle, 'TCVcsCheckInFilesEx' );
      PTCVcsRelease := GetProcAddress( LibHandle, 'TCVcsRelease' );
      // Non-UI Stuff
      PVcsConnect := GetProcAddress( LibHandle, 'TCDVcsConnect' );
      PVcsErrorString := GetProcAddress( LibHandle, 'TCDVcsErrorString' );
      PVcsBeginAction := GetProcAddress( LibHandle, 'TCDVcsBeginAction' );
      PVcsEndAction := GetProcAddress( LibHandle, 'TCDVcsEndAction' );
      PVcsCurrentConnection := GetProcAddress( LibHandle, 'TCDVcsCurrentConnection' );
      PVcsAddConnection := GetProcAddress( LibHandle, 'TCDVcsAddConnection' );
      PVcsUpdateConnection := GetProcAddress( LibHandle, 'TCDVcsUpdateConnection' );
      PVcsGetFolderInfo := GetProcAddress( LibHandle, 'TCDVcsGetFolderInfo' );
      PVcsDeleteConnection := GetProcAddress( LibHandle, 'TCDVcsDeleteConnection' );
      PVcsEnumConnections := GetProcAddress( LibHandle, 'TCDVcsEnumConnections' );
      PVcsEnumViews := GetProcAddress( LibHandle, 'TCDVcsEnumViews' );
      PVcsGetAddinInfo := GetProcAddress( LibHandle, 'TCDVcsGetAddinInfo' );
      PVcsEnumProjects := GetProcAddress( LibHandle, 'TCDVcsEnumProjects' );
      PVcsEnumFolders := GetProcAddress( LibHandle, 'TCDVcsEnumFolders' );
      PVcsEnumFiles := GetProcAddress( LibHandle, 'TCDVcsEnumFiles' );
      PVcsEnumNewFiles := GetProcAddress( LibHandle, 'TCDVcsEnumNewFiles' );
      PVcsEnumRevisions := GetProcAddress( LibHandle, 'TCDVcsEnumRevisions' );
      PVcsEnumLabels := GetProcAddress( LibHandle, 'TCDVcsEnumLabels' );
      PVcsSetView := GetProcAddress( LibHandle, 'TCDVcsSetView' );
      PVcsDeleteView := GetProcAddress( LibHandle, 'TCDVcsDeleteView' );
      PVcsAddView := GetProcAddress( LibHandle, 'TCDVcsAddView' );
      PVcsUpdateView := GetProcAddress( LibHandle, 'TCDVcsUpdateView' );
      PVcsAddProject := GetProcAddress( LibHandle, 'TCDVcsAddProject' );
      PVcsRenameProject := GetProcAddress( LibHandle, 'TCDVcsRenameProject' );
      PVcsDeleteProject := GetProcAddress( LibHandle, 'TCDVcsDeleteProject' );
      PVcsAddFolder := GetProcAddress( LibHandle, 'TCDVcsAddFolder' );
      PVcsRenameFolder := GetProcAddress( LibHandle, 'TCDVcsRenameFolder' );
      PVcsDeleteFolder := GetProcAddress( LibHandle, 'TCDVcsDeleteFolder' );
      PVcsDeleteFile := GetProcAddress( LibHandle, 'TCDVcsDeleteFile' );
      PVcsRemoveObject := GetProcAddress( LibHandle, 'TCDVcsRemoveObject' );
      PVcsAddVersionLabel := GetProcAddress( LibHandle, 'TCDVcsAddVersionLabel' );
      PVcsAddVersionLabelEx := GetProcAddress( LibHandle, 'TCDVcsAddVersionLabelEx' );
      PVcsDeleteVersionLabel := GetProcAddress( LibHandle, 'TCDVcsDeleteVersionLabel' );
      PVcsModifyVersionLabel := GetProcAddress( LibHandle, 'TCDVcsModifyVersionLabel' );
      PVcsAttachVersionLabel := GetProcAddress( LibHandle, 'TCDVcsAttachVersionLabel' );
      PVcsDetachVersionLabel := GetProcAddress( LibHandle, 'TCDVcsDetachVersionLabel' );
      PVcsPromote := GetProcAddress( LibHandle, 'TCDVcsPromote' );
      PVcsNextPromotionLabel := GetProcAddress( LibHandle, 'TCDVcsNextPromotionLabel' );
      PVcsFileStatus := GetProcAddress( LibHandle, 'TCDVcsFileStatus' );
      PVcsGetFileID := GetProcAddress( LibHandle, 'TCDVcsGetFileID' );
      PVcsGetFileWorkingPath := GetProcAddress( LibHandle, 'TCDVcsGetFileWorkingPath' );
      PVcsGetFileCheckoutPath := GetProcAddress( LibHandle, 'TCDVcsGetFileCheckoutPath' );
      PVcsGetFileGroupExt := GetProcAddress( LibHandle, 'TCDVcsGetFileGroupExt' );
      PVcsChangeFileExt := GetProcAddress( LibHandle, 'TCDVcsChangeFileExt' );
      PVcsGetFileGroupExtensions := GetProcAddress( LibHandle, 'TCDVcsGetFileGroupExtensions' );
      PVcsCheckInFile := GetProcAddress( LibHandle, 'TCDVcsCheckInFile' );
      PVcsCheckInFileEx := GetProcAddress( LibHandle, 'TCDVcsCheckInFileEx' );
      PVcsCheckOutFile := GetProcAddress( LibHandle, 'TCDVcsCheckOutFile' );
      PVcsUncheckOutFile := GetProcAddress( LibHandle, 'TCDVcsUncheckOutFile' );
      PVcsSetMergeInfo := GetProcAddress( LibHandle, 'TCDVcsSetMergeInfo' );
      PVcsGetCommonRoot := GetProcAddress( LibHandle, 'TCDVcsGetCommonRoot' );
      PVcsGetBranchInfo := GetProcAddress( LibHandle, 'TCDVcsGetBranchInfo' );
      PVcsShareFile := GetProcAddress( LibHandle, 'TCDVcsShareFile' );
      PVcsUnshareFile := GetProcAddress( LibHandle, 'TCDVcsUnshareFile' );
      PVcsMoveFile := GetProcAddress( LibHandle, 'TCDVcsMoveFile' );
      PVcsLock := GetProcAddress( LibHandle, 'TCDVcsLock' );
      PVcsDisconnect := GetProcAddress( LibHandle, 'TCDVcsDisconnect' );
      // Internal (SCC API)
      PTCVcsSccSelectProject := GetProcAddress( LibHandle, 'TCVcsSccSelectProject' );
      PTCVcsSccProjectInfoByName := GetProcAddress( LibHandle, 'TCVcsSccProjectInfoByName' );
      PTCVcsSccCheckInFilesEx := GetProcAddress( LibHandle, 'TCVcsSccCheckInFilesEx' );
      PTCVcsSccIsFileArchived := GetProcAddress( LibHandle, 'TCVcsSccIsFileArchived' );
      PTCVcsForceCheckinComments := GetProcAddress( LibHandle, 'TCVcsForceCheckinComments' );
      PTCVcsSccQuickDiff := GetProcAddress( LibHandle, 'TCVcsSccQuickDiff' );
      PTCVcsSccUndoCheckOutFiles := GetProcAddress( LibHandle, 'TCVcsSccUndoCheckOutFiles' );
      PTCVcsSccRemoveFiles := GetProcAddress( LibHandle, 'TCVcsSccRemoveFiles' );
      PTCVcsSccCheckOutFilesEx := GetProcAddress( LibHandle, 'TCVcsSccCheckOutFilesEx' );
      PTCVcsSccGetFileStatusEx := GetProcAddress( LibHandle, 'TCVcsSccGetFileStatusEx' );
      PTCSelectFiles := GetProcAddress( LibHandle, 'TCSelectFiles' );
      PTCVcsSetCaller := GetProcAddress( LibHandle, 'TCVcsSetCaller' );
      // Import/Export
      PVcsBeginExport := GetProcAddress( LibHandle, 'TCDVcsBeginExport' );
      PVcsGetExportProgress := GetProcAddress( LibHandle, 'TCDVcsGetExportProgress' );
      PVcsGetExportResult := GetProcAddress( LibHandle, 'TCDVcsGetExportResult' );
      PVcsGetExportSize := GetProcAddress( LibHandle, 'TCDVcsGetExportSize' );
      PVcsGetExportData := GetProcAddress( LibHandle, 'TCDVcsGetExportData' );
      PVcsEndExport := GetProcAddress( LibHandle, 'TCDVcsEndExport' );
      PVcsBeginImport := GetProcAddress( LibHandle, 'TCDVcsBeginImport' );
      PVcsSetImportData := GetProcAddress( LibHandle, 'TCDVcsSetImportData' );
      PVcsDoImport := GetProcAddress( LibHandle, 'TCDVcsDoImport' );
      PVcsGetImportProgress := GetProcAddress( LibHandle, 'TCDVcsGetImportProgress' );
      PVcsGetImportResult := GetProcAddress( LibHandle, 'TCDVcsGetImportResult' );
      PVcsEndImport := GetProcAddress( LibHandle, 'TCDVcsEndImport' );
      // Backup
      PVcsBackup := GetProcAddress( LibHandle, 'VcsBackup' );
    end
    else
      raise Exception.Create( Format( 'Error Loading TC Interface: %s', [ APath ] ) );
  end
  else
    raise EGpvCannotLocateClient.Create( Format( 'Could not locate TC Client: %s', [ APath ] ) );
end;

// Non-UI stuff

function VcsBackup(): Integer;
begin
  if not Assigned( PVcsBackup ) then
    LoadIt;
  if not Assigned( PVcsBackup ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsBackup' );
  Result := PVcsBackup();
end;

// Wrapper function to extract Issues associated with Archives.
function VcsGetIssues( FileID: Cardinal; var Revisions, Issues: TCardinalArray ): Boolean;
var
  i: Integer;
  ValuePairs: TStrings;
  Rev, Issue: Cardinal;
begin
  // Revisions is the list of Revisions that the Issues are attached to
  // Issues is the list of associated Issues
  SetLength( Revisions, 0 );
  SetLength( Issues, 0 );
  ValuePairs := TStringList.Create;
  try
    Result := ( VcsGetAddinInfo( FileID, 'Tracker', ValuePairs ) = Err_OK ) and ( ValuePairs.Count > 0 );
    if Result then
    begin
      for i := 0 to ValuePairs.Count - 1 do
      try
        Issue := StrToInt( ValuePairs.Names[ i ] );
        Rev := StrToInt( ValuePairs.Values[ ValuePairs.Names[ i ] ] );
        SetLength( Revisions, Length( Revisions ) + 1 );
        Revisions[ High( Revisions ) ] := Rev;
        SetLength( Issues, Length( Issues ) + 1 );
        Issues[ High( Issues ) ] := Issue;
      except
        // Ignore dodgy data...
      end;
      if Length( Issues ) = 0 then
        Result := False;
    end;
  finally
    ValuePairs.Free;
  end;
end;

// Basic function that reads the Value Pairs for an associated Addin. For all the standard addins, eg
// Tracker, Information is stored against the object in the Extra field. This is formatted the same
// as an INI file and this function simply returns the section associated with AddinName
function VcsGetAddinInfo( ObjectID: Cardinal; AddinName: String; const ValuePairs: TStrings ): Integer;
var
  pInfo: PChar;
  Size, Sz: Integer;
begin                   
  if not Assigned( PVcsGetAddinInfo ) then
    LoadIt;
  if not Assigned( PVcsGetAddinInfo ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetAddinInfo' );
  Result := Err_OK;
  if Assigned( PVcsGetAddinInfo ) then
  begin
    ValuePairs.Clear;
    Size := 1024;
    GetMem( pInfo, Size );
    try
      Sz := Size;
      Result := PVcsGetAddinInfo( ObjectID, PChar( AddinName ), pInfo, Sz );
      if Result = Err_InsufficientSpaceForData then
      begin
        FreeMem( pInfo, Size );
        GetMem( pInfo, Sz );
        Size := Sz;
        Result := PVcsGetAddinInfo( ObjectID, PChar( AddinName ), pInfo, Sz );
      end;
      if Result = Err_OK then
        ValuePairs.Text := String( pInfo );
    finally
      FreeMem( pInfo, Size );
    end;
  end;
end;

function VcsErrorString( ErrorCode: Integer ): String;
var
  pMsg: PChar;
  Size, Sz: Integer;
begin
  Result := '';
  if not Assigned( PVcsErrorString ) then
    LoadIt;
  if not Assigned( PVcsErrorString ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsErrorString' );
  if Assigned( PVcsErrorString ) then
  begin
    Size := 0;
    PVcsErrorString( ErrorCode, nil, Size );
    GetMem( pMsg, Size );
    try
      Sz := Size;
      PVcsErrorString( ErrorCode, pMsg, Sz );
      SetLength( Result, StrLen( pMsg ) );
      Result := String( pMsg );
    finally
      FreeMem( pMsg, Size );
    end;
  end;
end;

procedure VcsBeginAction( ActionRef: Integer; Action: Word );
begin
  if not Assigned( PVcsBeginAction ) then
    LoadIt;
  if not Assigned( PVcsBeginAction ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsBeginAction' );
  PVcsBeginAction( ActionRef, Action );
end;

procedure VcsEndAction( ActionRef: Integer; Action: Word );
begin
  if not Assigned( PVcsEndAction ) then
    LoadIt;
  if not Assigned( PVcsEndAction ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEndAction' );
  PVcsEndAction( ActionRef, Action );
end;

function VcsNextPromotionLabel( var PromotionID: Cardinal; var PromotionLabel: String ): Integer;
var
  pLabel: PChar;
begin
  if not Assigned( PVcsNextPromotionLabel ) then
    LoadIt;
  if not Assigned( PVcsNextPromotionLabel ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsNextPromotionLabel' );
  GetMem( pLabel, 1024 );
  try
    Result := PVcsNextPromotionLabel( PromotionID, pLabel );
    SetLength( PromotionLabel, StrLen( pLabel ) );
    PromotionLabel := String( pLabel );
  finally
    FreeMem( pLabel, 1024 );
  end;
end;

function VcsPromote( FileID, PromotionID: Cardinal ): Integer;
begin
  if not Assigned( PVcsPromote ) then
    LoadIt;
  if not Assigned( PVcsPromote ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsPromote' );
  Result := PVcsPromote( FileID, PromotionID );
end;

function VcsShareFile( var NewFileID: Cardinal; SourceFileID, TargetFolderID: Cardinal ): Integer;
begin
  if not Assigned( PVcsShareFile ) then
    LoadIt;
  if not Assigned( PVcsShareFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsShareFile' );
  Result := PVcsShareFile( NewFileID, SourceFileID, TargetFolderID );
end;

function VcsUnshareFile( FileID: Cardinal ): Integer;
begin
  if not Assigned( PVcsUnshareFile ) then
    LoadIt;
  if not Assigned( PVcsUnshareFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsUnshareFile' );
  Result := PVcsUnshareFile( FileID );
end;

function VcsLock( FileID, RevisionID: Cardinal; FullPath, LockComments: String; Lock, UpdateStatusOnLock: Boolean ): Integer;
begin
  if not Assigned( PVcsLock ) then
    LoadIt;
  if not Assigned( PVcsLock ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsLock' );
  Result := PVcsLock( FileID, RevisionID, PChar( FullPath ), PChar( LockComments), Lock, UpdateStatusOnLock );
end;

function VcsMoveFile( SourceFileID, TargetFolderID: Cardinal ): Integer;
begin
  if not Assigned( PVcsMoveFile ) then
    LoadIt;
  if not Assigned( PVcsMoveFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsMoveFile' );
  Result := PVcsMoveFile( SourceFileID, TargetFolderID );
end;

function VcsUncheckOutFile( FileID: Cardinal ): Integer;
begin
  if not Assigned( PVcsUncheckOutFile ) then
    LoadIt;
  if not Assigned( PVcsUncheckOutFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsUncheckOutFile' );
  Result := PVcsUncheckOutFile( FileID );
end;

function VcsCheckInFile( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; FileName: String; CheckInInfo: PCheckInInfo ): Integer;
begin
  if not Assigned( PVcsCheckInFile ) then
    LoadIt;
  if not Assigned( PVcsCheckInFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsCheckInFile' );
  Result := PVcsCheckInFile( ProjID, FolderID, FileID, RevisionID, PChar( FileName ), CheckInInfo );
end;

function VcsCheckInFileEx( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; FileName, SourceFile: String; DateTimeOverride: TDateTime; CheckInInfo: PCheckInInfo; UserOverride: String = '' ): Integer;
begin
  if not Assigned( PVcsCheckInFileEx ) then
    LoadIt;
  if not Assigned( PVcsCheckInFileEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsCheckInFileEx' );
  Result := PVcsCheckInFileEx( ProjID, FolderID, FileID, RevisionID, PChar( FileName ), PChar( SourceFile ), PChar( UserOverride ), DateTimeToFileDate( DateTimeOverride ), CheckInInfo );
end;

function VcsCheckOutFile( FileID: Cardinal; var RevisionID: Cardinal; CheckOutInfo: PCheckOutInfo ): Integer;
begin
  if not Assigned( PVcsCheckOutFile ) then
    LoadIt;
  if not Assigned( PVcsCheckOutFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsCheckOutFile' );
  Result := PVcsCheckOutFile( FileID, RevisionID, CheckOutInfo );
end;

function VcsGetFileID( var FileID: Cardinal; FilePath: String ): Integer;
begin
  if not Assigned( PVcsGetFileID ) then
    LoadIt;
  if not Assigned( PVcsGetFileID ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFileID' );
  Result := PVcsGetFileID( FileID, PChar( FilePath ) );
end;

function VcsGetFolderInfo( FolderID: Cardinal; var FolderName, TCPath, LocalFolder, Extra: String; var ParentID: Cardinal; var FolderCount, FileCount: Integer ): Integer;
var
  pName, pTCPath, pLocalFolder, pExtra: PChar;
begin
  if not Assigned( PVcsGetFolderInfo ) then
    LoadIt;
  if not Assigned( PVcsGetFolderInfo ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFolderInfo' );
  GetMem( pName, 512 );
  try
    GetMem( pTCPath, 2048 );
    try
      GetMem( pLocalFolder, 2048 );
      try
        GetMem( pExtra, 65536 );
        try
          Result := PVcsGetFolderInfo( FolderID, pName, pTCPath, pLocalFolder, pExtra, ParentID, FolderCount, FileCount );
          if Result = Err_OK then
          begin
            SetLength( FolderName, StrLen( pName ) );
            FolderName := String( pName );
            SetLength( TCPath, StrLen( pTCPath ) );
            TCPath := String( pTCPath );
            SetLength( LocalFolder, StrLen( pLocalFolder ) );
            LocalFolder := String( pLocalFolder );
            SetLength( Extra, StrLen( pExtra ) );
            Extra := String( pExtra );
          end
          else
          begin
            FolderName := '';
            TCPath := '';
            LocalFolder := '';
            Extra := '';
            ParentID := 0;
            FolderCount := 0;
            FileCount := 0;
          end;
        finally
          FreeMem( pExtra, 65536 );
        end;
      finally
        FreeMem( pLocalFolder, 2048 );
      end;
    finally
      FreeMem( pTCPath, 2048 );
    end;
  finally
    FreeMem( pName, 512 );
  end;
end;

function VcsGetFileGroupExtensions( FileName: String; var Ext: String ): Integer;
var
  pExt: PChar;
begin
  if not Assigned( PVcsGetFileGroupExtensions ) then
    LoadIt;
  if not Assigned( PVcsGetFileGroupExtensions ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFileGroupExtensions' );
  GetMem( pExt, 512 );
  try
    Ext := ExtractFileExt( FileName );
    Result := PVcsGetFileGroupExtensions( PChar( FileName ), pExt );
    if Result = Err_OK then
    begin
      SetLength( Ext, StrLen( pExt ) );
      Ext := String( pExt );
    end;
  finally
    FreeMem( pExt, 512 );
  end;
end;

function VcsChangeFileExt( Original, NewExt: String ): string;
var
  Res: Integer;
  pResult: PChar;
begin
  if not Assigned( PVcsChangeFileExt ) then
    LoadIt;
  if not Assigned( PVcsChangeFileExt ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsChangeFileExt' );
  GetMem( pResult, 1024 );
  try
    Res := PVcsChangeFileExt( PChar( Original ), PChar( NewExt ), pResult );
    if Res = Err_OK then
    begin
      SetLength( Result, StrLen( pResult ) );
      Result := String( pResult );
    end
    else
      Result := ChangeFileExt( Original, NewExt );
  finally
    FreeMem( pResult, 1024 );
  end;
end;

function VcsGetFileGroupExt( FileName: String; var Ext: String ): Integer;
var
  pExt: PChar;
begin
  if not Assigned( PVcsGetFileGroupExt ) then
    LoadIt;
  if not Assigned( PVcsGetFileGroupExt ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFileGroupExt' );
  GetMem( pExt, 512 );
  try
    Ext := ExtractFileExt( FileName );
    Result := PVcsGetFileGroupExt( PChar( FileName ), pExt );
    if Result = Err_OK then
    begin
      SetLength( Ext, StrLen( pExt ) );
      Ext := String( pExt );
    end;
  finally
    FreeMem( pExt, 512 );
  end;
end;

function VcsGetFileCheckoutPath( FileID: Cardinal; var LockedRevision: Cardinal; var FullPath: String; var BranchedFrom, BranchTip: Cardinal ): Integer;
var
  pFilePath: PChar;
begin
  if not Assigned( PVcsGetFileCheckoutPath ) then
    LoadIt;
  if not Assigned( PVcsGetFileCheckoutPath ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFileCheckoutPath' );
  GetMem( pFilePath, 1024 );
  try
    FullPath := '';
    Result := PVcsGetFileCheckoutPath( FileID, LockedRevision, pFilePath, BranchedFrom, BranchTip );
    if Result = Err_OK then
    begin
      SetLength( FullPath, StrLen( pFilePath ) );
      FullPath := String( pFilePath );
    end;
  finally
    FreeMem( pFilePath, 1024 );
  end;
end;

function VcsGetFileWorkingPath( FileID: Cardinal; var Path: String ): Integer;
var
  pFilePath: PChar;
begin
  if not Assigned( PVcsGetFileWorkingPath ) then
    LoadIt;
  if not Assigned( PVcsGetFileWorkingPath ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFileWorkingPath' );
  GetMem( pFilePath, 1024 );
  try
    Path := '';
    Result := PVcsGetFileWorkingPath( FileID, pFilePath );
    if Result = Err_OK then
    begin
      SetLength( Path, StrLen( pFilePath ) );
      Path := String( pFilePath );
    end;
  finally
    FreeMem( pFilePath, 1024 );
  end;
end;

function VcsFileStatus( var ParentID, FileID: Cardinal; var FilePath, LockedBy: String; var Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; var IsVirtual, Frozen: Boolean ): Integer;
var
  pFilePath, pLockedBy: PChar;
begin
  if not Assigned( PVcsFileStatus ) then
    LoadIt;
  if not Assigned( PVcsFileStatus ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsFileStatus' );
  GetMem( pFilePath, 1024 );
  try
    GetMem( pLockedBy, 1024 );
    try
      StrCopy( pFilePath, PChar( FilePath ) );
      Result := PVcsFileStatus( ParentID, FileID, pFilePath, pLockedBy, Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status, IsVirtual, Frozen );
      if Result = Err_OK then
      begin
        SetLength( FilePath, StrLen( pFilePath ) );
        FilePath := String( pFilePath );
        SetLength( LockedBy, StrLen( pLockedBy ) );
        LockedBy := String( pLockedBy );
      end;
    finally
      FreeMem( pLockedBy, 1024 );
    end;
  finally
    FreeMem( pFilePath, 1024 );
  end;
end;

function VcsAttachVersionLabel( FileID, RevisionID, VersionID: Cardinal; CanMove: Boolean ): Integer;
begin
  if not Assigned( PVcsAttachVersionLabel ) then
    LoadIt;
  if not Assigned( PVcsAttachVersionLabel ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAttachVersionLabel' );
  Result := PVcsAttachVersionLabel( FileID, RevisionID, VersionID, CanMove );
end;

function VcsDetachVersionLabel( FileID, RevisionID, VersionID: Cardinal ): Integer;
begin
  if not Assigned( PVcsDetachVersionLabel ) then
    LoadIt;
  if not Assigned( PVcsDetachVersionLabel ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDetachVersionLabel' );
  Result := PVcsDetachVersionLabel( FileID, RevisionID, VersionID );
end;

function VcsAddVersionLabel( var LabelID: Cardinal; Name, Comments: String ): Integer;
begin
  if not Assigned( PVcsAddVersionLabel ) then
    LoadIt;
  if not Assigned( PVcsAddVersionLabel ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddVersionLabel' );
  Result := PVcsAddVersionLabel( LabelID, PChar( Name ), PChar( Comments ) );
end;

function VcsAddVersionLabelEx( var LabelID: Cardinal; Name, Comments: String; ProjectID: Cardinal ): Integer;
begin
  if not Assigned( PVcsAddVersionLabelEx ) then
    LoadIt;
  if not Assigned( PVcsAddVersionLabelEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddVersionLabelEx' );
  Result := PVcsAddVersionLabelEx( LabelID, PChar( Name ), PChar( Comments ), ProjectID );
end;

function VcsDeleteVersionLabel( LabelID: Cardinal ): Integer;
begin
  if not Assigned( PVcsDeleteVersionLabel ) then
    LoadIt;
  if not Assigned( PVcsDeleteVersionLabel ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDeleteVersionLabel' );
  Result := PVcsDeleteVersionLabel( LabelID );
end;

function VcsModifyVersionLabel( LabelID: Cardinal; Name, Comments: String ): Integer;
begin
  if not Assigned( PVcsModifyVersionLabel ) then
    LoadIt;
  if not Assigned( PVcsModifyVersionLabel ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsModifyVersionLabel' );
  Result := PVcsModifyVersionLabel( LabelID, PChar( Name ), PChar( Comments ) );
end;

function VcsAddFolder( var FolderID: Cardinal; ParentID: Cardinal; Name, Path: String ): Integer;
begin
  if not Assigned( PVcsAddFolder ) then
    LoadIt;
  if not Assigned( PVcsAddFolder ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddFolder' );
  Result := PVcsAddFolder( FolderID, ParentID, PChar( Name ), PChar( Path ) );
end;

function VcsRenameFolder( FolderID: Cardinal; Name, Path: String; ReflectInSubFolders: Boolean ): Integer;
begin
  if not Assigned( PVcsRenameFolder ) then
    LoadIt;
  if not Assigned( PVcsRenameFolder ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsRenameFolder' );
  Result := PVcsRenameFolder( FolderID, PChar( Name ), PChar( Path ), ReflectInSubFolders );
end;

function VcsRemoveObject( ObjectID: Cardinal ): Integer;
begin
  if not Assigned( PVcsRemoveObject ) then
    LoadIt;
  if not Assigned( PVcsRemoveObject ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsRemoveObject' );
  Result := PVcsRemoveObject( ObjectID );
end;

function VcsDeleteFile( FileID: Cardinal ): Integer;
begin
  if not Assigned( PVcsDeleteFile ) then
    LoadIt;
  if not Assigned( PVcsDeleteFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDeleteFile' );
  Result := PVcsDeleteFile( FileID );
end;

function VcsDeleteFolder( FolderID: Cardinal ): Integer;
begin
  if not Assigned( PVcsDeleteFolder ) then
    LoadIt;
  if not Assigned( PVcsDeleteFolder ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDeleteFolder' );
  Result := PVcsDeleteFolder( FolderID );
end;

function VcsAddProject( var ProjID: Cardinal; Name: String ): Integer;
begin
  if not Assigned( PVcsAddProject ) then
    LoadIt;
  if not Assigned( PVcsAddProject ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddProject' );
  Result := PVcsAddProject( ProjID, PChar( Name ) );
end;

function VcsRenameProject( ProjID: Cardinal; Name: String ): Integer;
begin
  if not Assigned( PVcsRenameProject ) then
    LoadIt;
  if not Assigned( PVcsRenameProject ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsRenameProject' );
  Result := PVcsRenameProject( ProjID, PChar( Name ) );
end;

function VcsDeleteProject( ProjID: Cardinal ): Integer;
begin
  if not Assigned( PVcsDeleteProject ) then
    LoadIt;
  if not Assigned( PVcsDeleteProject ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDeleteProject' );
  Result := PVcsDeleteProject( ProjID );
end;

// This function will eventually retrieve the ID's of any associated objects for the passed FileID and extension type.
function VcsGetAssociations( FileID: Cardinal; Addin: String; IDs: TCardinalArray ): Boolean;
begin
  SetLength( IDs, 0 );
  Result := False;
  // Object associations and, indeed, any other information you want, can be stored in the Extra property of most objects.
  // In this case, we are interested in the Tracker Issues associated with the file. The format of the Extra information is
  // that of an INI file...
end;


function IntEnumProc( Context, Data: Pointer; pName, pDescription, pHost: PChar; Port: Integer; Current: Boolean ): Boolean; stdcall; forward;
function IntEnumViews( Context, Data: Pointer; pName, pDescription: PChar; ID: Cardinal; Shared, Current: Boolean ): Boolean; stdcall; forward;
function IntEnumProjects( Context, Data: Pointer; pName: PChar; ID: Cardinal ): Boolean; stdcall; forward;
function IntEnumFolders( Context, Data: Pointer; pName, pTCPath, pLocalFolder: PChar; ID, ParentID: Cardinal; FolderCount, FileCount: Integer ): Boolean; stdcall; forward;
function IntEnumFiles( Context, Data: Pointer; pName, pLocalPath, pLockedBy: PChar; ID, ParentID, AncestorID: Cardinal; Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; IsVirtual, Frozen: Boolean ): Boolean; stdcall; forward;
function IntEnumNewFiles( Context, Data: Pointer; pFullPath: PChar; ProjectID, FolderID: Cardinal ): Boolean; stdcall; forward;
function IntEnumRevisions( Context, Data: Pointer; pName, pAuthor, pComments, pLockedBy: PChar; ID, ParentID: Cardinal; Modified, Timestamp, CompressedSize, OriginalSize, CRC, VerCount, PromoCount: Integer ): Boolean; stdcall; forward;
function IntEnumLabels( Context, Data: Pointer; LabelType: Integer; pName, pComments: PChar; ID: Cardinal; Timestamp: Integer ): Boolean; stdcall; forward;

function VcsEnumLabels( RootID, RevID: Cardinal; LabelType: Integer; EnumProc: TEnumLabels; Data: Pointer ): Integer;
begin
  if not Assigned( PVcsEnumLabels ) then
    LoadIt;
  if not Assigned( PVcsEnumLabels ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumLabels' );
  Result := PVcsEnumLabels( RootID, RevID, LabelType, @EnumProc, Data, IntEnumLabels );
end;

function VcsEnumRevisions( FileID: Cardinal; EnumProc: TEnumRevisions; Data: Pointer ): Integer;
begin
  if not Assigned( PVcsEnumRevisions ) then
    LoadIt;
  if not Assigned( PVcsEnumRevisions ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumRevisions' );
  Result := PVcsEnumRevisions( FileID, @EnumProc, Data, IntEnumRevisions );
end;

function VcsEnumFiles( RootID: Cardinal; EnumProc: TEnumFiles; Data: Pointer; Recursive: Boolean ): Integer;
begin
  if not Assigned( PVcsEnumFiles ) then
    LoadIt;
  if not Assigned( PVcsEnumFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumFiles' );
  Result := PVcsEnumFiles( RootID, @EnumProc, Data, IntEnumFiles, Recursive );
end;

function VcsEnumNewFiles( RootID: Cardinal; EnumProc: TEnumNewFiles; Data: Pointer; Recursive: Boolean ): Integer;
begin
  if not Assigned( PVcsEnumNewFiles ) then
    LoadIt;
  if not Assigned( PVcsEnumNewFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumNewFiles' );
  Result := PVcsEnumNewFiles( RootID, @EnumProc, Data, IntEnumNewFiles, Recursive );
end;

function VcsEnumFolders( RootID: Cardinal; EnumProc: TEnumFolders; Data: Pointer; Recursive: Boolean ): Integer;
begin
  if not Assigned( PVcsEnumFolders ) then
    LoadIt;
  if not Assigned( PVcsEnumFolders ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumFolders' );
  Result := PVcsEnumFolders( RootID, @EnumProc, Data, IntEnumFolders, Recursive );
end;

function VcsEnumProjects( EnumProc: TEnumProjects; Data: Pointer ): Integer;
begin
  if not Assigned( PVcsEnumProjects ) then
    LoadIt;
  if not Assigned( PVcsEnumProjects ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumProjects' );
  Result := PVcsEnumProjects( @EnumProc, Data, IntEnumProjects );
end;

function VcsEnumViews( EnumProc: TEnumViews; Data: Pointer ): Integer;
begin
  if not Assigned( PVcsEnumViews ) then
    LoadIt;
  if not Assigned( PVcsEnumViews ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumViews' );
  Result := PVcsEnumViews( @EnumProc, Data, IntEnumViews );
end;

function VcsGetCommonRoot( FileID, Revision1, Revision2: Cardinal; var CommonRevision: Cardinal ): Integer;
begin
  if not Assigned( PVcsGetCommonRoot ) then
    LoadIt;
  if not Assigned( PVcsGetCommonRoot ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetCommonRoot' );
  Result := PVcsGetCommonRoot( FileID, Revision1, Revision2, CommonRevision );
end;

function VcsGetBranchInfo( FileID, RevisionID: Cardinal; var BranchedFrom, BranchTip: Cardinal ): Integer;
begin
  if not Assigned( PVcsGetBranchInfo ) then
    LoadIt;
  if not Assigned( PVcsGetBranchInfo ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetBranchInfo' );
  Result := PVcsGetBranchInfo( FileID, RevisionID, BranchedFrom, BranchTip );
end;

function VcsSetMergeInfo( FileID, RevisionID, MergedFrom: Cardinal ): Integer;
begin
  if not Assigned( PVcsSetMergeInfo ) then
    LoadIt;
  if not Assigned( PVcsSetMergeInfo ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsSetMergeInfo' );
  Result := PVcsSetMergeInfo( FileID, RevisionID, MergedFrom );
end;

function VcsEnumConnections( EnumProc: TEnumConnections; Data: Pointer ): Integer;
begin
  if not Assigned( PVcsEnumConnections ) then
    LoadIt;
  if not Assigned( PVcsEnumConnections ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumConnections' );
  Result := PVcsEnumConnections( @EnumProc, Data, IntEnumProc );
end;

function VcsAddConnection( Name, Description, Host: String; Port: Integer; Params: String; var Msg: String ): Boolean;
var
  pMsg: PChar;
begin
  if not Assigned( PVcsAddConnection ) then
    LoadIt;
  if not Assigned( PVcsAddConnection ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddConnection' );
  GetMem( pMsg, 1024 );
  try
    Result := PVcsAddConnection( PChar( Name ), PChar( Description ), PChar( Host ), Port, PChar( Params ), pMsg );
    SetLength( Msg, StrLen( pMsg ) );
    Msg := String( pMsg );
  finally
    FreeMem( pMsg, 1024 );
  end;
end;

function VcsUpdateConnection( Name: String; Params: String; var Msg: String ): Boolean;
var
  pMsg: PChar;
begin
  if not Assigned( PVcsUpdateConnection ) then
    LoadIt;
  if not Assigned( PVcsUpdateConnection ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsUpdateConnection' );
  GetMem( pMsg, 1024 );
  try
    Result := PVcsUpdateConnection( PChar( Name ), PChar( Params ), pMsg );
    SetLength( Msg, StrLen( pMsg ) );
    Msg := String( pMsg );
  finally
    FreeMem( pMsg, 1024 );
  end;
end;

function VcsDeleteConnection( Name: String; var Msg: String ): Boolean;
var
  pMsg: PChar;
begin
  if not Assigned( PVcsDeleteConnection ) then
    LoadIt;
  if not Assigned( PVcsDeleteConnection ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDeleteConnection' );
  GetMem( pMsg, 1024 );
  try
    Result := PVcsDeleteConnection( PChar( Name ), pMsg );
    SetLength( Msg, StrLen( pMsg ) );
    Msg := String( pMsg );
  finally
    FreeMem( pMsg, 1024 );
  end;
end;

function VcsAddView( var ViewID: Cardinal; ViewName, Description, Projects: String; BasisID: Cardinal; Shared: Boolean ): Integer;
begin
  if not Assigned( PVcsAddView ) then
    LoadIt;
  if not Assigned( PVcsAddView ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddView' );
  Result := PVcsAddView( ViewID, PChar( ViewName ), PChar( Description ), PChar( Projects ), BasisID, Shared );
end;

function VcsUpdateView( ViewID: Cardinal; ViewName, Description, Projects: String; BasisID: Cardinal; Shared: Boolean ): Integer;
begin
  if not Assigned( PVcsUpdateView ) then
    LoadIt;
  if not Assigned( PVcsUpdateView ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsUpdateView' );
  Result := PVcsUpdateView( ViewID, PChar( ViewName ), PChar( Description ), PChar( Projects ), BasisID, Shared );
end;

function VcsSetView( ViewID: Cardinal ): Integer;
begin
  if not Assigned( PVcsSetView ) then
    LoadIt;
  if not Assigned( PVcsSetView ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsSetView' );
  Result := PVcsSetView( ViewID );
end;

function VcsDeleteView( ViewID: Cardinal ): Integer;
begin
  if not Assigned( PVcsDeleteView ) then
    LoadIt;
  if not Assigned( PVcsDeleteView ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDeleteView' );
  Result := PVcsDeleteView( ViewID );
end;

function VcsConnect( const Connection, Name, Password: String ): Integer;
begin
  if not Assigned( PVcsConnect ) then
    LoadIt;
  if not Assigned( PVcsConnect ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsConnect' );
  Result := PVcsConnect( PChar( Connection ), PChar( Name ), PChar( Password ) );
end;

procedure VcsCurrentConnection( var Connection, Username: String; var Connected: Boolean );
var
  pConnection, pUsername: PChar;
begin
  if not Assigned( PVcsCurrentConnection ) then
    LoadIt;
  if not Assigned( PVcsCurrentConnection ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsCurrentConnection' );
  GetMem( pConnection, 255 );
  try
    GetMem( pUsername, 255 );
    try
      PVcsCurrentConnection( pConnection, pUsername, Connected );
      SetLength( Connection, StrLen( pConnection ) );
      Connection := String( pConnection );
      SetLength( Username, StrLen( pUsername ) );
      Username := String( pUsername );
    finally
      FreeMem( pUsername, 255 );
    end;
  finally
    FreeMem( pConnection, 255 );
  end;
end;

function VcsDisconnect: Integer;
begin
  if not Assigned( PVcsDisconnect ) then
    LoadIt;
  if not Assigned( PVcsDisconnect ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDisconnect' );
  Result := PVcsDisconnect;
end;

// UI Stuff

// Displays the Archive Manager in a separate instance and
// Selects the passed Connection and View, then selects the
// folder containing the passed in filename
procedure TCVcsShowArchiveManagerEx( AConnection, AView, AFile: String );
var
  AnID: Cardinal;
  Cmd: String;
begin
  // Show the Archive Manager as a separate application...
  AnID := TCVcsGetFileID( AFile );
  Cmd := AddBackslash( LibPath ) + 'TCMain.exe';
  if AnID > 0 then
    WinExecAndWait( PChar( Cmd ), PChar( Format( '/R="%s" /V="%s" /Select=%d', [ AConnection, AView, AnID ] ) ), sw_ShowNormal, 0, False )
  else
    WinExecAndWait( PChar( Cmd ), PChar( Format( '/R="%s" /V="%s"', [ AConnection, AView ] ) ), sw_ShowNormal, 0, False )
end;

// Displays the Archive Manager in a separate instance and
// Selects the folder containing the passed in filename
procedure TCVcsShowArchiveManager( AFile: String );
var
  AnID: Cardinal;
  Cmd: String;
begin
  // Show the Archive Manager as a separate application...
  AnID := TCVcsGetFileID( AFile );
  Cmd := AddBackslash( LibPath ) + 'TCMain.exe';
  if AnID > 0 then
    WinExecAndWait( PChar( Cmd ), PChar( '/Select=' + IntToStr( AnID ) ), sw_ShowNormal, 0, False )
  else
    WinExecAndWait( PChar( Cmd ), '', sw_ShowNormal, 0, False );
end;

// Reloads the internal cache. Should be used
// sparingly
procedure TCVcsRefreshCache;
begin
  if not Assigned( PTCVcsRefreshCache ) then
    LoadIt;
  if not Assigned( PTCVcsRefreshCache ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsRefreshCache' );
  PTCVcsRefreshCache;
end;

// Displays the Help/About box
procedure TCVcsAbout;
begin
  if not Assigned( PTCVcsAbout ) then
    LoadIt;
  if not Assigned( PTCVcsAbout ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsAbout' );
  PTCVcsAbout;
end;

// Initializes the internal structures and optionally loads the cache
// Note that LoadCache is normally set to True
function TCVcsInitialize( Handle: Cardinal ): Integer;
begin
  if not Assigned( PTCVcsInitialize ) then
    LoadIt;
  if not Assigned( PTCVcsInitialize ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsInitialize' );
  Result := PTCVcsInitialize( Handle, True, nil );
end;

// Displays a dialog box to select an object from the repository.
function TCVcsBrowseFolder( ACaption, Description, FileMask: String; DlgType: Word; var AnID: Cardinal; var ObjectName: String; CanSelectProject: Boolean ): Boolean;
var
  pObjectName: PChar;
begin
  if not Assigned( PTCVcsBrowseFolder ) then
    LoadIt;
  if not Assigned( PTCVcsBrowseFolder ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsBrowseFolder' );
  GetMem( pObjectName, 1024 );
  try
    Result := PTCVcsBrowseFolder( PChar( ACaption ), PChar( Description ), PChar( FileMask ), DlgType, AnID, pObjectName, CanSelectProject );
    SetLength( ObjectName, StrLen( pObjectName ) );
    ObjectName := String( pObjectName );
  finally
    FreeMem( pObjectName, 1024 );
  end;
end;

procedure TCVcsAutoUpdateCache( Enable: Boolean );
begin
  if not Assigned( PTCVcsAutoUpdateCache ) then
    LoadIt;
  if not Assigned( PTCVcsAutoUpdateCache ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsAutoUpdateCache' );
  PTCVcsAutoUpdateCache( Enable );
end;

// Checks in a file. If AddNew is True, and the file is not already
// archived, it will be added to the repository
function TCVcsCheckInFile( AFile: String; AddNew: Boolean ): Integer;
var
  Files: TStrings;
begin
  Files := TStringList.Create;
  try
    Files.Add( AFile );
    Result := TCVcsCheckInFiles( Files, AddNew, False );
  finally
    Files.Free;
  end;
end;

// Displays the CheckOut dialog and then checks out the file. If Lock is
// False, the Get dialog will be displayed
function TCVcsCheckOutFile( AFile: String; Lock: Boolean ): Integer;
var
  Files: TStrings;
begin
  Files := TStringList.Create;
  try
    Files.Add( AFile );
    Result := TCVcsCheckOutFiles( Files, Lock );
  finally
    Files.Free;
  end;
end;

// Undoes the last checkout of the specified file.
function TCVcsUndoCheckOutFile( AFile: String ): Integer;
var
  Files: TStrings;
begin
  Files := TStringList.Create;
  try
    Files.Add( AFile );
    Result := TCVcsUndoCheckOutFiles( Files );
  finally
    Files.Free;
  end;
end;

// Locks or unlocks the passed file
function TCVcsLockFile( AFile: String; Lock: Boolean ): Integer;
begin
  if not Assigned( PTCVcsLockFile ) then
    LoadIt;
  if not Assigned( PTCVcsLockFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsLockFile' );
  Result := PTCVcsLockFile( PChar( AFile ), Lock );
end;

// Renames the file, specified by FileID to the NewName. This does not
// affect the local file.
// FileID can be located by a call to TCVcsGetFileID
function TCVcsRenameFile( FileID: Cardinal; NewName: String ): Integer;
begin
  if not Assigned( PTCVcsRenameFile ) then
    LoadIt;
  if not Assigned( PTCVcsRenameFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsRenameFile' );
  Result := PTCVcsRenameFile( FileID, PChar( NewName ) );
end;

// Returns True if the file referenced by FileID is locked but the current user
// FileID can be located by a call to TCVcsGetFileID
function TCVcsHaveLock( FileID: Cardinal ): Boolean;
begin
  if not Assigned( PTCVcsHaveLock ) then
    LoadIt;
  if not Assigned( PTCVcsHaveLock ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsHaveLock' );
  Result := PTCVcsHaveLock( FileID );
end;

// Returns the status of the file referenced by FileID
// FileID can be located by a call to TCVcsGetFileID
function TCVcsGetFileStatus( FileID: Cardinal; var Locked, LockedByMe, MultipleLocks, Modified, OutOfDate: Boolean ): Boolean;
begin
  if not Assigned( PTCVcsGetFileStatus ) then
    LoadIt;
  if not Assigned( PTCVcsGetFileStatus ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetFileStatus' );
  Result := PTCVcsGetFileStatus( FileID, Locked, LockedByMe, MultipleLocks, Modified, OutOfDate );
end;

// Returns the status of the file referenced by FileID
// FileID can be located by a call to TCVcsGetFileID
// Extended to return the CheckinTimestamp of the tip
// revision for improved PowerBuilder support
function TCVcsGetFileStatusEx( FileID: Cardinal; var CheckedInTimestamp: Integer; var Locked, LockedByMe, MultipleLocks, Modified, OutOfDate: Boolean ): Boolean;
begin
  if not Assigned( PTCVcsGetFileStatusEx ) then
    LoadIt;
  if not Assigned( PTCVcsGetFileStatusEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetFileStatusEx' );
  Result := PTCVcsGetFileStatusEx( FileID, CheckedInTimestamp, Locked, LockedByMe, MultipleLocks, Modified, OutOfDate );
end;

// Creates a new project using AName. Does not prompt the user
function TCVcsCreateProject( var ProjID: Cardinal; AName: String ): Integer;
begin
  if not Assigned( PTCVcsCreateProject ) then
    LoadIt;
  if not Assigned( PTCVcsCreateProject ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsCreateProject' );
  Result := PTCVcsCreateProject( ProjID, PChar( AName ) );
end;

// Returns the UserName of the currently logged in user
function TCVcsCurrentUserName: String;
var
  pName: PChar;
begin
  if not Assigned( PTCVcsCurrentUserName ) then
    LoadIt;
  if not Assigned( PTCVcsCurrentUserName ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsCurrentUserName' );
  GetMem( pName, 255 );
  try
    if PTCVcsCurrentUserName( pName ) = Err_OK then
    begin
      SetLength( Result, StrLen( pName ) );
      Result := String( pName );
    end
    else
      Result := '';
  finally
    FreeMem( pName, 255 );
  end;
end;

// Given a project name, returns the object ID
function TCVcsProjectIDByName( AName: String ): Cardinal;
begin
  if not Assigned( PTCVcsProjectIDByName ) then
    LoadIt;
  if not Assigned( PTCVcsProjectIDByName ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsProjectIDByName' );
  Result := PTCVcsProjectIDByName( PChar( AName ) );
end;

// Returns the main file extension for the file passed in AFile
// For more info on file groups, check the help file
function TCVcsFileMainExtension( AFile: String ): String;
var
  pExt: PChar;
begin
  if not Assigned( PTCVcsFileMainExtension ) then
    LoadIt;
  if not Assigned( PTCVcsFileMainExtension ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsFileMainExtension' );
  GetMem( pExt, 255 );
  try
    if PTCVcsFileMainExtension( PChar( AFile ), pExt ) = Err_OK then
    begin
      SetLength( Result, StrLen( pExt ) );
      Result := String( pExt );
    end
    else
      Result := ExtractFileExt( AFile );
  finally
    FreeMem( pExt, 255 );
  end;
end;

// Returns the string representing the current repository
// connection
function TCVcsCurrentConnection: String;
var
  pName: PChar;
begin
  if not Assigned( PTCVcsCurrentConnection ) then
    LoadIt;
  if not Assigned( PTCVcsCurrentConnection ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsCurrentConnection' );
  GetMem( pName, 255 );
  try
    if PTCVcsCurrentConnection( pName ) = Err_OK then
    begin
      SetLength( Result, StrLen( pName ) );
      Result := String( pName );
    end
    else
      Result := '';
  finally
    FreeMem( pName, 255 );
  end;
end;

// Returns True if the passed file is archived. Also returns the ID of the
// file in the ID parameter
function TCVcsIsFileArchived( FileName: String; var ID: Cardinal ): Boolean;
begin
  if not Assigned( PTCVcsIsFileArchived ) then
    LoadIt;
  if not Assigned( PTCVcsIsFileArchived ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsIsFileArchived' );
  Result := PTCVcsIsFileArchived( PChar( FileName ), ID );
end;

// Checks in the files passed in FileList. If AddNew is True, and any of the
// files are not already archived, they will be added. This function displays
// the CheckIn dialog box
function TCVcsCheckInFiles( FileList: TStrings; AddNew, NewProject: Boolean ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsCheckInFiles ) then
    LoadIt;
  if not Assigned( PTCVcsCheckInFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsCheckInFiles' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsCheckInFiles( pFiles, AddNew, NewProject );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// Checks out / Gets the files passed in FileList. If Lock is True, The files will
// be Checked out, otherwise the action is a Get. This function displays
// the ChecOut dialog box
function TCVcsCheckOutFiles( FileList: TStrings; Lock: Boolean ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsCheckOutFiles ) then
    LoadIt;
  if not Assigned( PTCVcsCheckOutFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsCheckOutFiles' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsCheckOutFiles( pFiles, Lock );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// Performs an UndoCheckOut on the passed files
function TCVcsUndoCheckOutFiles( FileList: TStrings ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsUndoCheckOutFiles ) then
    LoadIt;
  if not Assigned( PTCVcsUndoCheckOutFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsUndoCheckOutFiles' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsUndoCheckOutFiles( pFiles );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// Removes the passed files from the project identified by the passed ProjectID
function TCVcsRemoveFiles( ProjectID: Cardinal; FileList: TStrings ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsRemoveFiles ) then
    LoadIt;
  if not Assigned( PTCVcsRemoveFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsRemoveFiles' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsRemoveFiles( ProjectID, pFiles );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// Displays the history report for the passed files
procedure TCVcsShowHistory( FileList: TStrings; OutFile: String = ''; Columns: Integer = hrNone; Version: Cardinal = 0; Promotion: Cardinal = 0;
                            FromVer: Cardinal = 0; ToVer: Cardinal = 0; FromDate: TDateTime = 0; ToDate: TDateTime = 0;
                            IncFromVersion: Boolean = False; FileDetails: Boolean = False; ShowNotes: Boolean = False );
var
  pFiles: PChar;
  Len: Integer;
  iFromDate, iToDate: Integer;
begin
  if not Assigned( PTCVcsShowHistory ) then
    LoadIt;
  if not Assigned( PTCVcsShowHistory ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsShowHistory' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    if FromDate <> 0 then
      iFromDate := DateTimeToFileDate( FromDate )
    else
      iFromDate := 0;
    if ToDate <> 0 then
      iToDate := DateTimeToFileDate( ToDate )
    else
      iToDate := 0;
    PTCVcsShowHistory( pFiles, PChar( OutFile ), Columns, Version, Promotion, FromVer, ToVer, iFromDate, iToDate, IncFromVersion, FileDetails, ShowNotes );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// Runs the File Compare utility.
procedure TCVcsShowWorkfileDifferences( FileName, Revision: String; ShowDiffs: Boolean; var Status: Integer );
begin
  if not Assigned( PTCVcsShowWorkfileDifferences ) then
    LoadIt;
  if not Assigned( PTCVcsShowWorkfileDifferences ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsShowWorkfileDifferences' );
  PTCVcsShowWorkfileDifferences( PChar( FileName ), PChar( Revision ), ShowDiffs, Status );
end;

// Displays the properties for the passed FileName
procedure TCVcsShowProperties( FileName: String );
begin
  if not Assigned( PTCVcsShowProperties ) then
    LoadIt;
  if not Assigned( PTCVcsShowProperties ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsShowProperties' );
  PTCVcsShowProperties( PChar( FileName ) );
end;

// Gets the object ID that represents the Version or Promotion level
// that the currently selected View is based upon.
function TCVcsGetViewBaseID: Cardinal;
begin
  if not Assigned( PTCVcsGetViewBaseID ) then
    LoadIt;
  if not Assigned( PTCVcsGetViewBaseID ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetViewBaseID' );
  Result := PTCVcsGetViewBaseID;
end;

// Gets the ID of the currently active View
function TCVcsGetViewID: Cardinal;
begin
  if not Assigned( PTCVcsGetViewID ) then
    LoadIt;
  if not Assigned( PTCVcsGetViewID ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetViewID' );
  Result := PTCVcsGetViewID;
end;

// Returns the object ID that represents the passed FileName
function TCVcsGetFileID( FileName: String ): Cardinal;
begin
  if not Assigned( PTCVcsGetFileID ) then
    LoadIt;
  if not Assigned( PTCVcsGetFileID ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetFileID' );
  Result := PTCVcsGetFileID( PChar( FileName ) );
end;

// Returns the list of defined views by name. The index of the currently active
// view is returned in ActiveIndex
procedure TCVcsGetViews( const Views: TStrings; var ActiveIndex: Integer );
var
  pViews: PChar;
begin
  if not Assigned( PTCVcsGetViews ) then
    LoadIt;
  if not Assigned( PTCVcsGetViews ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetViews' );
  GetMem( pViews, 65536 );
  try
    PTCVcsGetViews( pViews, ActiveIndex );
    SccGetListFromChars( pViews, Views );
  finally
    FreeMem( pViews, 65536 );
  end;
end;

// Login to the default repository
function TCVcsLogin: Boolean;
begin
  if not Assigned( PTCVcsLogin ) then
    LoadIt;
  if not Assigned( PTCVcsLogin ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsLogin' );
  Result := PTCVcsLogin;
  TCVcsShowConnectionInfo;
end;

// The following function is an internal function that is designed to handle file groups
// after files are imported from external VCS systems.
procedure TCVcsMergeGroups( Root: Cardinal; ShowProgress: Boolean; fbProc: TMergeFeedbackProc );
begin
  if not Assigned( PTCVcsMergeGroups ) then
    LoadIt;
  if not Assigned( PTCVcsMergeGroups ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsMergeGroups' );
  PTCVcsMergeGroups( Root, ShowProgress, fbProc );
end;

procedure TCVcsSelectConnectionEx( NewConnection: String; LoadCacheOnLoginFail, LoadCacheOnConnectFail: Boolean );
begin
  if not Assigned( PTCVcsSelectConnectionEx ) then
    LoadIt;
  if not Assigned( PTCVcsSelectConnectionEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSelectConnectionEx' );
  if NewConnection = '' then
  begin
    PTCVcsSelectConnection( nil );
    TCVcsShowConnectionInfo;
  end
  else
    PTCVcsSelectConnectionEx( PChar( NewConnection ), LoadCacheOnLoginFail, LoadCacheOnConnectFail );
end;

// Select a different connection to a repository
procedure TCVcsSelectConnection( NewConnection: String = '' );
begin
  if not Assigned( PTCVcsSelectConnection ) then
    LoadIt;
  if not Assigned( PTCVcsSelectConnection ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSelectConnection' );
  if NewConnection = '' then
  begin
    PTCVcsSelectConnection( nil );
    TCVcsShowConnectionInfo;
  end
  else
    PTCVcsSelectConnection( PChar( NewConnection ) );
end;

// Displays a dialog showing the current connection information
procedure TCVcsShowConnectionInfo;
begin
  if not Assigned( PTCVcsShowConnectionInfo ) then
    LoadIt;
  if not Assigned( PTCVcsShowConnectionInfo ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsShowConnectionInfo' );
  PTCVcsShowConnectionInfo;
end;

// Select a different View. The list of currently defined views
// can be retrieved by using TCVcsGetViews
function TCVcsSelectView( ViewName: String ): Integer;
begin
  if not Assigned( PTCVcsSelectView ) then
    LoadIt;
  if not Assigned( PTCVcsSelectView ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSelectView' );
  Result := PTCVcsSelectView( PChar( ViewName ) );
end;

// Once done with the DLL, call this to release internal
// memory structures.
procedure TCVcsRelease;
begin
  if Assigned( PTCVcsRelease ) then
  begin
    {$IFDEF DEBUGAPI}
    CodeSite.ExitMethod( 'Releasing API (UI)' );
    {$ENDIF}
    // Call the exported function...
    PTCVcsRelease;
    // ...then reset the function pointers
    PVcsBeginAction := nil;
    PVcsEndAction := nil;
    PTCVcsInitialize := nil;
    PTCVcsAutoUpdateCache := nil;
    PTCVcsBrowseFolder := nil;
    PTCVcsIsFileArchived := nil;
    PTCVcsCurrentUserName := nil;
    PTCVcsCreateProject := nil;
    PTCVcsSelectProject := nil;
    PTCSelectFiles := nil;
    PTCVcsSetCaller := nil;
    PTCVcsCurrentConnection := nil;
    PTCVcsFileMainExtension := nil;
    PTCVcsProjectIDByName := nil;
    PTCVcsGetFileList := nil;
    PTCVcsGetFileListForFolders := nil;
    PTCVcsGetFileStatus := nil;
    PTCVcsGetFileStatusEx := nil;
    PTCVcsGetObjectType := nil;
    PTCVcsHaveLock := nil;
    PTCVcsCheckInFiles := nil;
    PTCVcsLockFile := nil;
    PTCVcsGetCheckOutInfo := nil;
    PTCVcsGetCheckOutInfoEx := nil;
    PTCVcsGetCheckOutInfoScc := nil;
    PTCVcsGetCheckInInfo := nil;
    PTCVcsGetCheckInInfoEx := nil;
    PTCVcsGetCheckInInfoScc := nil;
    PTCVcsCheckOutFiles := nil;
    PTCVcsCheckOutFilesEx := nil;
    PTCVcsCheckInFilesEx := nil;
    PTCVcsUndoCheckOutFiles := nil;
    PTCVcsRemoveFiles := nil;
    PTCVcsRenameFile := nil;
    PTCVcsShowProperties := nil;
    PTCVcsShowWorkfileDifferences := nil;
    PTCVcsErrorString := nil;
    PTCVcsFolderIDByDisplayPath := nil;
    PTCVcsShowHelp := nil;
    PTCVcsShowHistory := nil;
    PTCVcsGetFileID := nil;
    PTCVcsGetViewBaseID := nil;
    PTCVcsGetViewID := nil;
    PTCVcsAbout := nil;
    PTCVcsRefreshCache := nil;
    PTCVcsGetViews := nil;
    PTCVcsSelectView := nil;
    PTCVcsSelectConnection := nil;
    PTCVcsMergeGroups := nil;
    PTCVcsSelectConnectionEx := nil;
    PTCVcsShowConnectionInfo := nil;
    PTCVcsLogin := nil;
    PTCVcsGetObjectVersions := nil;
    PTCVcsRelease := nil;
    // Non-UI
    PVcsConnect := nil;
    PVcsErrorString := nil;
    PVcsPromote := nil;
    PVcsNextPromotionLabel := nil;
    PVcsCurrentConnection := nil;
    PVcsAddConnection := nil;
    PVcsUpdateConnection := nil;
    PVcsDeleteConnection := nil;
    PVcsEnumConnections := nil;
    PVcsGetFolderInfo := nil;
    PVcsEnumViews := nil;
    PVcsGetAddinInfo := nil;
    PVcsEnumProjects := nil;
    PVcsEnumFolders := nil;
    PVcsEnumFiles := nil;
    PVcsEnumNewFiles := nil;
    PVcsEnumRevisions := nil;
    PVcsEnumLabels := nil;
    PVcsSetView := nil;
    PVcsDeleteView := nil;
    PVcsAddView := nil;
    PVcsUpdateView := nil;
    PVcsAddProject := nil;
    PVcsRenameProject := nil;
    PVcsDeleteProject := nil;
    PVcsAddFolder := nil;
    PVcsRenameFolder := nil;
    PVcsDeleteFolder := nil;
    PVcsDeleteFile := nil;
    PVcsRemoveObject := nil;
    PVcsAddVersionLabel := nil;
    PVcsAddVersionLabelEx := nil;
    PVcsDeleteVersionLabel := nil;
    PVcsModifyVersionLabel := nil;
    PVcsAttachVersionLabel := nil;
    PVcsDetachVersionLabel := nil;
    PVcsFileStatus := nil;
    PVcsGetFileID := nil;
    PVcsGetFileWorkingPath := nil;
    PVcsGetFileCheckoutPath := nil;
    PVcsGetFileGroupExt := nil;
    PVcsChangeFileExt := nil;
    PVcsGetFileGroupExtensions := nil;
    PVcsCheckInFile := nil;
    PVcsCheckInFileEx := nil;
    PVcsCheckOutFile := nil;
    PVcsUncheckOutFile := nil;
    PVcsSetMergeInfo := nil;
    PVcsGetCommonRoot := nil;
    PVcsGetBranchInfo := nil;
    PVcsShareFile := nil;
    PVcsUnshareFile := nil;
    PVcsMoveFile := nil;
    PVcsLock := nil;
    PVcsDisconnect := nil;
    // Internal (SCC API)
    PTCVcsSccSelectProject := nil;
    PTCVcsSccProjectInfoByName := nil;
    PTCVcsSccCheckInFilesEx := nil;
    PTCVcsSccIsFileArchived := nil;
    PTCVcsForceCheckinComments := nil;
    PTCVcsSccQuickDiff := nil;
    PTCVcsSccUndoCheckOutFiles := nil;
    PTCVcsSccGetFileStatusEx := nil;
    PTCVcsSccRemoveFiles := nil;
    PTCVcsSccCheckOutFilesEx := nil;
    // Import/Export
    PVcsBeginExport := nil;
    PVcsGetExportProgress := nil;
    PVcsGetExportResult := nil;
    PVcsGetExportSize := nil;
    PVcsGetExportData := nil;
    PVcsEndExport := nil;
    PVcsBeginImport := nil;
    PVcsSetImportData := nil;
    PVcsDoImport := nil;
    PVcsGetImportProgress := nil;
    PVcsGetImportResult := nil;
    PVcsEndImport := nil;
  end;
  // Finally, unload the DLL
  if ( LibHandle > 0 ) then
  begin
    FreeLibrary( LibHandle );
    LibHandle := 0;
  end;
end;

// Displays the CheckIn dialog. The pointer to the data structure should be initialized by
// calling InitializeCheckInInfo and, once finished with, destroyed using ReleaseCheckInInfo
function TCVcsGetCheckInInfo( const Info: PCheckInInfo ): Boolean;
begin
  if not Assigned( PTCVcsGetCheckInInfo ) then
    LoadIt;
  if not Assigned( PTCVcsGetCheckInInfo ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetCheckInInfo' );
  Result := PTCVcsGetCheckInInfo( Info );
end;

// Displays the CheckIn dialog. The pointer to the data structure should be initialized by
// calling InitializeCheckInInfo and, once finished with, destroyed using ReleaseCheckInInfo
// ProjectID identifies the root project to allow version labels to be scoped. Can also be
// the ID of any file or folder in the same project
function TCVcsGetCheckInInfoEx( ProjectID: Cardinal; const Info: PCheckInInfo ): Boolean;
begin
  if not Assigned( PTCVcsGetCheckInInfoEx ) then
    LoadIt;
  if not Assigned( PTCVcsGetCheckInInfoEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetCheckInInfoEx' );
  Result := PTCVcsGetCheckInInfoEx( ProjectID, Info );
end;

// As above, but designed to be called from a dialog in the calling application. hWnd should be set to the
// handle of the calling dialog. If left as zero, functions as above.
function TCVcsGetCheckInInfoScc( hWnd: Cardinal; ProjectID: Cardinal; const Info: PCheckInInfo ): Boolean;
begin
  if not Assigned( PTCVcsGetCheckInInfoScc ) then
    LoadIt;
  if not Assigned( PTCVcsGetCheckInInfoScc ) then
    Result := TCVcsGetCheckInInfoEx( ProjectID, Info )
  else
    Result := PTCVcsGetCheckInInfoScc( hWnd, ProjectID, Info );
end;

// This function does not display the CheckIn dialog box, but uses the information in the CheckInInfo
// parameter for the settings
function TCVcsCheckInFilesEx( ProjectID: Cardinal; FileList: TStrings; CheckInInfo: PCheckInInfo; AddNew: Boolean ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsCheckInFilesEx ) then
    LoadIt;
  if not Assigned( PTCVcsCheckInFilesEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsCheckInFilesEx' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsCheckInFilesEx( ProjectID, pFiles, CheckInInfo, AddNew );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// Displays the CheckOut/Get dialog. The pointer to the data structure should be initialized by
// calling InitializeCheckOutInfo and, once finished with, destroyed using ReleaseCheckOutInfo.
function TCVcsGetCheckOutInfo( const Info: PCheckOutInfo; AllowChangeWorking: Boolean ): Boolean;
begin
  if not Assigned( PTCVcsGetCheckOutInfo ) then
    LoadIt;
  if not Assigned( PTCVcsGetCheckOutInfo ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetCheckOutInfo' );
  Result := PTCVcsGetCheckOutInfo( Info, AllowChangeWorking );
end;

// Displays the CheckOut/Get dialog. The pointer to the data structure should be initialized by
// calling InitializeCheckOutInfo and, once finished with, destroyed using ReleaseCheckOutInfo.
// ProjectID identifies the root project to allow version labels to be scoped. Can also be
// the ID of any file or folder in the same project
function TCVcsGetCheckOutInfoEx( ProjectID: Cardinal; const Info: PCheckOutInfo; AllowChangeWorking: Boolean ): Boolean;
begin
  if not Assigned( PTCVcsGetCheckOutInfoEx ) then
    LoadIt;
  if not Assigned( PTCVcsGetCheckOutInfoEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetCheckOutInfoEx' );
  Result := PTCVcsGetCheckOutInfoEx( ProjectID, Info, AllowChangeWorking );
end;

// As above, but designed to be called from a dialog in the calling application. hWnd should be set to the
// handle of the calling dialog. If left as zero, functions as above.
function TCVcsGetCheckOutInfoScc( hWnd: Cardinal; ProjectID: Cardinal; const Info: PCheckOutInfo; AllowChangeWorking: Boolean ): Boolean;
begin
  if not Assigned( PTCVcsGetCheckOutInfoScc ) then
    LoadIt;
  if not Assigned( PTCVcsGetCheckOutInfoScc ) then
    Result := TCVcsGetCheckOutInfoEx( ProjectID, Info, AllowChangeWorking )
  else
    Result := PTCVcsGetCheckOutInfoScc( hWnd, ProjectID, Info, AllowChangeWorking );
end;

// This function does not display the CheckOut dialog box, but uses the information in the CheckOutInfo
// parameter for the settings
function TCVcsCheckOutFilesEx( FileList: TStrings; CheckOutInfo: PCheckOutInfo; ShowStatus: Boolean = True; ShowProgress: Boolean = True ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsCheckOutFilesEx ) then
    LoadIt;
  if not Assigned( PTCVcsCheckOutFilesEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsCheckOutFilesEx' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsCheckOutFilesEx( pFiles, CheckOutInfo, ShowStatus, ShowProgress );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// For internal use by SCC API
function TCVcsSccCheckOutFilesEx( FileList: TStrings; CheckOutInfo: PCheckOutInfo; ShowStatus: Boolean = True; ShowProgress: Boolean = True ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsSccCheckOutFilesEx ) then
    LoadIt;
  if not Assigned( PTCVcsSccCheckOutFilesEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSccCheckOutFilesEx' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsSccCheckOutFilesEx( pFiles, CheckOutInfo, ShowStatus, ShowProgress );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// For internal use by SCC API
function TCVcsSccQuickDiff( ProjectID, FolderID, FileID: Cardinal; Options: Integer ): Integer;
begin
  if not Assigned( PTCVcsSccQuickDiff ) then
    LoadIt;
  if not Assigned( PTCVcsSccQuickDiff ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSccQuickDiff' );
  Result := PTCVcsSccQuickDiff( ProjectID, FolderID, FileID, Options );
end;

// For internal use by SCC API
function TCVcsForceCheckinComments: Boolean;
begin
  if not Assigned( PTCVcsForceCheckinComments ) then
    LoadIt;
  if not Assigned( PTCVcsForceCheckinComments ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsForceCheckinComments' );
  Result := PTCVcsForceCheckinComments;
end;

// For internal use by SCC API
function TCVcsSccIsFileArchived( ProjectID, FolderID: Cardinal; FileName: String; var ID: Cardinal ): Boolean;
begin
  if not Assigned( PTCVcsSccIsFileArchived ) then
    LoadIt;
  if not Assigned( PTCVcsSccIsFileArchived ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSccIsFileArchived' );
  Result := PTCVcsSccIsFileArchived( ProjectID, FolderID, PChar( FileName ), ID );
end;

// For internal use by SCC API
function TCVcsSccCheckInFilesEx( ProjectID, FolderID: Cardinal; FileList: TStrings; CheckInInfo: PCheckInInfo; AddNew: Boolean ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsSccCheckInFilesEx ) then
    LoadIt;
  if not Assigned( PTCVcsSccCheckInFilesEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSccCheckInFilesEx' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsSccCheckInFilesEx( ProjectID, FolderID, pFiles, CheckInInfo, AddNew );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// For internal use by SCC API
function TCVcsSccGetFileStatusEx( ProjectID, FolderID, FileID: Cardinal; var CheckedInTimestamp: Integer; var Locked, LockedByMe, MultipleLocks, Modified, OutOfDate: Boolean ): Boolean;
begin
  if not Assigned( PTCVcsSccGetFileStatusEx ) then
    LoadIt;
  if not Assigned( PTCVcsSccGetFileStatusEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSccGetFileStatusEx' );
  Result := PTCVcsSccGetFileStatusEx( ProjectID, FolderID, FileID, CheckedInTimestamp, Locked, LockedByMe, MultipleLocks, Modified, OutOfDate );
end;

// For internal use by SCC API
function TCVcsGetFileListForFolders( ProjectID: Cardinal; const Folders, Files: TStrings; Recursive: Boolean ): Boolean;
var
  pFiles: PChar;
  Size, ActSize: Integer;
begin
  if not Assigned( PTCVcsGetFileListForFolders ) then
    LoadIt;
  if not Assigned( PTCVcsGetFileListForFolders ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetFileListForFolders' );
  Size := 32000;
  GetMem( pFiles, 32000 );
  try
    Result := PTCVcsGetFileListForFolders( ProjectID, PChar( Folders.Text ), pFiles, Size, Recursive );
    if Result then
      Files.Text := String( pFiles );
  finally
    FreeMem( pFiles, 32000 );
  end;
  if not Result then
  begin
    ActSize := Size;
    GetMem( pFiles, ActSize );
    try
      Result := PTCVcsGetFileListForFolders( ProjectID, PChar( Folders.Text ), pFiles, Size, Recursive );
      if Result then
        Files.Text := String( pFiles );
    finally
      FreeMem( pFiles, ActSize );
    end;
  end;
end;

// Internal Use: Export/Import
function VcsBeginImport: Integer;
begin
  if not Assigned( PVcsBeginImport ) then
    LoadIt;
  if not Assigned( PVcsBeginImport ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsBeginImport' );
  Result := PVcsBeginImport;
end;

// Internal Use: Export/Import
function VcsSetImportData( const Data: TStream ): Integer;
begin
  if not Assigned( PVcsSetImportData ) then
    LoadIt;
  if not Assigned( PVcsSetImportData ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsSetImportData' );
  Result := PVcsSetImportData( Data );
end;

// Internal Use: Export/Import
function VcsDoImport: Integer;
begin
  if not Assigned( PVcsDoImport ) then
    LoadIt;
  if not Assigned( PVcsDoImport ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDoImport' );
  Result := PVcsDoImport;
end;

// Internal Use: Export/Import
function VcsGetImportProgress: Integer;
begin
  if not Assigned( PVcsGetImportProgress ) then
    LoadIt;
  if not Assigned( PVcsGetImportProgress ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetImportProgress' );
  Result := PVcsGetImportProgress;
end;

// Internal Use: Export/Import
function VcsGetImportResult: Integer;
begin
  if not Assigned( PVcsGetImportResult ) then
    LoadIt;
  if not Assigned( PVcsGetImportResult ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetImportResult' );
  Result := PVcsGetImportResult;
end;

// Internal Use: Export/Import
function VcsEndImport: Integer;
begin
  if not Assigned( PVcsEndImport ) then
    LoadIt;
  if not Assigned( PVcsEndImport ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEndImport' );
  Result := PVcsEndImport;
end;

function GetBigFileSize( const FileName : string ) : Cardinal;
{$IFDEF LINUX}
var
  Rec: TSearchRec;
begin
  Result := 0;
  if FindFirst( Filename, faAnyFile, Rec ) = 0 then
  try
    Result := Rec.Size;
  finally
    FindClose( Rec );
  end;
end;
{$ELSE}
var
  AHandle : integer;
begin
  AHandle := FileOpen( FileName, fmShareDenyNone );
  Result := Windows.GetFileSize( AHandle, nil );
  FileClose( AHandle );
  if Result = INVALID_HANDLE_VALUE then
    Result := 0
end;
{$ENDIF}

function VcsImport( FileName: String; Progress: TImportExportProgress ): Integer;
var
  Cancelled: Boolean;
  Stream, WorkStream: TStream;
  cPosn, cSize, cDataCount: Cardinal;
  ChkSize, Posn: Integer;
begin
  Result := Err_UnknownError;
  Cancelled := False;
  if Assigned( Progress ) then
    Cancelled := ( not Progress( 0, 0 ) );
  if ( not Cancelled ) then
  begin
    VcsBeginImport;
    try
      // Perform the Import
      cPosn := 0;
      cSize := GetBigFileSize( FileName );
      if Assigned( Progress ) then
        Cancelled := ( not Progress( 0, Trunc( ( ( cPosn * 1.0 ) / ( cSize * 1.0 ) ) * 100.0 ) ) );
      if ( not Cancelled ) then
      begin
        // Send the data to the server....
        Stream := TFileStream.Create( FileName, fmOpenRead or fmShareDenyNone );
        try
          WorkStream := TMemoryStream.Create;
          try
            ChkSize := cSize - 524288;
            if ChkSize >= 524288 then
              ChkSize := 524288;
            cDataCount := WorkStream.CopyFrom( Stream, ChkSize );
            while ( cDataCount > 0 ) and ( not Cancelled ) do
            begin
              cPosn := cPosn + cDataCount;
              if Assigned( Progress ) then
                Cancelled := ( not Progress( 0, Trunc( ( ( cPosn * 1.0 ) / ( cSize * 1.0 ) ) * 100.0 ) ) );
              WorkStream.Position := 0;
              VcsSetImportData( WorkStream );
              WorkStream.Size := 0;
              WorkStream.Position := 0;
              ChkSize := cSize - cPosn;
              if ChkSize >= 524288 then
                ChkSize := 524288;
              if ChkSize > 0 then
                cDataCount := WorkStream.CopyFrom( Stream, ChkSize )
              else
                cDataCount := 0;
            end;
          finally
            WorkStream.Free;
          end;
        finally
          Stream.Free;
        end;
        if ( not Cancelled ) then
        begin
          // Then, trigger the Import...
          VcsDoImport;
          // ...and wait for it to complete...
          Posn := VcsGetImportProgress;
          while ( Posn < 100 ) and ( not Cancelled ) do
          begin
            if Assigned( Progress ) then
              Cancelled := ( not Progress( 1, Posn ) );
            Posn := VcsGetImportProgress;
            Sleep( 200 );   // Sleep to allow the Import Thread time
          end;
          if Assigned( Progress ) then
            Progress( 1, Posn );
        end;
      end;
      Result := VcsGetImportResult;
    finally
      VcsEndImport;
    end;
  end;
  if Cancelled then
    Result := Err_ActionCancelled;
end;

// Internal Use: Export/Import
function VcsBeginExport( What: Integer; ProjectID: Cardinal ): Integer;
begin
  if not Assigned( PVcsBeginExport ) then
    LoadIt;
  if not Assigned( PVcsBeginExport ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsBeginExport' );
  Result := PVcsBeginExport( What, ProjectID );
end;

// Internal Use: Export/Import
function VcsGetExportProgress: Integer;
begin
  if not Assigned( PVcsGetExportProgress ) then
    LoadIt;
  if not Assigned( PVcsGetExportProgress ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetExportProgress' );
  Result := PVcsGetExportProgress;
end;

// Internal Use: Export/Import
function VcsGetExportResult: Integer;
begin
  if not Assigned( PVcsGetExportResult ) then
    LoadIt;
  if not Assigned( PVcsGetExportResult ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetExportResult' );
  Result := PVcsGetExportResult;
end;

// Internal Use: Export/Import
function VcsGetExportSize: Cardinal;
begin
  if not Assigned( PVcsGetExportSize ) then
    LoadIt;
  if not Assigned( PVcsGetExportSize ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetExportSize' );
  Result := PVcsGetExportSize;
end;

// Internal Use: Export/Import
function VcsGetExportData( Start: Cardinal; Size: Integer; const Stream: TStream ): Cardinal;
begin
  if not Assigned( PVcsGetExportData ) then
    LoadIt;
  if not Assigned( PVcsGetExportData ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetExportData' );
  Result := PVcsGetExportData( Start, Size, Stream );
end;

// Internal Use: Export/Import
function VcsEndExport: Integer;
begin
  if not Assigned( PVcsEndExport ) then
    LoadIt;
  if not Assigned( PVcsEndExport ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEndExport' );
  Result := PVcsEndExport;
end;

function VcsExport( What: Integer; ProjectID: Cardinal; FileName: String; Progress: TImportExportProgress ): Integer;
var
  Cancelled: Boolean;
  Posn: Integer;
  cPosn, cSize, cDataCount: Cardinal;
  BckStream, Stream: TStream;
begin
  Result := Err_UnknownError;
  Cancelled := False;
  if Assigned( Progress ) then
    Cancelled := ( not Progress( 0, 0 ) );
  if ( not Cancelled ) then
  begin
    VcsBeginExport( What, ProjectID );
    try
      if Assigned( Progress ) then
        Cancelled := ( not Progress( 0, 0 ) );
      // Trigger the Export...
      Posn := VcsGetExportProgress;
      // ...and wait for it to complete
      while ( Posn < 100 ) and ( not Cancelled ) do
      begin
        if Assigned( Progress ) then
          Cancelled := ( not Progress( 0, Posn ) );
        Sleep( 100 ); // Sleep to allow the Export Thread time
        Posn := VcsGetExportProgress;
      end;
      if Assigned( Progress ) then
        Cancelled := ( not Progress( 0, Posn ) );
      Result := VcsGetExportResult;
      if ( Result = Err_OK ) and ( not Cancelled ) then
      begin
        // The Export portion is done, now we need to read the data...
        cSize := VcsGetExportSize;
        cPosn := 0;
        if Assigned( Progress ) then
          Cancelled := ( not Progress( 1, 0 ) );
        if ( cSize > 0 ) and ( not Cancelled ) then
        begin
          // Create the local Export file
          BckStream := TFileStream.Create( FileName, fmCreate );
          try
            Stream := TMemoryStream.Create;
            try
              cDataCount := VcsGetExportData( cPosn, 524288, Stream );
              while ( cDataCount > 0 ) and ( not Cancelled ) do
              begin
                cPosn := cPosn + cDataCount;
                if Assigned( Progress ) then
                  Cancelled := ( not Progress( 1, Trunc( ( ( cPosn * 1.0 ) / ( cSize * 1.0 ) ) * 100.0 ) ) );
                if ( not Cancelled ) then
                begin
                  Stream.Position := 0;
                  BckStream.CopyFrom( Stream, 0 );
                  Stream.Size := 0;
                  Stream.Position := 0;
                  cDataCount := VcsGetExportData( BckStream.Position, 524288, Stream );
                end;
              end;
            finally
              Stream.Free;
            end;
          finally
            BckStream.Free;
          end;
        end;
      end;
    finally
      VcsEndExport;
    end;
  end;
  if Cancelled then
    Result := Err_ActionCancelled;
end;

// For internal use by SCC API
function TCVcsGetFileList( RootID: Cardinal; const Files: TStrings ): Boolean;
var
  pFiles: PChar;
  Size, ActSize: Integer;
begin
  if not Assigned( PTCVcsGetFileList ) then
    LoadIt;
  if not Assigned( PTCVcsGetFileList ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetFileList' );
  Size := 32000;
  GetMem( pFiles, 32000 );
  try
    Result := PTCVcsGetFileList( RootID, pFiles, Size );
    if Result then
      Files.Text := String( pFiles );
  finally
    FreeMem( pFiles, 32000 );
  end;
  if not Result then
  begin
    ActSize := Size;
    GetMem( pFiles, ActSize );
    try
      Result := PTCVcsGetFileList( RootID, pFiles, Size );
      if Result then
        Files.Text := String( pFiles );
    finally
      FreeMem( pFiles, ActSize );
    end;
  end;
end;

// For internal use by SCC API
function TCVcsGetObjectType( var ObjID: Cardinal; ProjID: Cardinal; AName: String ): Integer;
begin
  if not Assigned( PTCVcsGetObjectType ) then
    LoadIt;
  if not Assigned( PTCVcsGetObjectType ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetObjectType' );
  Result := PTCVcsGetObjectType( ObjID, ProjID, PChar( AName ) );
end;

// For internal use by SCC API
function TCVcsSccProjectInfoByName( AName: String; var ProjID, FolderID: Cardinal ): Boolean;
begin
  if not Assigned( PTCVcsSccProjectInfoByName ) then
    LoadIt;
  if not Assigned( PTCVcsSccProjectInfoByName ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSccProjectInfoByName' );
  Result := PTCVcsSccProjectInfoByName( PChar( AName ), ProjID, FolderID );
end;

// For internal use by SCC API
function TCVcsSccRemoveFiles( ProjectID: Cardinal; FileList: TStrings ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsSccRemoveFiles ) then
    LoadIt;
  if not Assigned( PTCVcsSccRemoveFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSccRemoveFiles' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsSccRemoveFiles( ProjectID, pFiles );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// For internal use by SCC API
function TCVcsSccUndoCheckOutFiles( FileList: TStrings ): Integer;
var
  pFiles: PChar;
  Len: Integer;
begin
  if not Assigned( PTCVcsSccUndoCheckOutFiles ) then
    LoadIt;
  if not Assigned( PTCVcsSccUndoCheckOutFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSccUndoCheckOutFiles' );
  Len := Length( FileList.Text ) + FileList.Count + 1024;
  GetMem( pFiles, Len );
  try
    SccListToPChar( FileList, pFiles );
    Result := PTCVcsSccUndoCheckOutFiles( pFiles );
  finally
    FreeMem( pFiles, Len );
  end;
end;

// For internal use by SCC API
function TCVcsSccSelectProject( var Name, Path: String; var ProjID, FolderID: Cardinal; CanCreate, IncludeFolders: Boolean ): Boolean;
var
  pName: PChar;
  pPath: PChar;
begin
  if not Assigned( PTCVcsSccSelectProject ) then
    LoadIt;
  if not Assigned( PTCVcsSccSelectProject ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSccSelectProject' );
  GetMem( pName, 4096 );
  try
    GetMem( pPath, 4096 );
    try
      StrCopy( pName, PChar( Name ) );
      StrCopy( pPath, PChar( Path ) );
      Result := PTCVcsSccSelectProject( pName, pPath, ProjID, FolderID, CanCreate, IncludeFolders );
      if Result then
      begin
        SetLength( Name, StrLen( pName ) );
        Name := String( pName );
        SetLength( Path, StrLen( pPath ) );
        Path := String( pPath );
      end;
    finally
      FreeMem( pPath, 4096 );
    end;
  finally
    FreeMem( pName, 4096 );
  end;
end;

function TCVcsSelectProject( var ProjName: String; var ProjID: Cardinal; CanCreate: Boolean ): Boolean;
var
  pProjName: PChar;
begin
  if not Assigned( PTCVcsSelectProject ) then
    LoadIt;
  if not Assigned( PTCVcsSelectProject ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSelectProject' );
  GetMem( pProjName, 1024 );
  try
    StrCopy( pProjName, PChar( ProjName ) );
    Result := PTCVcsSelectProject( pProjName, ProjID, CanCreate );
    if Result then
    begin
      SetLength( ProjName, StrLen( pProjName ) );
      ProjName := String( pProjName );
    end;
  finally
    FreeMem( pProjName, 1024 );
  end;
end;

function TCVcsFolderIDByDisplayPath( Path: String ): Cardinal;
begin
  if not Assigned( PTCVcsFolderIDByDisplayPath ) then
    LoadIt;
  if not Assigned( PTCVcsFolderIDByDisplayPath ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsFolderIDByDisplayPath' );
  Result := PTCVcsFolderIDByDisplayPath( PChar( Path ) );
end;

procedure TCVcsShowHelp( HelpFile: String; Topic: Word );
begin
  if not Assigned( PTCVcsShowHelp ) then
    LoadIt;
  if not Assigned( PTCVcsShowHelp ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsShowHelp' );
  PTCVcsShowHelp( PChar( HelpFile ), Topic );
end;

function TCVcsErrorString( ID: Integer ): String;
var
  pMsg: PChar;
begin
  if not Assigned( PTCVcsErrorString ) then
    LoadIt;
  if not Assigned( PTCVcsErrorString ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsErrorString' );
  GetMem( pMsg, 1024 );
  try
    PTCVcsErrorString( ID, pMsg );
    SetLength( Result, StrLen( pMsg ) );
    Result := String( pMsg );
  finally
    FreeMem( pMsg, 1024 );
  end;
end;

procedure TCVcsSetCaller( CallerName: String );
begin
  if not Assigned( PTCVcsSetCaller ) then
    LoadIt;
  if not Assigned( PTCVcsSetCaller ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsSetCaller' );
  PTCVcsSetCaller( PChar( CallerName ) );
end;

function TCSelectFiles( const Files: TStrings ): Boolean;
var
  Stream: TStream;
begin
  if not Assigned( PTCSelectFiles ) then
    LoadIt;
  if not Assigned( PTCSelectFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCSelectFiles' );
  Stream := TMemoryStream.Create;
  try
    Result := PTCSelectFiles( Stream );
    if Result then
    begin
      Stream.Position := 0;
      Files.Clear;
      Files.LoadFromStream( Stream );
    end;
  finally
    Stream.Free;
  end;
end;

// For internal use
function ReadInteger( const Data: TStream ): Integer;
begin
  Data.Read( Result, SizeOf( Result ) );
end;

function ReadCardinal( const Data: TStream ): Cardinal;
begin
  Data.Read( Result, SizeOf( Result ) );
end;

function ReadString( const Data: TStream ): String;
var
  Size: Integer;
begin
  Size := ReadInteger( Data );
  SetLength( Result, Size );
  if Size > 0 then
    Data.Read( Result[ 1 ], Size )
  else
    Result := '';
end;

function TCVcsGetObjectVersions( const ID: Integer; const VersionList: TStrings ): Integer;
var
  i, Count: Integer;
  AnID: Cardinal;
  Ver: String;
  Stream: TStream;
begin
  if not Assigned( PTCVcsGetObjectVersions ) then
    LoadIt;
  if not Assigned( PTCVcsGetObjectVersions ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: TCVcsGetObjectVersions' );
  Stream := TMemoryStream.Create;
  try
    Result := PTCVcsGetObjectVersions( ID, Stream );
    if Result = Err_OK then
    begin
      Stream.Position := 0;
      Count := ReadInteger( Stream );
      for i := 0 to Count - 1 do
      begin
        Ver := ReadString( Stream );
        AnID := ReadCardinal( Stream );
        VersionList.AddObject( Ver, Pointer( AnID ) );
      end;
    end;
  finally
    Stream.Free;
  end;
end;

function IntEnumProc( Context, Data: Pointer; pName, pDescription, pHost: PChar; Port: Integer; Current: Boolean ): Boolean;
var
  AProc: TEnumConnections;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pDescription ), String( pHost ), Port, Current );
end;

function IntEnumViews( Context, Data: Pointer; pName, pDescription: PChar; ID: Cardinal; Shared, Current: Boolean ): Boolean;
var
  AProc: TEnumViews;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pDescription ), ID, Shared, Current );
end;

function IntEnumProjects( Context, Data: Pointer; pName: PChar; ID: Cardinal ): Boolean;
var
  AProc: TEnumProjects;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), ID );
end;

function IntEnumFolders( Context, Data: Pointer; pName, pTCPath, pLocalFolder: PChar; ID, ParentID: Cardinal; FolderCount, FileCount: Integer ): Boolean;
var
  AProc: TEnumFolders;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pTCPath ), String( pLocalFolder ), ID, ParentID, FolderCount, FileCount );
end;

function IntEnumNewFiles( Context, Data: Pointer; pFullPath: PChar; ProjectID, FolderID: Cardinal ): Boolean;
var
  AProc: TEnumNewFiles;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pFullPath ), ProjectID, FolderID );
end;

function IntEnumFiles( Context, Data: Pointer; pName, pLocalPath, pLockedBy: PChar; ID, ParentID, AncestorID: Cardinal; Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; IsVirtual, Frozen: Boolean ): Boolean;
var
  AProc: TEnumFiles;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pLocalPath ), String( pLockedBy ), ID, ParentID, AncestorID, Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status, IsVirtual, Frozen );
end;

function IntEnumLabels( Context, Data: Pointer; LabelType: Integer; pName, pComments: PChar; ID: Cardinal; Timestamp: Integer ): Boolean;
var
  AProc: TEnumLabels;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, LabelType, String( pName ), String( pComments ), ID, Timestamp );
end;

function IntEnumRevisions( Context, Data: Pointer; pName, pAuthor, pComments, pLockedBy: PChar; ID, ParentID: Cardinal; Modified, Timestamp, CompressedSize, OriginalSize, CRC, VerCount, PromoCount: Integer ): Boolean;
var
  AProc: TEnumRevisions;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pAuthor ), String( pComments ), String( pLockedBy ), ID, ParentID, Modified, Timestamp, CompressedSize, OriginalSize, CRC, VerCount, PromoCount );
end;

end.
