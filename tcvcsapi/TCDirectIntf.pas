{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2001 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  26501: TCDirectIntf.pas }
{
    Rev 1.27    17/04/2009 20:04:32  Ewan
  Just in case...
}
{
    Rev 1.26    08/02/2009 22:15:34  Ewan
  First release for 2009
}
{
    Rev 1.25    19/06/2008 08:17:58  Ewan
  New release. Seems to have fixed the 'Object not Found' issue.
}
{
    Rev 1.24    13/01/2006 17:38:38  Ewan
  Fixes VM commandline AV's
}
{
    Rev 1.24    13/01/2006 17:38:38  Ewan
  Fixes VM commandline AV's
}
{
    Rev 1.23    25/12/2005 02:18:58  Ewan
  New Version (7.2 and 7.1.3.30) - 25/12/05
  Web Updated #8
  FastMM4
}
{
    Rev 1.22    28/10/2005 12:46:36  Ewan    Version: Marker
  Latest Changes (28/10/2005)
}
{
    Rev 1.21    16/03/2005 23:59:38  Ewan
  New fixes and performance enhancements
}
{
    Rev 1.20    06/10/2004 21:27:18  Ewan
  Latest Release
}
{
    Rev 1.20    06/10/2004 21:27:18  Ewan
  Latest Release
}
{
    Rev 1.20    06/10/2004 21:27:18  Ewan
  Check in to update Linux
}
{
    Rev 1.19    18/07/2004 23:48:48  Ewan    Version: 7.1.2.90
  Linux Fix
}
{
    Rev 1.17    18/07/2004 18:21:46  Ewan    Version: 7.1.2.90
  Latest Release
}
{
    Rev 1.16    23/04/2004 23:11:40  Ewan    Version: 7.1.2.85
  Latest Changes and Server Test
}
{
    Rev 1.16    23/04/2004 23:11:40  Ewan    Version: 7.1.2.80
  New Installer, etc
}
{
    Rev 1.15    11/03/2004 17:52:06  Ewan    Version: 7.1.2.72
  Latest Release
}
{
    Rev 1.14    20/02/2004 15:38:40  Ewan
  Test Checkin
}
{
    Rev 1.13    11/02/2004 10:58:46  Ewan
  Checkin for Linux
}
{
    Rev 1.12    07/02/2004 15:08:40  Ewan
  Latest changes
}
{
    Rev 1.11    27/12/2003 16:36:16  Ewan    Version: 7.1.2.65
  Latest Release
}
{
    Rev 1.10    18/09/2003 15:56:08  Ewan
  Temp
}
{
    Rev 1.9    22/08/2003 00:12:30  Ewan
  Just in case things go haywire
}
{
    Rev 1.8    05/04/2003 11:37:46  Ewan    Version: 7.1.2.0
  Prior to big price increase
}
{
    Rev 1.7    13/03/2003 23:15:52  Ewan    Version: 7.1.1.38
  Fixed threads to prevent Invalid Stream methods. New Release
}
{
    Rev 1.6    07/02/2003 00:06:28  Ewan    Version: 7.1.1.35
  Released Version
}
{
    Rev 1.5    28/11/2002 03:42:06  Ewan    Version: 7.1.1.21
}
{
    Rev 1.4    27/11/2002 01:19:46  Ewan    Version: 7.1.1.20
  Latest release. Final one before Linux port
}
{
{   Rev 1.3    24/10/2002 23:03:44  Ewan    Version: 7.1 Release
{ Final release of TC 7.1
}
{
{   Rev 1.2    24/08/2002 01:52:58  Ewan    Version: 7.1 Beta 2
{ Beta 2
}
{
{   Rev 1.1    10/02/2002 23:33:04  Ewan    Version: 7.0.2.14
}
{
{   Rev 1.1    11/02/2002 00:33:04  Ewan
{ Release 7.0.2.0
}
{
{   Rev 1.0    06/02/2002 11:05:42  Ewan
{ Initial Revision
}
unit TCDirectIntf;

interface

uses Classes, TCVcsTypes;

// Interface functions
procedure VcsBeginAction( ActionRef: Integer; Action: Word );
procedure VcsEndAction( ActionRef: Integer; Action: Word );
function VcsCheckInFile( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; FileName: String; CheckInInfo: PCheckInInfo ): Integer;
function VcsCheckInFileEx( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; FileName, SourceFile: String; DateTimeOverride: TDateTime; CheckInInfo: PCheckInInfo; UserOverride: String = '' ): Integer;
function VcsCheckOutFile( FileID: Cardinal; var RevisionID: Cardinal; CheckOutInfo: PCheckOutInfo ): Integer;
function VcsCheckOutFileEx( FileID: Cardinal; var RevisionID: Cardinal; CheckOutInfo: PCheckOutInfo; FileName: String ): Integer;
function VcsCheckOutFiles( IDsAndNames: TStrings; CheckOutInfo: PCheckOutInfo; FBProc: TActionFeedback; TerminateOnError: Boolean ): Integer;
function VcsSetMergeInfo( FileID, RevisionID, MergedFrom: Cardinal ): Integer;
function VcsGetCommonRoot( FileID, Revision1, Revision2: Cardinal; var CommonRevision: Cardinal ): Integer;
function VcsGetBranchInfo( FileID, RevisionID: Cardinal; var BranchedFrom, BranchTip: Cardinal ): Integer;
function VcsUncheckOutFile( FileID: Cardinal ): Integer;
function VcsLock( FileID, RevisionID: Cardinal; FullPath, LockComments: String; Lock, UpdateStatusOnLock: Boolean ): Integer;
function VcsShareFile( var NewFileID: Cardinal; SourceFileID, TargetFolderID: Cardinal ): Integer;
function VcsUnshareFile( FileID: Cardinal ): Integer;
function VcsMoveFile( SourceFileID, TargetFolderID: Cardinal ): Integer;
function VcsAddProject( var ProjID: Cardinal; Name: String ): Integer;
function VcsRenameProject( ProjID: Cardinal; Name: String ): Integer;
function VcsDeleteProject( ProjID: Cardinal ): Integer;
function VcsAddFolder( var FolderID: Cardinal; ParentID: Cardinal; Name, Path: String ): Integer;
function VcsRenameFolder( FolderID: Cardinal; Name, Path: String; ReflectInSubFolders: Boolean ): Integer;
function VcsDeleteFolder( FolderID: Cardinal ): Integer;
function VcsGetFolderInfo( FolderID: Cardinal; var FolderName, TCPath, LocalFolder, Extra: String; var ParentID: Cardinal; var FolderCount, FileCount: Integer ): Integer;
function VcsGetFolderPermissions( FolderID: Cardinal; var CanAccess, CanModify, CanCheckInOut: Boolean ): Integer;
function VcsDeleteFile( FileID: Cardinal ): Integer;
function VcsRemoveObject( ObjectID: Cardinal ): Integer;
function VcsAddVersionLabel( var LabelID: Cardinal; Name, Comments: String ): Integer;
function VcsAddVersionLabelEx( var LabelID: Cardinal; Name, Comments: String; ProjectID: Cardinal ): Integer;
function VcsDeleteVersionLabel( LabelID: Cardinal ): Integer;
function VcsModifyVersionLabel( LabelID: Cardinal; Name, Comments: String ): Integer;
function VcsAttachVersionLabel( FileID, RevisionID, VersionID: Cardinal; CanMove: Boolean ): Integer;
function VcsAttachVersionLabelByTimestamp( FileID, VersionID: Cardinal; Stamp: TDateTime; CanMove: Boolean ): Integer;
function VcsAttachVersionLabelEx( FileIDs: TCardinalArray; VersionID: Cardinal; CanMove: Boolean; FBProc: TActionFeedback; TerminateOnError: Boolean ): Integer;
function VcsDetachVersionLabel( FileID, RevisionID, VersionID: Cardinal ): Integer;
function VcsPromote( FileID: Cardinal ): Integer;
function VcsNextPromotionLabel( var PromotionID: Cardinal; var PromotionLabel: String ): Integer;
function VcsGetFileID( var FileID: Cardinal; FilePath: String ): Integer;
function VcsGetFileIDExt( var FileID: Cardinal; var TCPath: String; FilePath: String ): Integer;
function VcsGetFileWorkingPath( FileID: Cardinal; var Path: String ): Integer;
function VcsGetFileCheckoutPath( FileID: Cardinal; var LockedRevision: Cardinal; var FullPath: String; var BranchedFrom, BranchTip: Cardinal ): Integer;
function VcsGetFileGroupExt( FileName: String; var Ext: String ): Integer;
function VcsGetFileGroupExtensions( FileName: String; var Ext: String ): Integer;
function VcsGetObjectNotes( ObjectID: Cardinal; var Notes: String ): Integer;
function VcsSetObjectNotes( ObjectID: Cardinal; Notes: String ): Integer;
function VcsFileStatus( var ParentID, FileID: Cardinal; var FilePath, LockedBy: String; var Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; var IsVirtual, Frozen: Boolean ): Integer;
function VcsSetView( ViewID: Cardinal ): Integer;
function VcsDeleteView( ViewID: Cardinal ): Integer;
function VcsAddView( var ViewID: Cardinal; ViewName, Description, Projects: String; BasisID: Cardinal; Shared: Boolean ): Integer;
function VcsUpdateView( ViewID: Cardinal; ViewName, Description, Projects: String; BasisID: Cardinal; Shared: Boolean ): Integer;
function VcsEnumViews( EnumProc: TEnumViews; Data: Pointer ): Integer;
function VcsProjectList( Projects: TStrings ): Integer;
function VcsAddConnection( Name, Description, Host: String; Port: Integer; Params: String; var Msg: String ): Boolean;
function VcsUpdateConnection( Name: String; Params: String; var Msg: String ): Boolean;
function VcsDeleteConnection( Name: String; var Msg: String ): Boolean;
function VcsEnumConnections( EnumProc: TEnumConnections; Data: Pointer ): Integer;
function VcsEnumProjects( EnumProc: TEnumProjects; Data: Pointer ): Integer;
function VcsEnumFolders( RootID: Cardinal; EnumProc: TEnumFolders; Data: Pointer; Recursive: Boolean ): Integer;
function VcsEnumFiles( RootID: Cardinal; EnumProc: TEnumFiles; Data: Pointer; Recursive: Boolean ): Integer;
function VcsEnumLockedFiles( UserID: Cardinal; EnumProc: TEnumLockedFiles; Data: Pointer ): Integer;
function VcsEnumRevisions( FileID: Cardinal; EnumProc: TEnumRevisions; Data: Pointer ): Integer;
function VcsEnumLabels( RootID, RevID: Cardinal; LabelType: Integer; EnumProc: TEnumLabels; Data: Pointer ): Integer;
procedure VcsCurrentConnection( var Connection, Username: String; var Connected: Boolean );
function VcsErrorString( ErrorCode: Integer ): String;
function VcsGetAddinInfo( ObjectID: Cardinal; AddinName: String; const ValuePairs: TStrings ): Integer;
procedure VcsHistoryReport( FileIDs: array of Cardinal; OutFile: string; Columns: Integer; FromVer, ToVer: Cardinal; FromDate, ToDate: Integer; IncFromVersion, FileDetails: Boolean );
procedure VcsInvalidateCache;
function VcsPasswordRequiredForModification: Boolean;
function VcsValidUser( Username, Password: String ): Integer;
function VcsConnect( const Connection, Name, Password: String ): Integer;
function VcsDisconnect: Integer;
// Import/Export functionality
function VcsImport( FileName: String; Progress: TImportExportProgress ): Integer;
function VcsExport( What: Integer; ProjectID: Cardinal; FileName: String; Progress: TImportExportProgress ): Integer;
// Release the DLL...
procedure VcsReleaseAPI;
// Testing
function VcsBackup(): Integer;

var
  LibPath: String = '';

implementation

uses
  SysUtils,
  {$IFDEF LINUX}
  Libc,
  {$ELSE}
  {$IFDEF DEBUG_API}
  CsIntf,
  {$ENDIF}
  Windows,
{$WARN UNIT_PLATFORM OFF}
  FileCtrl,
{$WARN UNIT_PLATFORM ON}
  {$ENDIF}
  TCVcsConst,
  TCVcsUtils;

var
  LibHandle: Cardinal = 0;

type
  TVcsBeginAction = procedure ( ActionRef: Integer; Action: Word ); stdcall;
  TVcsEndAction = procedure ( ActionRef: Integer; Action: Word ); stdcall;
  TVcsErrorString = function ( ErrorCode: Integer; const ErrorString: PAnsiChar; var Size: Integer ): Integer; stdcall;
  TVcsGetAddinInfo = function ( ObjectID: Cardinal; pAddinName: PAnsiChar; const pValuePairs: PAnsiChar; var Size: Integer ): Integer; stdcall;
  TVcsGetObjectNotes = function ( ObjectID: Cardinal; const pNotes: PAnsiChar; var Length: Integer ): Integer; stdcall;
  TVcsSetObjectNotes = function ( ObjectID: Cardinal; pNotes: PAnsiChar ): Integer; stdcall;
  TVcsLock = function( FileID, RevisionID: Cardinal; pFullPath, pLockComments: PAnsiChar; Lock, UpdateStatusOnLock: Boolean ): Integer; stdcall;
  TVcsAddConnection = function ( pName, pDescription, pHost: PAnsiChar; Port: Integer; pParams: PAnsiChar; const pMsg: PAnsiChar ): Boolean; stdcall;
  TVcsUpdateConnection = function ( pName: PAnsiChar; pParams: PAnsiChar; const pMsg: PAnsiChar ): Boolean; stdcall;
  TVcsDeleteConnection = function ( pName: PAnsiChar; const pMsg: PAnsiChar ): Boolean; stdcall;
  TVcsEnumConnections = function ( Context, Data: Pointer; EnumProc: TIntEnumConnections ): Integer; stdcall;
  TVcsEnumViews = function ( Context, Data: Pointer; EnumProc: TIntEnumViews ): Integer; stdcall;
  TVcsEnumProjects = function ( Context, Data: Pointer; EnumProc: TIntEnumProjects ): Integer; stdcall;
  TVcsEnumFolders = function ( RootID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumFolders; Recursive: Boolean ): Integer; stdcall;
  TVcsEnumFiles = function ( RootID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumFiles; Recursive: Boolean ): Integer; stdcall;
  TVcsEnumLockedFiles = function ( UserID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumLockedFiles ): Integer; stdcall;
  TVcsEnumRevisions = function ( FileID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumRevisions ): Integer; stdcall;
  TVcsEnumLabels = function ( RootID, RevID: Cardinal; LabelType: Integer; Context, Data: Pointer; EnumProc: TIntEnumLabels ): Integer; stdcall;
  TVcsAddProject = function ( var ProjID: Cardinal; pName: PAnsiChar ): Integer; stdcall;
  TVcsRenameProject = function ( ProjID: Cardinal; pName: PAnsiChar ): Integer; stdcall;
  TVcsDeleteProject = function ( ProjID: Cardinal ): Integer; stdcall;
  TVcsAddFolder = function ( var FolderID: Cardinal; ParentID: Cardinal; pName, pPath: PAnsiChar ): Integer; stdcall;
  TVcsRenameFolder = function ( FolderID: Cardinal; pName, pPath: PAnsiChar; ReflectInSubFolders: Boolean ): Integer; stdcall;
  TVcsDeleteFolder = function ( FolderID: Cardinal ): Integer; stdcall;
  TVcsGetFolderInfo = function ( FolderID: Cardinal; const pName, pTCPath, pLocalFolder, pExtra: PAnsiChar; var ParentID: Cardinal; var FolderCount, FileCount: Integer ): Integer; stdcall;
  TVcsGetFolderPermissions = function ( FolderID: Cardinal; var CanAccess, CanModify, CanCheckInOut: Boolean ): Integer; stdcall;
  TVcsDeleteFile = function ( FileID: Cardinal ): Integer; stdcall;
  TVcsRemoveObject = function ( ObjectID: Cardinal ): Integer; stdcall;
  TVcsAddVersionLabel = function ( var LabelID: Cardinal; pName, pComment: PAnsiChar ): Integer; stdcall;
  TVcsAddVersionLabelEx = function ( var LabelID: Cardinal; pName, pComment: PAnsiChar; ProjectID: Cardinal ): Integer; stdcall;
  TVcsDeleteVersionLabel = function ( LabelID: Cardinal ): Integer; stdcall;
  TVcsModifyVersionLabel = function ( LabelID: Cardinal; pName, pComment: PAnsiChar ): Integer; stdcall;
  TVcsAttachVersionLabel = function ( FileID, RevisionID, VersionID: Cardinal; CanMove: Boolean ): Integer; stdcall;
  TVcsAttachVersionLabelByTimestamp = function ( FileID, VersionID: Cardinal; Stamp: TDateTIme; CanMove: Boolean ): Integer; stdcall;
  TVcsAttachVersionLabelEx = function ( FileIDs: TCardinalArray; VersionID: Cardinal; CanMove: Boolean; FBProc: TActionFeedback; TerminateOnError: Boolean ): Integer; stdcall;
  TVcsDetachVersionLabel = function ( FileID, RevisionID, VersionID: Cardinal ): Integer; stdcall;
  TVcsPromote = function ( FileID: Cardinal ): Integer; stdcall;
  TVcsNextPromotionLabel = function ( var PromotionID: Cardinal; const pPromotionLabel: PAnsiChar ): Integer; stdcall;
  TVcsCurrentConnection = procedure ( const pConnection, pUsername: PAnsiChar; var Connected: Boolean ); stdcall;
  TVcsSetView = function ( ViewID: Cardinal ): Integer; stdcall;
  TVcsDeleteView = function ( ViewID: Cardinal ): Integer; stdcall;
  TVcsAddView = function ( var ViewID: Cardinal; pName, pDescription, pProjects: PAnsiChar; BasisID: Cardinal; Shared: Boolean ): Integer; stdcall;
  TVcsUpdateView = function ( ViewID: Cardinal; pName, pDescription, pProjects: PAnsiChar; BasisID: Cardinal; Shared: Boolean ): Integer; stdcall;
  TVcsFileStatus = function ( var ParentID, FileID: Cardinal; const pFilePath, pLockedBy: PAnsiChar; var Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; var IsVirtual, Frozen: Boolean ): Integer; stdcall;
  TVcsGetFileID = function ( var FileID: Cardinal; pFilePath: PAnsiChar ): Integer; stdcall;
  TVcsGetFileIDExt = function ( var FileID: Cardinal; const pTCPath: PAnsiChar; pFilePath: PAnsiChar ): Integer; stdcall;
  TVcsGetFileWorkingPath = function ( FileID: Cardinal; const pFilePath: PAnsiChar ): Integer; stdcall;
  TVcsGetFileCheckoutPath = function ( FileID: Cardinal; var LockedRevision: Cardinal; const pFullPath: PAnsiChar; var BranchedFrom, BranchTip: Cardinal ): Integer; stdcall;
  TVcsGetFileGroupExt = function ( pFileName: PAnsiChar; const pExt: PAnsiChar ): Integer; stdcall;
  TVcsGetFileGroupExtensions = function ( pFileName: PAnsiChar; const pExt: PAnsiChar ): Integer; stdcall;
  TVcsCheckInFile = function ( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; pFileName: PAnsiChar; CheckInInfo: PCheckInInfo ): Integer; stdcall;
  TVcsCheckInFileEx = function ( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; pFileName, pSourceFile, pUserName: PAnsiChar; DateTimeOverride: Integer; CheckInInfo: PCheckInInfo ): Integer; stdcall;
  TVcsCheckOutFile = function ( FileID: Cardinal; var RevisionID: Cardinal; CheckOutInfo: PCheckOutInfo ): Integer; stdcall;
  TVcsCheckOutFileEx = function ( FileID: Cardinal; var RevisionID: Cardinal; CheckOutInfo: PCheckOutInfo; FileName: PAnsiChar ): Integer; stdcall;
  TVcsCheckOutFiles = function ( IDsAndNames: PAnsiChar; CheckOutInfo: PCheckOutInfo; FBProc: TActionFeedback; TerminateOnError: Boolean ): Integer; stdcall;
  TVcsSetMergeInfo = function ( FileID, RevisionID, MergedFrom: Cardinal ): Integer; stdcall;
  TVcsGetCommonRoot = function ( FileID, Revision1, Revision2: Cardinal; var CommonRevision: Cardinal ): Integer; stdcall;
  TVcsGetBranchInfo = function ( FileID, RevisionID: Cardinal; var BranchedFrom, BranchTip: Cardinal ): Integer; stdcall;
  TVcsUncheckOutFile = function ( FileID: Cardinal ): Integer; stdcall;
  TVcsPasswordRequiredForModification = function : Boolean; stdcall;
  TVcsValidUser = function ( pUsername, pPassword: PAnsiChar ): Integer; stdcall;
  TVcsShareFile = function ( var NewFileID: Cardinal; SourceFileID, TargetFolderID: Cardinal ): Integer; stdcall;
  TVcsUnshareFile = function ( FileID: Cardinal ): Integer; stdcall;
  TVcsInvalidateCache = procedure; stdcall;
  TVcsHistoryReport = procedure ( FileIDs: array of Cardinal; pOutFile: PAnsiChar; Columns: Integer; FromVer, ToVer: Cardinal; FromDate, ToDate: Integer; IncFromVersion, FileDetails: Boolean ); stdcall;
  TVcsMoveFile = function ( SourceFileID, TargetFolderID: Cardinal ): Integer; stdcall;
  TVcsConnect = function ( pConnection, pName, pPassword: PAnsiChar ): Integer; stdcall;
  TVcsDisconnect = function: Integer; stdcall;
  // Export/Import
  TVcsBeginExport = function ( What: Integer; ProjectID: Cardinal ): Integer; stdcall;
  TVcsGetExportProgress = function : Integer; stdcall;
  TVcsGetExportResult = function : Integer; stdcall;
  TVcsGetExportSize = function : Cardinal; stdcall;
  TVcsGetExportData = function ( Start: Cardinal; Size: Integer; const Stream: TStream ): Cardinal; stdcall;
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
  PVcsErrorString: TVcsErrorString = nil;
  PVcsGetAddinInfo: TVcsGetAddinInfo = nil;
  PVcsGetObjectNotes: TVcsGetObjectNotes = nil;
  PVcsSetObjectNotes: TVcsSetObjectNotes = nil;
  PVcsLock: TVcsLock = nil;
  PVcsAddConnection: TVcsAddConnection = nil;
  PVcsUpdateConnection: TVcsUpdateConnection = nil;
  PVcsDeleteConnection: TVcsDeleteConnection = nil;
  PVcsEnumConnections: TVcsEnumConnections = nil;
  PVcsCurrentConnection: TVcsCurrentConnection = nil;
  PVcsConnect: TVcsConnect = nil;
  PVcsDisconnect: TVcsDisconnect = nil;
  PVcsEnumViews: TVcsEnumViews = nil;
  PVcsEnumProjects: TVcsEnumProjects = nil;
  PVcsEnumFolders: TVcsEnumFolders = nil;
  PVcsEnumFiles: TVcsEnumFiles = nil;
  PVcsEnumLockedFiles: TVcsEnumLockedFiles = nil;
  PVcsEnumRevisions: TVcsEnumRevisions = nil;
  PVcsEnumLabels: TVcsEnumLabels = nil;
  PVcsSetView: TVcsSetView = nil;
  PVcsDeleteView: TVcsDeleteView = nil;
  PVcsAddView: TVcsAddView = nil;
  PVcsUpdateView: TVcsUpdateView = nil;
  PVcsFileStatus: TVcsFileStatus = nil;
  PVcsGetFileID: TVcsGetFileID = nil;
  PVcsGetFileIDExt: TVcsGetFileIDExt = nil;
  PVcsGetFileWorkingPath: TVcsGetFileWorkingPath = nil;
  PVcsGetFileCheckoutPath: TVcsGetFileCheckoutPath = nil;
  PVcsGetFileGroupExt: TVcsGetFileGroupExt = nil;
  PVcsGetFileGroupExtensions: TVcsGetFileGroupExtensions = nil;
  PVcsAddProject: TVcsAddProject = nil;
  PVcsRenameProject: TVcsRenameProject = nil;
  PVcsDeleteProject: TVcsDeleteProject = nil;
  PVcsAddFolder: TVcsAddFolder = nil;
  PVcsGetFolderInfo: TVcsGetFolderInfo = nil;
  PVcsGetFolderPermissions: TVcsGetFolderPermissions = nil;
  PVcsRenameFolder: TVcsRenameFolder = nil;
  PVcsDeleteFolder: TVcsDeleteFolder = nil;
  PVcsDeleteFile: TVcsDeleteFile = nil;
  PVcsRemoveObject: TVcsRemoveObject = nil;
  PVcsAddVersionLabel: TVcsAddVersionLabel = nil;
  PVcsAddVersionLabelEx: TVcsAddVersionLabelEx = nil;
  PVcsDeleteVersionLabel: TVcsDeleteVersionLabel = nil;
  PVcsModifyVersionLabel: TVcsModifyVersionLabel = nil;
  PVcsAttachVersionLabel: TVcsAttachVersionLabel = nil;
  PVcsAttachVersionLabelByTimestamp: TVcsAttachVersionLabelByTimestamp = nil;
  PVcsAttachVersionLabelEx: TVcsAttachVersionLabelEx = nil;
  PVcsDetachVersionLabel: TVcsDetachVersionLabel = nil;
  PVcsPromote: TVcsPromote = nil;
  PVcsNextPromotionLabel: TVcsNextPromotionLabel = nil;
  PVcsCheckInFile: TVcsCheckInFile = nil;
  PVcsCheckInFileEx: TVcsCheckInFileEx = nil;
  PVcsCheckOutFile: TVcsCheckOutFile = nil;
  PVcsCheckOutFileEx: TVcsCheckOutFileEx = nil;
  PVcsCheckOutFiles: TVcsCheckOutFiles = nil;
  PVcsSetMergeInfo: TVcsSetMergeInfo = nil;
  PVcsGetCommonRoot: TVcsGetCommonRoot = nil;
  PVcsGetBranchInfo: TVcsGetBranchInfo = nil;
  PVcsUncheckOutFile: TVcsUncheckOutFile = nil;
  PVcsPasswordRequiredForModification: TVcsPasswordRequiredForModification = nil;
  PVcsValidUser: TVcsValidUser = nil;
  PVcsShareFile: TVcsShareFile = nil;
  PVcsUnshareFile: TVcsUnshareFile = nil;
  PVcsInvalidateCache: TVcsInvalidateCache = nil;
  PVcsMoveFile: TVcsMoveFile = nil;
  PVcsHistoryReport: TVcsHistoryReport = nil;
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

procedure LoadIt; forward;

function VcsLock( FileID, RevisionID: Cardinal; FullPath, LockComments: String; Lock, UpdateStatusOnLock: Boolean ): Integer;
begin
  if not Assigned( PVcsLock ) then
    LoadIt;
  if not Assigned( PVcsLock ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsLock' );
  Result := PVcsLock( FileID, RevisionID, PAnsiChar( AnsiString(FullPath) ), PAnsiChar( AnsiString(LockComments) ), Lock, UpdateStatusOnLock );
end;

function VcsValidUser( Username, Password: String ): Integer;
begin
  if not Assigned( PVcsValidUser ) then
    LoadIt;
  if not Assigned( PVcsValidUser ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsValidUser' );
  Result := PVcsValidUser( PAnsiChar(AnsiString(Username) ), PAnsiChar( AnsiString(Password) ) );
end;

function VcsPasswordRequiredForModification: Boolean;
begin
  if not Assigned( PVcsPasswordRequiredForModification ) then
    LoadIt;
  if not Assigned( PVcsPasswordRequiredForModification ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsPasswordRequiredForModification' );
  Result := PVcsPasswordRequiredForModification;
end;

function VcsUncheckOutFile( FileID: Cardinal ): Integer;
begin
  if not Assigned( PVcsUncheckOutFile ) then
    LoadIt;
  if not Assigned( PVcsUncheckOutFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsUncheckOutFile' );
  Result := PVcsUncheckOutFile( FileID );
end;

function VcsShareFile( var NewFileID: Cardinal; SourceFileID, TargetFolderID: Cardinal ): Integer;
begin
  if not Assigned( PVcsShareFile ) then
    LoadIt;
  if not Assigned( PVcsShareFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsShareFile' );
  Result := PVcsShareFile( NewFileID, SourceFileID, TargetFolderID );
end;

procedure VcsInvalidateCache;
begin
  if not Assigned( PVcsInvalidateCache ) then
    LoadIt;
  if not Assigned( PVcsInvalidateCache ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsInvalidateCache' );
  PVcsInvalidateCache;
end;

function VcsUnshareFile( FileID: Cardinal ): Integer;
begin
  if not Assigned( PVcsUnshareFile ) then
    LoadIt;
  if not Assigned( PVcsUnshareFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsUnshareFile' );
  Result := PVcsUnshareFile( FileID );
end;

procedure VcsHistoryReport( FileIDs: array of Cardinal; OutFile: String; Columns: Integer; FromVer, ToVer: Cardinal; FromDate, ToDate: Integer; IncFromVersion, FileDetails: Boolean );
begin
  if not Assigned( PVcsHistoryReport ) then
    LoadIt;
  if not Assigned( PVcsHistoryReport ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsHistoryReport' );
  PVcsHistoryReport( FileIDs, PAnsiChar( AnsiString(OutFile) ), Columns, FromVer, ToVer, FromDate, ToDate, IncFromVersion, FileDetails );
end;

function VcsMoveFile( SourceFileID, TargetFolderID: Cardinal ): Integer;
begin
  if not Assigned( PVcsMoveFile ) then
    LoadIt;
  if not Assigned( PVcsMoveFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsMoveFile' );
  Result := PVcsMoveFile( SourceFileID, TargetFolderID );
end;

function VcsCheckInFile( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; FileName: String; CheckInInfo: PCheckInInfo ): Integer;
begin
  if not Assigned( PVcsCheckInFile ) then
    LoadIt;
  if not Assigned( PVcsCheckInFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsCheckInFile' );
  Result := PVcsCheckInFile( ProjID, FolderID, FileID, RevisionID, PAnsiChar( AnsiString(FileName) ), CheckInInfo );
end;

function VcsCheckInFileEx( ProjID, FolderID: Cardinal; var FileID, RevisionID: Cardinal; FileName, SourceFile: String; DateTimeOverride: TDateTime; CheckInInfo: PCheckInInfo; UserOverride: String = '' ): Integer;
begin
  if not Assigned( PVcsCheckInFileEx ) then
    LoadIt;
  if not Assigned( PVcsCheckInFileEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsCheckInFile' );
  Result := PVcsCheckInFileEx( ProjID, FolderID, FileID, RevisionID, PAnsiChar( AnsiString(FileName) ), PAnsiChar( AnsiString(SourceFile) ), PAnsiChar( AnsiString(UserOverride) ), DateTimeToFileDate( DateTimeOverride ), CheckInInfo );
end;

function VcsCheckOutFile( FileID: Cardinal; var RevisionID: Cardinal; CheckOutInfo: PCheckOutInfo ): Integer;
begin
  if not Assigned( PVcsCheckOutFile ) then
    LoadIt;
  if not Assigned( PVcsCheckOutFile ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsCheckOutFile' );
  Result := PVcsCheckOutFile( FileID, RevisionID, CheckOutInfo );
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

function VcsCheckOutFileEx( FileID: Cardinal; var RevisionID: Cardinal; CheckOutInfo: PCheckOutInfo; FileName: String ): Integer;
begin
  if not Assigned( PVcsCheckOutFileEx ) then
    LoadIt;
  if not Assigned( PVcsCheckOutFileEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsCheckOutFileEx' );
  Result := PVcsCheckOutFileEx( FileID, RevisionID, CheckOutInfo, PAnsiChar(AnsiString( FileName) ) );
end;

function VcsCheckOutFiles( IDsAndNames: TStrings; CheckOutInfo: PCheckOutInfo; FBProc: TActionFeedback; TerminateOnError: Boolean ): Integer;
var
  i: Integer;
  sIDsAndNames: AnsiString;
begin
  if not Assigned( PVcsCheckOutFiles ) then
    LoadIt;
  if not Assigned( PVcsCheckOutFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsCheckOutFiles' );
  sIDsAndNames := '';
  for i := 0 to IDsAndNames.Count - 1 do
    if sIDsAndNames = '' then
      sIDsAndNames := AnsiString(IDsAndNames[ i ])
    else
      sIDsAndNames := sIDsAndNames + ';' + AnsiString(IDsAndNames[ i ]);
  Result := PVcsCheckOutFiles( PAnsiChar( sIDsAndNames ), CheckOutInfo, FBProc, TerminateOnError );
end;

function VcsNextPromotionLabel( var PromotionID: Cardinal; var PromotionLabel: String ): Integer;
var
  pLabel: PAnsiChar;
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

function VcsPromote( FileID: Cardinal ): Integer;
begin
  if not Assigned( PVcsPromote ) then
    LoadIt;
  if not Assigned( PVcsPromote ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsPromote' );
  Result := PVcsPromote( FileID );
end;

function VcsAttachVersionLabelEx( FileIDs: TCardinalArray; VersionID: Cardinal; CanMove: Boolean; FBProc: TActionFeedback; TerminateOnError: Boolean ): Integer;
begin
  if not Assigned( PVcsAttachVersionLabelEx ) then
    LoadIt;
  if not Assigned( PVcsAttachVersionLabelEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAttachVersionLabelEx' );
  Result := PVcsAttachVersionLabelEx( FileIDs, VersionID, CanMove, FBProc, TerminateOnError );
end;

function VcsAttachVersionLabelByTimestamp( FileID, VersionID: Cardinal; Stamp: TDateTime; CanMove: Boolean ): Integer;
begin
  if not Assigned( PVcsAttachVersionLabelByTimestamp ) then
    LoadIt;
  if not Assigned( PVcsAttachVersionLabelByTimestamp ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAttachVersionLabelByTimestamp' );
  Result := PVcsAttachVersionLabelByTimestamp( FileID, VersionID, Stamp, CanMove );
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
  Result := PVcsAddVersionLabel( LabelID, PAnsiChar( AnsiString(Name) ), PAnsiChar( AnsiString(Comments) ) );
end;

function VcsAddVersionLabelEx( var LabelID: Cardinal; Name, Comments: String; ProjectID: Cardinal ): Integer;
begin
  if not Assigned( PVcsAddVersionLabelEx ) then
    LoadIt;
  if not Assigned( PVcsAddVersionLabelEx ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddVersionLabelEx' );
  Result := PVcsAddVersionLabelEx( LabelID, PAnsiChar(AnsiString( Name) ), PAnsiChar( AnsiString(Comments) ), ProjectID );
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
  Result := PVcsModifyVersionLabel( LabelID, PAnsiChar( AnsiString(Name) ), PAnsiChar( AnsiString(Comments) ) );
end;

function VcsAddFolder( var FolderID: Cardinal; ParentID: Cardinal; Name, Path: String ): Integer;
begin
  if not Assigned( PVcsAddFolder ) then
    LoadIt;
  if not Assigned( PVcsAddFolder ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddFolder' );
  Result := PVcsAddFolder( FolderID, ParentID, PAnsiChar( AnsiString(Name) ), PAnsiChar(AnsiString( Path) ) );
end;

function VcsGetFolderPermissions( FolderID: Cardinal; var CanAccess, CanModify, CanCheckInOut: Boolean ): Integer;
begin
  if not Assigned( PVcsGetFolderPermissions ) then
    LoadIt;
  if not Assigned( PVcsGetFolderPermissions ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFolderPermissions' );
  Result := PVcsGetFolderPermissions( FolderID, CanAccess, CanModify, CanCheckInOut );
end;

function VcsGetFolderInfo( FolderID: Cardinal; var FolderName, TCPath, LocalFolder, Extra: String; var ParentID: Cardinal; var FolderCount, FileCount: Integer ): Integer;
var
  pName, pTCPath, pLocalFolder, pExtra: PAnsiChar;
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

function VcsRenameFolder( FolderID: Cardinal; Name, Path: String; ReflectInSubFolders: Boolean ): Integer;
begin
  if not Assigned( PVcsRenameFolder ) then
    LoadIt;
  if not Assigned( PVcsRenameFolder ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsRenameFolder' );
  Result := PVcsRenameFolder( FolderID, PAnsiChar( AnsiString(Name) ), PAnsiChar( AnsiString(Path) ), ReflectInSubFolders );
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
  Result := PVcsAddProject( ProjID, PAnsiChar( AnsiString(Name) ) );
end;

function VcsRenameProject( ProjID: Cardinal; Name: String ): Integer;
begin
  if not Assigned( PVcsRenameProject ) then
    LoadIt;
  if not Assigned( PVcsRenameProject ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsRenameProject' );
  Result := PVcsRenameProject( ProjID, PAnsiChar(AnsiString(Name)) );
end;

function VcsDeleteProject( ProjID: Cardinal ): Integer;
begin
  if not Assigned( PVcsDeleteProject ) then
    LoadIt;
  if not Assigned( PVcsDeleteProject ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDeleteProject' );
  Result := PVcsDeleteProject( ProjID );
end;

function VcsGetFileIDExt( var FileID: Cardinal; var TCPath: String; FilePath: String ): Integer;
var
  pTCPath: PAnsiChar;
begin
  if not Assigned( PVcsGetFileIDExt ) then
    LoadIt;
  if not Assigned( PVcsGetFileIDExt ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFileIDExt' );
  GetMem( pTCPath, 2048 );
  try
    Result := PVcsGetFileIDExt( FileID, pTCPath, PAnsiChar(AnsiString(FilePath)) );
    SetLength( TCPath, StrLen( pTCPath ) );
    TCPath := String( pTCPath );
  finally
    FreeMem( pTCPath, 2048 );
  end;
end;

function VcsGetFileID( var FileID: Cardinal; FilePath: String ): Integer;
begin
  if not Assigned( PVcsGetFileID ) then
    LoadIt;
  if not Assigned( PVcsGetFileID ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFileID' );
  Result := PVcsGetFileID( FileID, PAnsiChar( AnsiString(FilePath) ) );
end;

function VcsGetFileGroupExt( FileName: String; var Ext: String ): Integer;
var
  pExt: PAnsiChar;
begin
  if not Assigned( PVcsGetFileGroupExt ) then
    LoadIt;
  if not Assigned( PVcsGetFileGroupExt ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFileGroupExt' );
  GetMem( pExt, 512 );
  try
    Ext := ExtractFileExt( FileName );
    Result := PVcsGetFileGroupExt( PAnsiChar( AnsiString(FileName) ), pExt );
    if Result = Err_OK then
    begin
      SetLength( Ext, StrLen( pExt ) );
      Ext := String( pExt );
    end;
  finally
    FreeMem( pExt, 512 );
  end;
end;

function VcsGetFileGroupExtensions( FileName: String; var Ext: String ): Integer;
var
  pExt: PAnsiChar;
begin
  if not Assigned( PVcsGetFileGroupExtensions ) then
    LoadIt;
  if not Assigned( PVcsGetFileGroupExtensions ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetFileGroupExtensions' );
  GetMem( pExt, 512 );
  try
    Ext := ExtractFileExt( FileName );
    Result := PVcsGetFileGroupExtensions( PAnsiChar(AnsiString(FileName) ), pExt );
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
  pFilePath: PAnsiChar;
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
  pFilePath: PAnsiChar;
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
  pFilePath, pLockedBy: PAnsiChar;
begin
  if not Assigned( PVcsFileStatus ) then
    LoadIt;
  if not Assigned( PVcsFileStatus ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsFileStatus' );
  GetMem( pFilePath, 1024 );
  try
    GetMem( pLockedBy, 512 );
    try
      StrCopy( pFilePath, PAnsiChar( AnsiString(FilePath) ) );
      Result := PVcsFileStatus( ParentID, FileID, pFilePath, pLockedBy, Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status, IsVirtual, Frozen );
      if Result = Err_OK then
      begin
        SetLength( FilePath, StrLen( pFilePath ) );
        FilePath := String( pFilePath );
        SetLength( LockedBy, StrLen( pLockedBy ) );
        LockedBy := String( pLockedBy );
      end;
    finally
      FreeMem( pLockedBy, 512 );
    end;
  finally
    FreeMem( pFilePath, 1024 );
  end;
end;

function VcsAddView( var ViewID: Cardinal; ViewName, Description, Projects: String; BasisID: Cardinal; Shared: Boolean ): Integer;
begin
  if not Assigned( PVcsAddView ) then
    LoadIt;
  if not Assigned( PVcsAddView ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddView' );
  Result := PVcsAddView( ViewID, PAnsiChar( AnsiString(ViewName) ),
    PAnsiChar( AnsiString(Description) ), PAnsiChar( AnsiString(Projects) ), BasisID, Shared );
end;

function VcsUpdateView( ViewID: Cardinal; ViewName, Description, Projects: String; BasisID: Cardinal; Shared: Boolean ): Integer;
begin
  if not Assigned( PVcsUpdateView ) then
    LoadIt;
  if not Assigned( PVcsUpdateView ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsUpdateView' );
  Result := PVcsUpdateView( ViewID, PAnsiChar( AnsiString(ViewName )),
    PAnsiChar( AnsiString(Description )), PAnsiChar( AnsiString(Projects) ), BasisID, Shared );
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

procedure VcsCurrentConnection( var Connection, Username: String; var Connected: Boolean );
var
  pConnection, pUsername: PAnsiChar;
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

function VcsConnect( const Connection, Name, Password: String ): Integer;
begin
  if not Assigned( PVcsConnect ) then
    LoadIt;
  if not Assigned( PVcsConnect ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsConnect' );
  Result := PVcsConnect( PAnsiChar( AnsiString(Connection )),
    PAnsiChar( AnsiString(Name )), PAnsiChar( AnsiString(Password)) );
end;

function VcsDisconnect: Integer;
begin
  if not Assigned( PVcsDisconnect ) then
    LoadIt;
  if not Assigned( PVcsDisconnect ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDisconnect' );
  Result := PVcsDisconnect;
end;

function IntEnumProjects( Context, Data: Pointer; pName: PAnsiChar; ID: Cardinal ): Boolean; stdcall; forward;
function IntEnumFolders( Context, Data: Pointer; pName, pTCPath, pLocalFolder: PAnsiChar; ID, ParentID: Cardinal; FolderCount, FileCount: Integer ): Boolean; stdcall; forward;
function IntEnumFiles( Context, Data: Pointer; pName, pLocalPath, pLockedBy: PAnsiChar; ID, ParentID, AncestorID: Cardinal; Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; IsVirtual, Frozen: Boolean ): Boolean; stdcall; forward;
function IntEnumLockedFiles( Context, Data: Pointer; pName, pLockPath: PAnsiChar; ID, ParentID, LockedRevID: Cardinal; Modified, RevisionCount, Status: Integer ): Boolean; stdcall; forward;
function IntGetProjectList( Context, Data: Pointer; pName: PAnsiChar; ID: Cardinal ): Boolean; stdcall; forward;
function IntEnumProc( Context, Data: Pointer; pName, pDescription, pHost: PAnsiChar; Port: Integer; Current: Boolean ): Boolean; stdcall; forward;
function IntEnumViews( Context, Data: Pointer; pName, pDescription: PAnsiChar; ID: Cardinal; Shared, Current: Boolean ): Boolean; stdcall; forward;
function IntEnumRevisions( Context, Data: Pointer; pName, pAuthor, pComments, pLockedBy: PAnsiChar; ID, ParentID: Cardinal; Modified, Timestamp, CompressedSize, OriginalSize, CRC, VerCount, PromoCount: Integer ): Boolean; stdcall; forward;
function IntEnumLabels( Context, Data: Pointer; LabelType: Integer; pName, pComments: PAnsiChar; ID: Cardinal; Timestamp: Integer ): Boolean; stdcall; forward;

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

function VcsEnumViews( EnumProc: TEnumViews; Data: Pointer ): Integer;
begin
  if not Assigned( PVcsEnumViews ) then
    LoadIt;
  if not Assigned( PVcsEnumViews ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumViews' );
  Result := PVcsEnumViews( @EnumProc, Data, IntEnumViews );
end;

function VcsEnumLockedFiles( UserID: Cardinal; EnumProc: TEnumLockedFiles; Data: Pointer ): Integer;
begin
  if not Assigned( PVcsEnumLockedFiles ) then
    LoadIt;
  if not Assigned( PVcsEnumLockedFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumLockedFiles' );
  Result := PVcsEnumLockedFiles( UserID, @EnumProc, Data, IntEnumLockedFiles );
end;

function VcsEnumFiles( RootID: Cardinal; EnumProc: TEnumFiles; Data: Pointer; Recursive: Boolean ): Integer;
begin
  if not Assigned( PVcsEnumFiles ) then
    LoadIt;
  if not Assigned( PVcsEnumFiles ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumFiles' );
  Result := PVcsEnumFiles( RootID, @EnumProc, Data, IntEnumFiles, Recursive );
end;

function VcsEnumFolders( RootID: Cardinal; EnumProc: TEnumFolders; Data: Pointer; Recursive: Boolean ): Integer;
begin
  if not Assigned( PVcsEnumFolders ) then
    LoadIt;
  if not Assigned( PVcsEnumFolders ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumFolders' );
  Result := PVcsEnumFolders( RootID, @EnumProc, Data, IntEnumFolders, Recursive );
end;

function VcsProjectList( Projects: TStrings ): Integer;
begin
  if not Assigned( PVcsEnumProjects ) then
    LoadIt;
  if not Assigned( PVcsEnumProjects ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumProjects' );
  Projects.Clear;
  Result := PVcsEnumProjects( Pointer( Projects ), nil, IntGetProjectList );
end;

function VcsEnumProjects( EnumProc: TEnumProjects; Data: Pointer ): Integer;
begin
  if not Assigned( PVcsEnumProjects ) then
    LoadIt;
  if not Assigned( PVcsEnumProjects ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsEnumProjects' );
  Result := PVcsEnumProjects( @EnumProc, Data, IntEnumProjects );
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
  pMsg: PAnsiChar;
begin
  if not Assigned( PVcsAddConnection ) then
    LoadIt;
  if not Assigned( PVcsAddConnection ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsAddConnection' );
  GetMem( pMsg, 1024 );
  try
    Result := PVcsAddConnection( PAnsiChar(AnsiString( Name) ),
      PAnsiChar( AnsiString(Description )), PAnsiChar( AnsiString(Host) ), Port,
      PAnsiChar( AnsiString(Params)), pMsg );
    SetLength( Msg, StrLen( pMsg ) );
    Msg := String( pMsg );
  finally
    FreeMem( pMsg, 1024 );
  end;
end;

function VcsUpdateConnection( Name: String; Params: String; var Msg: String ): Boolean;
var
  pMsg: PAnsiChar;
begin
  if not Assigned( PVcsUpdateConnection ) then
    LoadIt;
  if not Assigned( PVcsUpdateConnection ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsUpdateConnection' );
  GetMem( pMsg, 1024 );
  try
    Result := PVcsUpdateConnection( PAnsiChar( AnsiString(Name) ), PAnsiChar( AnsiString(Params) ), pMsg );
    SetLength( Msg, StrLen( pMsg ) );
    Msg := String( pMsg );
  finally
    FreeMem( pMsg, 1024 );
  end;
end;

function VcsDeleteConnection( Name: String; var Msg: String ): Boolean;
var
  pMsg: PAnsiChar;
begin
  if not Assigned( PVcsDeleteConnection ) then
    LoadIt;
  if not Assigned( PVcsDeleteConnection ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsDeleteConnection' );
  GetMem( pMsg, 1024 );
  try
    Result := PVcsDeleteConnection( PAnsiChar( AnsiString(Name) ), pMsg );
    SetLength( Msg, StrLen( pMsg ) );
    Msg := String( pMsg );
  finally
    FreeMem( pMsg, 1024 );
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

function VcsSetObjectNotes( ObjectID: Cardinal; Notes: String ): Integer;
begin
  if not Assigned( PVcsSetObjectNotes ) then
    LoadIt;
  if not Assigned( PVcsSetObjectNotes ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsSetObjectNotes' );
  Result := Err_OK;
  if Assigned( PVcsSetObjectNotes ) then
    Result := PVcsSetObjectNotes( ObjectID, PAnsiChar( AnsiString(Notes) ) );
end;

function VcsGetObjectNotes( ObjectID: Cardinal; var Notes: String ): Integer;
var
  pNotes: PAnsiChar;
  Size, Sz: Integer;
begin
  if not Assigned( PVcsGetObjectNotes ) then
    LoadIt;
  if not Assigned( PVcsGetObjectNotes ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsGetObjectNotes' );
  Result := Err_OK;
  if Assigned( PVcsGetObjectNotes ) then
  begin
    Size := 32768;
    GetMem( pNotes, Size );
    try
      Sz := Size;
      Result := PVcsGetObjectNotes( ObjectID, pNotes, Sz );
      if Result = Err_InsufficientSpaceForData then
      begin
        FreeMem( pNotes, Size );
        GetMem( pNotes, Sz );
        Size := Sz;
        Result := PVcsGetObjectNotes( ObjectID, pNotes, Sz );
      end;
      if Result = Err_OK then
        Notes := String( pNotes );
    finally
      FreeMem( pNotes, Size );
    end;
  end;
end;

function VcsGetAddinInfo( ObjectID: Cardinal; AddinName: String; const ValuePairs: TStrings ): Integer;
var
  pInfo: PAnsiChar;
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
      Result := PVcsGetAddinInfo( ObjectID, PAnsiChar( AnsiString(AddinName) ), pInfo, Sz );
      if Result = Err_InsufficientSpaceForData then
      begin
        FreeMem( pInfo, Size );
        GetMem( pInfo, Sz );
        Size := Sz;
        Result := PVcsGetAddinInfo( ObjectID, PAnsiChar( AnsiString(AddinName)), pInfo, Sz );
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
  pMsg: PAnsiChar;
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

// Internal stuff

function IntEnumLabels( Context, Data: Pointer; LabelType: Integer; pName, pComments: PAnsiChar; ID: Cardinal; Timestamp: Integer ): Boolean;
var
  AProc: TEnumLabels;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, LabelType, String( pName ), String( pComments ), ID, Timestamp );
end;

function IntEnumRevisions( Context, Data: Pointer; pName, pAuthor, pComments, pLockedBy: PAnsiChar; ID, ParentID: Cardinal; Modified, Timestamp, CompressedSize, OriginalSize, CRC, VerCount, PromoCount: Integer ): Boolean;
var
  AProc: TEnumRevisions;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pAuthor ), String( pComments ), String( pLockedBy ), ID, ParentID, Modified, Timestamp, CompressedSize, OriginalSize, CRC, VerCount, PromoCount );
end;

function IntEnumViews( Context, Data: Pointer; pName, pDescription: PAnsiChar; ID: Cardinal; Shared, Current: Boolean ): Boolean;
var
  AProc: TEnumViews;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pDescription ), ID, Shared, Current );
end;

function IntEnumLockedFiles( Context, Data: Pointer; pName, pLockPath: PAnsiChar; ID, ParentID, LockedRevID: Cardinal; Modified, RevisionCount, Status: Integer ): Boolean;
var
  AProc: TEnumLockedFiles;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pLockPath ), ID, ParentID, LockedRevID, Modified, RevisionCount, Status );
end;

function IntEnumFiles( Context, Data: Pointer; pName, pLocalPath, pLockedBy: PAnsiChar; ID, ParentID, AncestorID: Cardinal; Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; IsVirtual, Frozen: Boolean ): Boolean;
var
  AProc: TEnumFiles;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pLocalPath ), String( pLockedBy ), ID, ParentID, AncestorID, Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status, IsVirtual, Frozen );
end;

function IntEnumFolders( Context, Data: Pointer; pName, pTCPath, pLocalFolder: PAnsiChar; ID, ParentID: Cardinal; FolderCount, FileCount: Integer ): Boolean;
var
  AProc: TEnumFolders;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pTCPath ), String( pLocalFolder ), ID, ParentID, FolderCount, FileCount );
end;

function IntGetProjectList( Context, Data: Pointer; pName: PAnsiChar; ID: Cardinal ): Boolean;
var
  Strings: TStrings;
begin
  Result := True;
  Strings := TStrings( Context );
  if Assigned( Strings ) then
    Strings.AddObject( String( pName ), Pointer( ID ) );
end;

function IntEnumProjects( Context, Data: Pointer; pName: PAnsiChar; ID: Cardinal ): Boolean;
var
  AProc: TEnumProjects;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), ID );
end;

function IntEnumProc( Context, Data: Pointer; pName, pDescription, pHost: PAnsiChar; Port: Integer; Current: Boolean ): Boolean;
var
  AProc: TEnumConnections;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pDescription ), String( pHost ), Port, Current );
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
const
  BlockSize = 65536;
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
          WorkStream := TGPVTempStream.Create;
          try
            ChkSize := cSize - BlockSize;
            if ChkSize >= BlockSize then
              ChkSize := BlockSize;
            if ChkSize <= 0 then
              ChkSize := cSize;
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
              if ChkSize >= BlockSize then
                ChkSize := BlockSize;
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
const
  BlockSize = 65536;
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
            Stream := TGPVTempStream.Create;
            try
              cDataCount := VcsGetExportData( cPosn, BlockSize, Stream );
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
                  cDataCount := VcsGetExportData( BckStream.Position, BlockSize, Stream );
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

function VcsBackup(): Integer;
begin
  if not Assigned( PVcsBackup ) then
    LoadIt;
  if not Assigned( PVcsBackup ) then
    raise EGpvFunctionNotExported.Create( 'Function not exported: VcsBackup' );
  Result := PVcsBackup();
end;

procedure LoadFromHandle( LibHandle: Cardinal );
begin
  {$IFDEF DEBUG_API}
  CodeSite.EnterMethod( 'Loading API' );
  {$ENDIF}
  if LibHandle > 0 then
  begin
    PVcsBeginAction := GetProcAddress( LibHandle, 'TCDVcsBeginAction' );
    PVcsEndAction := GetProcAddress( LibHandle, 'TCDVcsEndAction' );
    PVcsErrorString := GetProcAddress( LibHandle, 'TCDVcsErrorString' );
    PVcsGetAddinInfo := GetProcAddress( LibHandle, 'TCDVcsGetAddinInfo' );
    PVcsGetObjectNotes := GetProcAddress( LibHandle, 'TCDVcsGetObjectNotes' );
    PVcsSetObjectNotes := GetProcAddress( LibHandle, 'TCDVcsSetObjectNotes' );
    PVcsLock := GetProcAddress( LibHandle, 'TCDVcsLock' );
    PVcsAddConnection := GetProcAddress( LibHandle, 'TCDVcsAddConnection' );
    PVcsUpdateConnection := GetProcAddress( LibHandle, 'TCDVcsUpdateConnection' );
    PVcsDeleteConnection := GetProcAddress( LibHandle, 'TCDVcsDeleteConnection' );
    PVcsEnumConnections := GetProcAddress( LibHandle, 'TCDVcsEnumConnections' );
    PVcsCurrentConnection := GetProcAddress( LibHandle, 'TCDVcsCurrentConnection' );
    PVcsConnect := GetProcAddress( LibHandle, 'TCDVcsConnect' );
    PVcsDisconnect := GetProcAddress( LibHandle, 'TCDVcsDisconnect' );
    PVcsEnumProjects := GetProcAddress( LibHandle, 'TCDVcsEnumProjects' );
    PVcsEnumFolders := GetProcAddress( LibHandle, 'TCDVcsEnumFolders' );
    PVcsEnumFiles := GetProcAddress( LibHandle, 'TCDVcsEnumFiles' );
    PVcsEnumLockedFiles := GetProcAddress( LibHandle, 'TCDVcsEnumLockedFiles' );
    PVcsEnumViews := GetProcAddress( LibHandle, 'TCDVcsEnumViews' );
    PVcsSetView := GetProcAddress( LibHandle, 'TCDVcsSetView' );
    PVcsDeleteView := GetProcAddress( LibHandle, 'TCDVcsDeleteView' );
    PVcsAddView := GetProcAddress( LibHandle, 'TCDVcsAddView' );
    PVcsUpdateView := GetProcAddress( LibHandle, 'TCDVcsUpdateView' );
    PVcsFileStatus := GetProcAddress( LibHandle, 'TCDVcsFileStatus' );
    PVcsGetFileID := GetProcAddress( LibHandle, 'TCDVcsGetFileID' );
    PVcsGetFileIDExt := GetProcAddress( LibHandle, 'TCDVcsGetFileIDExt' );
    PVcsGetFileWorkingPath := GetProcAddress( LibHandle, 'TCDVcsGetFileWorkingPath' );
    PVcsGetFileCheckoutPath := GetProcAddress( LibHandle, 'TCDVcsGetFileCheckoutPath' );
    PVcsGetFileGroupExt := GetProcAddress( LibHandle, 'TCDVcsGetFileGroupExt' );
    PVcsGetFileGroupExtensions := GetProcAddress( LibHandle, 'TCDVcsGetFileGroupExtensions' );
    PVcsEnumRevisions := GetProcAddress( LibHandle, 'TCDVcsEnumRevisions' );
    PVcsEnumLabels := GetProcAddress( LibHandle, 'TCDVcsEnumLabels' );
    PVcsAddProject := GetProcAddress( LibHandle, 'TCDVcsAddProject' );
    PVcsRenameProject := GetProcAddress( LibHandle, 'TCDVcsRenameProject' );
    PVcsDeleteProject := GetProcAddress( LibHandle, 'TCDVcsDeleteProject' );
    PVcsAddFolder := GetProcAddress( LibHandle, 'TCDVcsAddFolder' );
    PVcsGetFolderInfo := GetProcAddress( LibHandle, 'TCDVcsGetFolderInfo' );
    PVcsGetFolderPermissions := GetProcAddress( LibHandle, 'TCDVcsGetFolderPermissions' );
    PVcsRenameFolder := GetProcAddress( LibHandle, 'TCDVcsRenameFolder' );
    PVcsDeleteFolder := GetProcAddress( LibHandle, 'TCDVcsDeleteFolder' );
    PVcsDeleteFile := GetProcAddress( LibHandle, 'TCDVcsDeleteFile' );
    PVcsRemoveObject := GetProcAddress( LibHandle, 'TCDVcsRemoveObject' );
    PVcsAddVersionLabel := GetProcAddress( LibHandle, 'TCDVcsAddVersionLabel' );
    PVcsAddVersionLabelEx := GetProcAddress( LibHandle, 'TCDVcsAddVersionLabelEx' );
    PVcsDeleteVersionLabel := GetProcAddress( LibHandle, 'TCDVcsDeleteVersionLabel' );
    PVcsModifyVersionLabel := GetProcAddress( LibHandle, 'TCDVcsModifyVersionLabel' );
    PVcsAttachVersionLabel := GetProcAddress( LibHandle, 'TCDVcsAttachVersionLabel' );
    PVcsAttachVersionLabelByTimestamp := GetProcAddress( LibHandle, 'TCDVcsAttachVersionLabelByTimestamp' );
    PVcsAttachVersionLabelEx := GetProcAddress( LibHandle, 'TCDVcsAttachVersionLabelEx' );
    PVcsDetachVersionLabel := GetProcAddress( LibHandle, 'TCDVcsDetachVersionLabel' );
    PVcsPromote := GetProcAddress( LibHandle, 'TCDVcsPromote' );
    PVcsNextPromotionLabel := GetProcAddress( LibHandle, 'TCDVcsNextPromotionLabel' );
    PVcsCheckInFile := GetProcAddress( LibHandle, 'TCDVcsCheckInFile' );
    PVcsCheckInFileEx := GetProcAddress( LibHandle, 'TCDVcsCheckInFileEx' );
    PVcsCheckOutFile := GetProcAddress( LibHandle, 'TCDVcsCheckOutFile' );
    PVcsCheckOutFileEx := GetProcAddress( LibHandle, 'TCDVcsCheckOutFileEx' );
    PVcsCheckOutFiles := GetProcAddress( LibHandle, 'TCDVcsCheckOutFiles' );
    PVcsSetMergeInfo := GetProcAddress( LibHandle, 'TCDVcsSetMergeInfo' );
    PVcsGetCommonRoot := GetProcAddress( LibHandle, 'TCDVcsGetCommonRoot' );
    PVcsGetBranchInfo := GetProcAddress( LibHandle, 'TCDVcsGetBranchInfo' );
    PVcsUncheckOutFile := GetProcAddress( LibHandle, 'TCDVcsUncheckOutFile' );
    PVcsPasswordRequiredForModification := GetProcAddress( LibHandle, 'TCDVcsPasswordRequiredForModification' );
    PVcsValidUser := GetProcAddress( LibHandle, 'TCDVcsValidUser' );
    PVcsShareFile := GetProcAddress( LibHandle, 'TCDVcsShareFile' );
    PVcsUnshareFile := GetProcAddress( LibHandle, 'TCDVcsUnshareFile' );
    PVcsInvalidateCache := GetProcAddress( LibHandle, 'TCDVcsInvalidateCache' );
    PVcsMoveFile := GetProcAddress( LibHandle, 'TCDVcsMoveFile' );
    PVcsHistoryReport := GetProcAddress( LibHandle, 'TCDVcsHistoryReport' );
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
    raise Exception.Create( 'Error Loading TC Interface' );
end;

procedure LoadIt;
var
  APath: String;
begin
  if LibHandle > 0 then Exit;
  if LibPath = '' then
  begin
    LibPath := InstallDir;
    {$IFDEF LINUX}
    LibPath := AddBackslash( ExtractFilePath( RemoveBackslash( LibPath ) ) ) + 'lib'
    {$ENDIF}
  end;
  APath := AddBackslash( LibPath ) + VcsCoreInterfaceFile;
  if FileExists( APath ) then
  begin
    LibHandle := LoadLibrary( PChar( APath ) );
    LoadFromHandle( LibHandle );
  end
  else
    raise EGpvCannotLocateClient.Create( Format( 'Could not locate TC Client: %s', [ APath ] ) );
end;

procedure VcsReleaseAPI;
begin
  if Assigned( PVcsConnect ) then
  begin
    {$IFDEF DEBUG_API}
    CodeSite.ExitMethod( 'Releasing API' );
    {$ENDIF}
    PVcsBeginAction := nil;
    PVcsEndAction := nil;
    PVcsErrorString := nil;
    PVcsGetAddinInfo := nil;
    PVcsGetObjectNotes := nil;
    PVcsSetObjectNotes := nil;
    PVcsLock := nil;
    PVcsAddConnection := nil;
    PVcsUpdateConnection := nil;
    PVcsDeleteConnection := nil;
    PVcsEnumConnections := nil;
    PVcsCurrentConnection := nil;
    PVcsConnect := nil;
    PVcsDisconnect := nil;
    PVcsEnumProjects := nil;
    PVcsEnumFolders := nil;
    PVcsEnumFiles := nil;
    PVcsEnumLockedFiles := nil;
    PVcsEnumViews := nil;
    PVcsSetView := nil;
    PVcsDeleteView := nil;
    PVcsAddView := nil;
    PVcsUpdateView := nil;
    PVcsFileStatus := nil;
    PVcsGetFileID := nil;
    PVcsGetFileIDExt := nil;
    PVcsGetFileWorkingPath := nil;
    PVcsGetFileCheckoutPath := nil;
    PVcsGetFileGroupExt := nil;
    PVcsGetFileGroupExtensions := nil;
    PVcsEnumRevisions := nil;
    PVcsEnumLabels := nil;
    PVcsAddProject := nil;
    PVcsRenameProject := nil;
    PVcsDeleteProject := nil;
    PVcsAddFolder := nil;
    PVcsGetFolderInfo := nil;
    PVcsGetFolderPermissions := nil;
    PVcsRenameFolder := nil;
    PVcsDeleteFolder := nil;
    PVcsDeleteFile := nil;
    PVcsRemoveObject := nil;
    PVcsAddVersionLabel := nil;
    PVcsAddVersionLabelEx := nil;
    PVcsDeleteVersionLabel := nil;
    PVcsModifyVersionLabel := nil;
    PVcsAttachVersionLabel := nil;
    PVcsAttachVersionLabelByTimestamp := nil;
    PVcsAttachVersionLabelEx := nil;
    PVcsDetachVersionLabel := nil;
    PVcsPromote := nil;
    PVcsNextPromotionLabel := nil;
    PVcsCheckInFile := nil;
    PVcsCheckInFileEx := nil;
    PVcsCheckOutFile := nil;
    PVcsCheckOutFileEx := nil;
    PVcsCheckOutFiles := nil;
    PVcsSetMergeInfo := nil;
    PVcsGetCommonRoot := nil;
    PVcsGetBranchInfo := nil;
    PVcsUncheckOutFile := nil;
    PVcsPasswordRequiredForModification := nil;
    PVcsValidUser := nil;
    PVcsShareFile := nil;
    PVcsUnshareFile := nil;
    PVcsInvalidateCache := nil;
    PVcsMoveFile := nil;
    PVcsHistoryReport := nil;
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
    if ( LibHandle > 0 ) then
      FreeLibrary( LibHandle );
    LibHandle := 0;
  end;
end;

initialization
finalization
  VcsReleaseAPI;
end.
