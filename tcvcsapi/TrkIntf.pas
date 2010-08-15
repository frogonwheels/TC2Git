{ $HDR$}
{ ******************************************************************** }
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{ ******************************************************************** }
{ $Log:  209014: TrkIntf.pas 
{
{   Rev 1.0    18/10/2007 10:38:30 AM  CompileSystem    Version: 1.1.000
{ 1.1.0
}
{
{   Rev 1.0    3/8/2006 6:17:20 PM  Michael
{ Internal Track  utility
}
{
    Rev 1.15    25/12/2005 02:14:56  Ewan
  New Version (7.2 and 7.1.3.30) - 25/12/05
  Web Updated #8
  FastMM4
}
{
    Rev 1.15    25/12/2005 02:14:56  Ewan
  New Version (7.2 and 7.1.3.30) - 25/12/05
  Web Updated #8
  FastMM4
}
{
    Rev 1.14    07/11/2005 16:50:08  Ewan
  Latest Changes (07/11/2005)
}
{
    Rev 1.13    28/10/2005 12:44:48  Ewan    Version: Marker
  Latest Changes (28/10/2005)
}
{
    Rev 1.12    02/09/2005 00:51:34  Ewan
  Latest release (again)
}
{
    Rev 1.11    22/07/2005 03:30:10  Ewan
  Latest release (again)
}
{
    Rev 1.10    16/07/2005 14:01:00  Ewan
  Latest Release... Tracker Fixes Mainly
}
{
    Rev 1.9    02/06/2005 23:20:36  Ewan
  Checkin for Linux update
}
{
    Rev 1.8    16/05/2005 12:05:22  Ewan
  New Release.
}
{
    Rev 1.7    12/05/2005 10:28:08  Ewan
  Fixed major issue with TCompress
}
{
    Rev 1.6    11/02/2004 10:58:00  Ewan
  Latest Release
}
{
    Rev 1.6    11/02/2004 10:58:00  Ewan
  Latest Release
}
{
    Rev 1.6    11/02/2004 10:58:00  Ewan
  Checkin for Linux
}
{
    Rev 1.5    07/02/2004 15:06:44  Ewan
  Latest changes
}
{
    Rev 1.4    22/08/2003 00:08:28  Ewan
  Just in case things go haywire
}
{
    Rev 1.3    04/06/2003 15:44:56  Ewan    Version: 7.1.2.5
  June Release
}
{
    Rev 1.2    07/02/2003 00:04:50  Ewan    Version: 7.1.1.35
  Released Version
}
{
    Rev 1.1    27/11/2002 01:17:08  Ewan    Version: 7.1.1.20
  Latest release. Final one before Linux port
}
unit TrkIntf;

interface

uses Windows, Classes, TCTrkTypes;

// UI / Internal
function TrkInit( Parent: HWnd ): Boolean;
function TrkIsAdminUser: Boolean;
function TrkAllUserID: Cardinal;
procedure TrkSelectIssue( IssueID: Cardinal );
procedure TrkSelectPage( PageCaption: String );
procedure TrkUpdatePanelHtml( Key, Html: String );
function TrkGetCoreInfo( Key, FieldName: String ): String;
function TrkSetCoreInfo( Key, FieldName, FieldValue: String ): Integer;
function TrkSelectUsers( var Items: TCardinalArray; var Names: String ): Boolean;
function TrkGroupsAndUsersFromIDs( Items: TCardinalArray ): String;
function TrkHasAccessRights( Items: TCardinalArray ): Boolean;
function TrkCanModifyIssue( IssueID: Cardinal ): Boolean;
procedure TrkReleaseAPI;
// Non-UI
function TrkConnect( Connection, Name, Password: String ): Integer;
procedure TrkCurrentConnection( var Connection, Username: String; var Connected: Boolean );
function TrkEnumConnections( EnumProc: TEnumConnections; Data: Pointer ): Integer;
function TrkEnumProjects( EnumProc: TEnumProjects; Data: Pointer ): Integer;
function TrkEnumFolders( RootID: Cardinal; EnumProc: TEnumFolders; Data: Pointer ): Integer;
function TrkEnumQueries( EnumProc: TEnumQueries; Data: Pointer ): Integer;
function TrkEnumIssues( RootID: Cardinal; EnumProc: TEnumIssues; Data: Pointer ): Integer;
function TrkEnumFields( IssueID: Cardinal; EnumProc: TEnumFields; Data: Pointer ): Integer;
function TrkEnumTemplates( EnumProc: TEnumTemplates; Data: Pointer ): Integer;
function TrkEnumUsers( EnumProc: TEnumUsers; Data: Pointer ): Integer;
function TrkEnumHistory( IssueID: Cardinal; EnumProc: TEnumHistory; Data: Pointer ): Integer;
function TrkEnumObjects( IssueID: Cardinal; EnumProc: TEnumObjects; Data: Pointer ): Integer;
function TrkEnumImages( IssueID: Cardinal; EnumProc: TEnumImages; Data: Pointer ): Integer;
function TrkGetIssueField( IssueID: Cardinal; FieldName: String; var FieldValue: String ): Integer;
function TrkSetIssueField( IssueID: Cardinal; FieldName, FieldValue: String ): Integer;
function TrkSetIssueFields( IssueID: Cardinal; UpdatePairs: String ): Integer;
function TrkGetFieldOptions( FieldName: String; const OptionList: TStrings; var Default: String ): Integer;
function TrkCreateIssue( ProjectID: Cardinal; var NewID: Cardinal; IssueType: Integer; Description: String; CompleteBy: Integer ): Integer;
function TrkDeleteIssue( IssueID: Cardinal ): Integer;
function TrkCreateProject( var NewID: Cardinal; Name: String ): Integer;
function TrkRenameProject( ProjID: Cardinal; Name: String ): Integer;
function TrkDeleteProject( ProjID: Cardinal ): Integer;
function TrkCreateFolder( ProjectID: Cardinal; var NewID: Cardinal; Name: String ): Integer;
function TrkRenameFolder( FolderID: Cardinal; Name: String ): Integer;
function TrkDeleteFolder( FolderID: Cardinal ): Integer;
function TrkUserByID( UID: Cardinal; var Name, FullName, EMail, Location: String ): Integer;
function TrkUserByName( Name: String; var UID: Cardinal; var FullName, EMail, Location: String ): Integer;
function TrkImportFromXML( FileName: String; CreateUsers, CreateProjects, AsNew: Boolean; var ErrMsg: String ): Integer;
function TrkIssueAsXMLFile( IssueID: Cardinal; FileName: String; Full: Boolean ): Integer;
function TrkIssueAsXMLStr( IssueID: Cardinal; var XMLStr: String; Full: Boolean ): Integer;
function TrkIssueAsHTMLFile( IssueID: Cardinal; FileName: String ): Integer;
function TrkIssueAsHTMLStr( IssueID: Cardinal; var HTMLStr: String ): Integer;
function TrkReportAsHTMLFile( QueryID, TemplateID: Cardinal; PageReport: Boolean; Title, FileName: String ): Integer;
function TrkReportAsHTMLStr( QueryID, TemplateID: Cardinal; PageReport: Boolean; Title: String; var HTMLStr: String ): Integer;
function TrkExportAsXMLFile( RootID: Cardinal; FileName: String ): Integer;
function TrkExportAsXMLStr( RootID: Cardinal; var XMLStr: String ): Integer;
function TrkUploadFileBegin( IssueID: Cardinal; var FileID: Integer; FileName: String ): Integer;
function TrkUploadFileData( IssueID: Cardinal; FileID: Integer; const Buffer; Count: Integer ): Integer;
function TrkUploadFileEnd( IssueID: Cardinal; FileID: Integer ): Integer;
function TrkUploadImageBegin( IssueID: Cardinal; var ImageID: Integer; AName, ADescription: String ): Integer;
function TrkUploadImageData( IssueID: Cardinal; ImageID: Integer; const Buffer; Count: Integer ): Integer;
function TrkUploadImageEnd( IssueID: Cardinal; ImageID: Integer ): Integer;
function TrkDownloadFileBegin( IssueID: Cardinal; FileID: Integer; var Size: Integer ): Integer;
function TrkDownloadFileData( IssueID: Cardinal; FileID: Integer; var Buffer; Count: Integer ): Integer;
function TrkDownloadFileEnd( IssueID: Cardinal; FileID: Integer ): Integer;
function TrkDownloadImageBegin( IssueID: Cardinal; ImageID: Integer; var Size: Integer ): Integer;
function TrkDownloadImageData( IssueID: Cardinal; ImageID: Integer; var Buffer; Count: Integer ): Integer;
function TrkDownloadImageEnd( IssueID: Cardinal; ImageID: Integer ): Integer;
function TrkDeleteObject( IssueID, ObjID: Cardinal ): Integer;
function TrkDeleteFile( IssueID: Cardinal; FileID: Integer ): Integer;
function TrkGetErrorString( ID: Integer ): String;
function TrkRefreshCache: Integer;
function TrkDisconnect: Integer;

function TrkConnectSv( Name, Password: String; ExpiresAfter: Integer; var Handle: Cardinal ): Integer;
function TrkGetIssueFieldSv( Handle, IssueID: Cardinal; FieldName: String; var FieldValue: String ): Integer;
function TrkSetIssueFieldSv( Handle, IssueID: Cardinal; FieldName, FieldValue: String ): Integer;
function TrkSetIssueFieldsSv( Handle, IssueID: Cardinal; UpdatePairs: String ): Integer;
function TrkGetFieldOptionsSv( Handle: Cardinal; FieldName: String; const OptionList: TStrings; var Default: String ): Integer;
function TrkCreateIssueSv( Handle, ProjectID: Cardinal; var NewID: Cardinal; IssueType: Integer; Description: String; CompleteBy: Integer ): Integer;
function TrkDeleteIssueSv( Handle, IssueID: Cardinal ): Integer;
function TrkCreateProjectSv( Handle: Cardinal; var NewID: Cardinal; Name: String ): Integer;
function TrkRenameProjectSv( Handle, ProjID: Cardinal; Name: String ): Integer;
function TrkDeleteProjectSv( Handle, ProjID: Cardinal ): Integer;
function TrkEnumProjectsSv( Handle: Cardinal; EnumProc: TEnumProjects; Data: Pointer ): Integer;
function TrkEnumQueriesSv( Handle: Cardinal; EnumProc: TEnumQueries; Data: Pointer ): Integer;
function TrkEnumIssuesSv( Handle, RootID: Cardinal; EnumProc: TEnumIssues; Data: Pointer ): Integer;
function TrkEnumFieldsSv( Handle, IssueID: Cardinal; EnumProc: TEnumFields; Data: Pointer ): Integer;
function TrkEnumTemplatesSv( Handle: Cardinal; EnumProc: TEnumTemplates; Data: Pointer ): Integer;
function TrkEnumUsersSv( Handle: Cardinal; EnumProc: TEnumUsers; Data: Pointer ): Integer;
function TrkEnumHistorySv( Handle, IssueID: Cardinal; EnumProc: TEnumHistory; Data: Pointer ): Integer;
function TrkEnumObjectsSv( Handle, IssueID: Cardinal; EnumProc: TEnumObjects; Data: Pointer ): Integer;
function TrkEnumImagesSv( Handle, IssueID: Cardinal; EnumProc: TEnumImages; Data: Pointer ): Integer;
function TrkReportAsHTMLFileSv( Handle, QueryID, TemplateID: Cardinal; PageReport: Boolean; Title, FileName: String ): Integer;
function TrkReportAsHTMLStrSv( Handle, QueryID, TemplateID: Cardinal; PageReport: Boolean; Title: String; var HTMLStr: String ): Integer;
function TrkExportAsXMLFileSv( Handle, RootID: Cardinal; FileName: String ): Integer;
function TrkExportAsXMLStrSv( Handle, RootID: Cardinal; var XMLStr: String ): Integer;
function TrkUploadFileBeginSv( Handle, IssueID: Cardinal; var FileID: Integer; FileName: String ): Integer;
function TrkUploadFileDataSv( Handle, IssueID: Cardinal; FileID: Integer; const Buffer; Count: Integer ): Integer;
function TrkUploadFileEndSv( Handle, IssueID: Cardinal; FileID: Integer ): Integer;
function TrkUploadImageBeginSv( Handle, IssueID: Cardinal; var ImageID: Integer; AName, ADescription: String ): Integer;
function TrkUploadImageDataSv( Handle, IssueID: Cardinal; ImageID: Integer; const Buffer; Count: Integer ): Integer;
function TrkUploadImageEndSv( Handle, IssueID: Cardinal; ImageID: Integer ): Integer;
function TrkDownloadFileBeginSv( Handle, IssueID: Cardinal; FileID: Integer; var Size: Integer ): Integer;
function TrkDownloadFileDataSv( Handle, IssueID: Cardinal; FileID: Integer; var Buffer; Count: Integer ): Integer;
function TrkDownloadFileEndSv( Handle, IssueID: Cardinal; FileID: Integer ): Integer;
function TrkDownloadImageBeginSv( Handle, IssueID: Cardinal; ImageID: Integer; var Size: Integer ): Integer;
function TrkDownloadImageDataSv( Handle, IssueID: Cardinal; ImageID: Integer; var Buffer; Count: Integer ): Integer;
function TrkDownloadImageEndSv( Handle, IssueID: Cardinal; ImageID: Integer ): Integer;
function TrkDeleteObjectSv( Handle, IssueID, ObjID: Cardinal ): Integer;
function TrkDeleteFileSv( Handle, IssueID: Cardinal; FileID: Integer ): Integer;
function TrkRefreshCacheSv: Integer;
function TrkGetErrorStringSv( ID: Integer ): String;
function TrkDisconnectSv( Handle: Cardinal ): Integer;

function ClientDLL: String;

implementation

uses
  {$IFDEF DEBUGAPI}
  CsIntf,
  {$ENDIF}
  SysUtils,
  {$IFDEF VER130}FileCtrl,{$ENDIF}
  TCTrkUtils,
  TCTrkConst;

var
  RealPath: String = '';
  LibHandle: Cardinal = 0;

type
  TTCTrkInit = function ( Parent: HWnd ): Boolean; stdcall;
  TTCTrkSelectIssue = procedure ( IssueID: Cardinal ); stdcall;
  TTCTrkCanModifyIssue = function ( IssueID: Cardinal ): Boolean; stdcall;
  TTCTrkSelectPage = procedure ( PageCaption: PChar ); stdcall;
  TTCTrkGetCoreInfo = function ( pKey, pFieldName: PChar; const pFieldValue: PChar; var Size: Integer ): Integer; stdcall;
  TTCTrkSetCoreInfo = function ( pKey, pFieldName, pFieldValue: PChar ): Integer; stdcall;
  TTCTrkSelectUsers = function ( const pList, pNames: PChar ): Boolean; stdcall;
  TTCTrkGroupsAndUsersFromIDs = procedure ( pItems: PCardinalArray; const pNames: PChar ); stdcall;
  TTCTrkHasAccessRights = function ( pItems: PCardinalArray ): Boolean; stdcall;
  TTCTrkIsAdminUser = function : Boolean;
  TTCTrkAllUserID = function : Cardinal; stdcall;
  TTCTrkUpdatePanelHtml = procedure ( pKey, pHtml: PChar ); stdcall;
  TTCDTrkConnect = function ( pConnection, pName, pPassword: PChar ): Integer; stdcall;
  TTCDTrkCurrentConnection = procedure ( const pConnection, pUsername: PChar; var Connected: Boolean ); stdcall;
  TTCDTrkEnumConnections = function ( Context, Data: Pointer; EnumProc: TIntEnumConnections ): Integer; stdcall;
  TTCDTrkEnumProjects = function ( Context, Data: Pointer; EnumProc: TIntEnumProjects ): Integer; stdcall;
  TTCDTrkEnumFolders = function ( RootID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumFolders ): Integer; stdcall;
  TTCDTrkEnumQueries = function ( Context, Data: Pointer; EnumProc: TIntEnumQueries ): Integer; stdcall;
  TTCDTrkEnumIssues = function ( RootID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumIssues ): Integer; stdcall;
  TTCDTrkEnumFields = function ( IssueID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumFields ): Integer; stdcall;
  TTCDTrkEnumHistory = function ( IssueID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumHistory ): Integer; stdcall;
  TTCDTrkEnumObjects = function ( IssueID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumObjects ): Integer; stdcall;
  TTCDTrkEnumImages = function ( IssueID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumImages ): Integer; stdcall;
  TTCDTrkEnumTemplates = function ( Context, Data: Pointer; EnumProc: TIntEnumTemplates ): Integer; stdcall;
  TTCDTrkEnumUsers = function ( Context, Data: Pointer; EnumProc: TIntEnumUsers ): Integer; stdcall;
  TTCDTrkGetIssueField = function ( IssueID: Cardinal; pFieldName: PChar; const pFieldValue: PChar; var FieldSize: Integer ): Integer; stdcall;
  TTCDTrkSetIssueField = function ( IssueID: Cardinal; pFieldName, pFieldValue: PChar ): Integer; stdcall;
  TTCDTrkSetIssueFields = function ( IssueID: Cardinal; pUpdatePairs: PChar ): Integer; stdcall;
  TTCDTrkGetFieldOptions = function ( pFieldName: PChar; const pOptionList, pDefault: PChar; var Size: Integer ): Integer; stdcall;
  TTCDTrkCreateIssue = function ( ProjectID: Cardinal; var NewID: Cardinal; IssueType: Integer; pDescription: PChar; CompleteBy: Integer ): Integer; stdcall;
  TTCDTrkDeleteIssue = function ( IssueID: Cardinal ): Integer; stdcall;
  TTCDTrkCreateProject = function ( var NewID: Cardinal; pName: PChar ): Integer; stdcall;
  TTCDTrkRenameProject = function ( ProjID: Cardinal; pName: PChar ): Integer; stdcall;
  TTCDTrkDeleteProject = function ( ProjID: Cardinal ): Integer; stdcall;
  TTCDTrkCreateFolder = function ( ProjectID: Cardinal; var NewID: Cardinal; pName: PChar ): Integer; stdcall;
  TTCDTrkRenameFolder = function ( FolderID: Cardinal; pName: PChar ): Integer; stdcall;
  TTCDTrkDeleteFolder = function ( FolderID: Cardinal ): Integer; stdcall;
  TTCDTrkUserByID = function ( UID: Cardinal; const pName, pFullName, pEMail, pLocation: PChar ): Integer; stdcall;
  TTCDTrkUserByName = function ( pName: PChar; var UID: Cardinal; const pFullName, pEMail, pLocation: PChar ): Integer; stdcall;
  TTCDTrkImportFromXML = function ( pFile: PChar; CreateUsers, CreateProjects, AsNew: Boolean; const pErrMsg: PChar ): Integer; stdcall;
  TTCDTrkIssueAsXML = function ( IssueID: Cardinal; pFile: PChar; const pBuffer: PChar; var Size: Integer; Full: Boolean ): Integer; stdcall;
  TTCDTrkIssueAsHTML = function ( IssueID: Cardinal; pFile: PChar; const pBuffer: PChar; var Size: Integer ): Integer; stdcall;
  TTCDTrkExecuteReport = function ( QueryID, TemplateID: Cardinal; PageReport: Boolean; pTitle, pFile: PChar; const pBuffer: PChar; var Size: Integer ): Integer; stdcall;
  TTCDTrkExportToXML = function ( RootID: Cardinal; pFile: PChar; const pBuffer: PChar; var Size: Integer ): Integer; stdcall;
  TTCDTrkUploadFileBegin = function ( IssueID: Cardinal; var FileID: Integer; pName: PChar ): Integer; stdcall;
  TTCDTrkUploadFileData = function ( IssueID: Cardinal; FileID: Integer; const Buffer; Count: Integer ): Integer; stdcall;
  TTCDTrkUploadFileEnd = function ( IssueID: Cardinal; FileID: Integer ): Integer; stdcall;
  TTCDTrkUploadImageBegin = function ( IssueID: Cardinal; var ImageID: Integer; pName, pDescription: PChar ): Integer; stdcall;
  TTCDTrkUploadImageData = function ( IssueID: Cardinal; ImageID: Integer; const Buffer; Count: Integer ): Integer; stdcall;
  TTCDTrkUploadImageEnd = function ( IssueID: Cardinal; ImageID: Integer ): Integer; stdcall;
  TTCDTrkDownloadFileBegin = function ( IssueID: Cardinal; FileID: Integer; var Size: Integer ): Integer; stdcall;
  TTCDTrkDownloadFileData = function ( IssueID: Cardinal; FileID: Integer; var Buffer; Count: Integer ): Integer; stdcall;
  TTCDTrkDownloadFileEnd = function ( IssueID: Cardinal; FileID: Integer ): Integer; stdcall;
  TTCDTrkDownloadImageBegin = function ( IssueID: Cardinal; ImageID: Integer; var Size: Integer ): Integer; stdcall;
  TTCDTrkDownloadImageData = function ( IssueID: Cardinal; ImageID: Integer; var Buffer; Count: Integer ): Integer; stdcall;
  TTCDTrkDownloadImageEnd = function ( IssueID: Cardinal; ImageID: Integer ): Integer; stdcall;
  TTCDTrkDeleteObject = function ( IssueID, ObjID: Cardinal ): Integer; stdcall;
  TTCDTrkDeleteFile = function ( IssueID: Cardinal; FileID: Integer ): Integer; stdcall;
  TTCDTrkRefreshCache = function : Integer; stdcall;
  TTCDTrkGetErrorString = function ( ID: Integer; const pMsg: PChar; var Size: Integer ): Integer; stdcall;
  TTCDTrkDisconnect = function : Integer; stdcall;
  // Server side interface
  TTCDSTrkConnect = function ( pName, pPassword: PChar; ExpiresAfter: Integer; var Handle: Cardinal ): Integer; stdcall;
  TTCDSTrkRefreshCache = function : Integer; stdcall;
  TTCDSTrkGetIssueField = function ( Handle, IssueID: Cardinal; pFieldName: PChar; const pFieldValue: PChar; var FieldSize: Integer ): Integer; stdcall;
  TTCDSTrkSetIssueField = function ( Handle, IssueID: Cardinal; pFieldName, pFieldValue: PChar ): Integer; stdcall;
  TTCDSTrkSetIssueFields = function ( Handle, IssueID: Cardinal; pUpdatePairs: PChar ): Integer; stdcall;
  TTCDSTrkGetFieldOptions = function ( Handle: Cardinal; pFieldName: PChar; const pOptionList, pDefault: PChar; var Size: Integer ): Integer; stdcall;
  TTCDSTrkCreateIssue = function ( Handle, ProjectID: Cardinal; var NewID: Cardinal; IssueType: Integer; pDescription: PChar; CompleteBy: Integer ): Integer; stdcall;
  TTCDSTrkDeleteIssue = function ( Handle, IssueID: Cardinal ): Integer; stdcall;
  TTCDSTrkCreateProject = function ( Handle: Cardinal; var NewID: Cardinal; pName: PChar ): Integer; stdcall;
  TTCDSTrkRenameProject = function ( Handle, ProjID: Cardinal; pName: PChar ): Integer; stdcall;
  TTCDSTrkDeleteProject = function ( Handle, ProjID: Cardinal ): Integer; stdcall;
  TTCDSTrkEnumProjects = function ( Handle: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumProjects ): Integer; stdcall;
  TTCDSTrkEnumQueries = function ( Handle: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumQueries ): Integer; stdcall;
  TTCDSTrkEnumIssues = function ( Handle, RootID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumIssues ): Integer; stdcall;
  TTCDSTrkEnumFields = function ( Handle, IssueID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumFields ): Integer; stdcall;
  TTCDSTrkEnumHistory = function ( Handle, IssueID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumHistory ): Integer; stdcall;
  TTCDSTrkEnumObjects = function ( Handle, IssueID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumObjects ): Integer; stdcall;
  TTCDSTrkEnumImages = function ( Handle, IssueID: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumImages ): Integer; stdcall;
  TTCDSTrkEnumTemplates = function ( Handle: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumTemplates ): Integer; stdcall;
  TTCDSTrkEnumUsers = function ( Handle: Cardinal; Context, Data: Pointer; EnumProc: TIntEnumUsers ): Integer; stdcall;
  TTCDSTrkExecuteReport = function ( Handle, QueryID, TemplateID: Cardinal; PageReport: Boolean; pTitle, pFile: PChar; const pBuffer: PChar; var Size: Integer ): Integer; stdcall;
  TTCDSTrkExportToXML = function ( Handle, RootID: Cardinal; pFile: PChar; const pBuffer: PChar; var Size: Integer ): Integer; stdcall;
  TTCDSTrkUploadFileBegin = function ( Handle, IssueID: Cardinal; var FileID: Integer; pName: PChar ): Integer; stdcall;
  TTCDSTrkUploadFileData = function ( Handle, IssueID: Cardinal; FileID: Integer; const Buffer; Count: Integer ): Integer; stdcall;
  TTCDSTrkUploadFileEnd = function ( Handle, IssueID: Cardinal; FileID: Integer ): Integer; stdcall;
  TTCDSTrkUploadImageBegin = function ( Handle, IssueID: Cardinal; var ImageID: Integer; pName, pDescription: PChar ): Integer; stdcall;
  TTCDSTrkUploadImageData = function ( Handle, IssueID: Cardinal; ImageID: Integer; const Buffer; Count: Integer ): Integer; stdcall;
  TTCDSTrkUploadImageEnd = function ( Handle, IssueID: Cardinal; ImageID: Integer ): Integer; stdcall;
  TTCDSTrkDownloadFileBegin = function ( Handle, IssueID: Cardinal; FileID: Integer; var Size: Integer ): Integer; stdcall;
  TTCDSTrkDownloadFileData = function ( Handle, IssueID: Cardinal; FileID: Integer; var Buffer; Count: Integer ): Integer; stdcall;
  TTCDSTrkDownloadFileEnd = function ( Handle, IssueID: Cardinal; FileID: Integer ): Integer; stdcall;
  TTCDSTrkDownloadImageBegin = function ( Handle, IssueID: Cardinal; ImageID: Integer; var Size: Integer ): Integer; stdcall;
  TTCDSTrkDownloadImageData = function ( Handle, IssueID: Cardinal; ImageID: Integer; var Buffer; Count: Integer ): Integer; stdcall;
  TTCDSTrkDownloadImageEnd = function ( Handle, IssueID: Cardinal; ImageID: Integer ): Integer; stdcall;
  TTCDSTrkDeleteObject = function ( Handle, IssueID, ObjID: Cardinal ): Integer; stdcall;
  TTCDSTrkDeleteFile = function ( Handle, IssueID: Cardinal; FileID: Integer ): Integer; stdcall;
  TTCDSTrkGetErrorString = function ( ID: Integer; const pMsg: PChar; var Size: Integer ): Integer; stdcall;
  TTCDSTrkDisconnect = function ( Handle: Cardinal ): Integer; stdcall;

var
  PTCTrkInit: TTCTrkInit = nil;
  PTCTrkSelectIssue: TTCTrkSelectIssue = nil;
  PTCTrkCanModifyIssue: TTCTrkCanModifyIssue = nil;
  PTCTrkSelectPage: TTCTrkSelectPage = nil;
  PTCTrkUpdatePanelHtml: TTCTrkUpdatePanelHtml = nil;
  PTCTrkGetCoreInfo: TTCTrkGetCoreInfo = nil;
  PTCTrkSetCoreInfo: TTCTrkSetCoreInfo = nil;
  PTCTrkSelectUsers: TTCTrkSelectUsers = nil;
  PTCTrkGroupsAndUsersFromIDs: TTCTrkGroupsAndUsersFromIDs = nil;
  PTCTrkHasAccessRights: TTCTrkHasAccessRights = nil;
  PTCTrkIsAdminUser: TTCTrkIsAdminUser = nil;
  PTCTrkAllUserID: TTCTrkAllUserID = nil;
  PTCDTrkConnect: TTCDTrkConnect = nil;
  PTCDTrkCurrentConnection: TTCDTrkCurrentConnection = nil;
  PTCDTrkEnumConnections: TTCDTrkEnumConnections = nil;
  PTCDTrkEnumProjects: TTCDTrkEnumProjects = nil;
  PTCDTrkEnumFolders: TTCDTrkEnumFolders = nil;
  PTCDTrkEnumQueries: TTCDTrkEnumQueries = nil;
  PTCDTrkEnumIssues: TTCDTrkEnumIssues = nil;
  PTCDTrkEnumFields: TTCDTrkEnumFields = nil;
  PTCDTrkEnumHistory: TTCDTrkEnumHistory = nil;
  PTCDTrkEnumObjects: TTCDTrkEnumObjects = nil;
  PTCDTrkEnumImages: TTCDTrkEnumImages = nil;
  PTCDTrkEnumTemplates: TTCDTrkEnumTemplates = nil;
  PTCDTrkEnumUsers: TTCDTrkEnumUsers = nil;
  PTCDTrkGetIssueField: TTCDTrkGetIssueField = nil;
  PTCDTrkSetIssueField: TTCDTrkSetIssueField = nil;
  PTCDTrkSetIssueFields: TTCDTrkSetIssueFields = nil;
  PTCDTrkGetFieldOptions: TTCDTrkGetFieldOptions = nil;
  PTCDTrkCreateIssue: TTCDTrkCreateIssue = nil;
  PTCDTrkDeleteIssue: TTCDTrkDeleteIssue = nil;
  PTCDTrkCreateProject: TTCDTrkCreateProject = nil;
  PTCDTrkRenameProject: TTCDTrkRenameProject = nil;
  PTCDTrkDeleteProject: TTCDTrkDeleteProject = nil;
  PTCDTrkCreateFolder: TTCDTrkCreateFolder = nil;
  PTCDTrkRenameFolder: TTCDTrkRenameFolder = nil;
  PTCDTrkDeleteFolder: TTCDTrkDeleteFolder = nil;
  PTCDTrkUserByID: TTCDTrkUserByID = nil;
  PTCDTrkUserByName: TTCDTrkUserByName = nil;
  PTCDTrkIssueAsXML: TTCDTrkIssueAsXML = nil;
  PTCDTrkImportFromXML: TTCDTrkImportFromXML = nil;
  PTCDTrkIssueAsHTML: TTCDTrkIssueAsHTML = nil;
  PTCDTrkExecuteReport: TTCDTrkExecuteReport = nil;
  PTCDTrkExportToXML: TTCDTrkExportToXML = nil;
  PTCDTrkUploadFileBegin: TTCDTrkUploadFileBegin = nil;
  PTCDTrkUploadFileData: TTCDTrkUploadFileData = nil;
  PTCDTrkUploadFileEnd: TTCDTrkUploadFileEnd = nil;
  PTCDTrkUploadImageBegin: TTCDTrkUploadImageBegin = nil;
  PTCDTrkUploadImageData: TTCDTrkUploadImageData = nil;
  PTCDTrkUploadImageEnd: TTCDTrkUploadImageEnd = nil;
  PTCDTrkDownloadFileBegin: TTCDTrkDownloadFileBegin = nil;
  PTCDTrkDownloadFileData: TTCDTrkDownloadFileData = nil;
  PTCDTrkDownloadFileEnd: TTCDTrkDownloadFileEnd = nil;
  PTCDTrkDownloadImageBegin: TTCDTrkDownloadImageBegin = nil;
  PTCDTrkDownloadImageData: TTCDTrkDownloadImageData = nil;
  PTCDTrkDownloadImageEnd: TTCDTrkDownloadImageEnd = nil;
  PTCDTrkDeleteObject: TTCDTrkDeleteObject = nil;
  PTCDTrkDeleteFile: TTCDTrkDeleteFile = nil;
  PTCDTrkRefreshCache: TTCDTrkRefreshCache = nil;
  PTCDSTrkRefreshCache: TTCDSTrkRefreshCache = nil;
  PTCDTrkGetErrorString: TTCDTrkGetErrorString = nil;
  PTCDTrkDisconnect: TTCDTrkDisconnect = nil;
  // Server-side interface
  PTCDSTrkConnect: TTCDSTrkConnect = nil;
  PTCDSTrkGetIssueField: TTCDSTrkGetIssueField = nil;
  PTCDSTrkSetIssueField: TTCDSTrkSetIssueField = nil;
  PTCDSTrkSetIssueFields: TTCDSTrkSetIssueFields = nil;
  PTCDSTrkGetFieldOptions: TTCDSTrkGetFieldOptions = nil;
  PTCDSTrkCreateIssue: TTCDSTrkCreateIssue = nil;
  PTCDSTrkDeleteIssue: TTCDSTrkDeleteIssue = nil;
  PTCDSTrkCreateProject: TTCDSTrkCreateProject = nil;
  PTCDSTrkRenameProject: TTCDSTrkRenameProject = nil;
  PTCDSTrkDeleteProject: TTCDSTrkDeleteProject = nil;
  PTCDSTrkEnumProjects: TTCDSTrkEnumProjects = nil;
  PTCDSTrkEnumQueries: TTCDSTrkEnumQueries = nil;
  PTCDSTrkEnumIssues: TTCDSTrkEnumIssues = nil;
  PTCDSTrkEnumFields: TTCDSTrkEnumFields = nil;
  PTCDSTrkEnumHistory: TTCDSTrkEnumHistory = nil;
  PTCDSTrkEnumObjects: TTCDSTrkEnumObjects = nil;
  PTCDSTrkEnumImages: TTCDSTrkEnumImages = nil;
  PTCDSTrkEnumTemplates: TTCDSTrkEnumTemplates = nil;
  PTCDSTrkEnumUsers: TTCDSTrkEnumUsers = nil;
  PTCDSTrkExecuteReport: TTCDSTrkExecuteReport = nil;
  PTCDSTrkExportToXML: TTCDSTrkExportToXML = nil;
  PTCDSTrkUploadFileBegin: TTCDSTrkUploadFileBegin = nil;
  PTCDSTrkUploadFileData: TTCDSTrkUploadFileData = nil;
  PTCDSTrkUploadFileEnd: TTCDSTrkUploadFileEnd = nil;
  PTCDSTrkUploadImageBegin: TTCDSTrkUploadImageBegin = nil;
  PTCDSTrkUploadImageData: TTCDSTrkUploadImageData = nil;
  PTCDSTrkUploadImageEnd: TTCDSTrkUploadImageEnd = nil;
  PTCDSTrkDownloadFileBegin: TTCDSTrkDownloadFileBegin = nil;
  PTCDSTrkDownloadFileData: TTCDSTrkDownloadFileData = nil;
  PTCDSTrkDownloadFileEnd: TTCDSTrkDownloadFileEnd = nil;
  PTCDSTrkDownloadImageBegin: TTCDSTrkDownloadImageBegin = nil;
  PTCDSTrkDownloadImageData: TTCDSTrkDownloadImageData = nil;
  PTCDSTrkDownloadImageEnd: TTCDSTrkDownloadImageEnd = nil;
  PTCDSTrkDeleteObject: TTCDSTrkDeleteObject = nil;
  PTCDSTrkDeleteFile: TTCDSTrkDeleteFile = nil;
  PTCDSTrkGetErrorString: TTCDSTrkGetErrorString = nil;
  PTCDSTrkDisconnect: TTCDSTrkDisconnect = nil;

  TrkCoreInterfaceFile: String = 'TrkMain.Dll';

procedure LoadIt; forward;

function TrkIssueAsHTMLStr( IssueID: Cardinal; var HTMLStr: String ): Integer;
var
  Size, OldSize: Integer;
  Buffer: PChar;
begin
  if not Assigned( PTCDTrkIssueAsHTML ) then
    LoadIt;
  if not Assigned( PTCDTrkIssueAsHTML ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkIssueAsHTML' );
  PTCDTrkIssueAsHTML( IssueID, nil, nil, Size );
  OldSize := Size;
  GetMem( Buffer, Size );
  try
    Result := PTCDTrkIssueAsHTML( IssueID, nil, Buffer, Size );
    SetLength( HTMLStr, StrLen( Buffer ) );
    HTMLStr := String( Buffer );
  finally
    FreeMem( Buffer, OldSize );
  end;
end;

function TrkIssueAsHTMLFile( IssueID: Cardinal; FileName: String ): Integer;
var
  Size: Integer;
begin
  if not Assigned( PTCDTrkIssueAsHTML ) then
    LoadIt;
  if not Assigned( PTCDTrkIssueAsHTML ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkIssueAsHTML' );
  Result := PTCDTrkIssueAsHTML( IssueID, PChar( FileName ), nil, Size );
end;

function TrkReportAsHTMLFile( QueryID, TemplateID: Cardinal; PageReport: Boolean; Title, FileName: String ): Integer;
var
  Size: Integer;
begin
  if not Assigned( PTCDTrkExecuteReport ) then
    LoadIt;
  if not Assigned( PTCDTrkExecuteReport ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkExecuteReport' );
  Result := PTCDTrkExecuteReport( QueryID, TemplateID, PageReport, PChar( Title ), PChar( FileName ), nil, Size );
end;

function TrkGetErrorString( ID: Integer ): String;
var
  Size, OldSize: Integer;
  Buffer: PChar;
begin
  if not Assigned( PTCDTrkGetErrorString ) then
    LoadIt;
  if not Assigned( PTCDTrkGetErrorString ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkGetErrorString' );
  Size := 0;
  PTCDTrkGetErrorString( ID, nil, Size );
  OldSize := Size;
  GetMem( Buffer, Size );
  try
    PTCDTrkGetErrorString( ID, Buffer, Size );
    SetLength( Result, StrLen( Buffer ) );
    Result := String( Buffer );
  finally
    FreeMem( Buffer, OldSize );
  end;
end;

function TrkGetErrorStringSv( ID: Integer ): String;
var
  Size, OldSize: Integer;
  Buffer: PChar;
begin
  if not Assigned( PTCDSTrkGetErrorString ) then
    LoadIt;
  if not Assigned( PTCDSTrkGetErrorString ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkGetErrorString' );
  Size := 0;
  PTCDSTrkGetErrorString( ID, nil, Size );
  OldSize := Size;
  GetMem( Buffer, Size );
  try
    PTCDSTrkGetErrorString( ID, Buffer, Size );
    SetLength( Result, StrLen( Buffer ) );
    Result := String( Buffer );
  finally
    FreeMem( Buffer, OldSize );
  end;
end;

function TrkReportAsHTMLStr( QueryID, TemplateID: Cardinal; PageReport: Boolean; Title: String; var HTMLStr: String ): Integer;
var
  Size, OldSize: Integer;
  Buffer: PChar;
begin
  if not Assigned( PTCDTrkExecuteReport ) then
    LoadIt;
  if not Assigned( PTCDTrkExecuteReport ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkExecuteReport' );
  PTCDTrkExecuteReport( QueryID, TemplateID, PageReport, PChar( Title ), nil, nil, Size );
  OldSize := Size;
  GetMem( Buffer, Size );
  try
    Result := PTCDTrkExecuteReport( QueryID, TemplateID, PageReport, PChar( Title ), nil, Buffer, Size );
    SetLength( HTMLStr, StrLen( Buffer ) );
    HTMLStr := String( Buffer );
  finally
    FreeMem( Buffer, OldSize );
  end;
end;

function TrkReportAsHTMLFileSv( Handle, QueryID, TemplateID: Cardinal; PageReport: Boolean; Title, FileName: String ): Integer;
var
  Size: Integer;
begin
  if not Assigned( PTCDSTrkExecuteReport ) then
    LoadIt;
  if not Assigned( PTCDSTrkExecuteReport ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkExecuteReport' );
  Result := PTCDSTrkExecuteReport( Handle, QueryID, TemplateID, PageReport, PChar( Title ), PChar( FileName ), nil, Size );
end;

function TrkReportAsHTMLStrSv( Handle, QueryID, TemplateID: Cardinal; PageReport: Boolean; Title: String; var HTMLStr: String ): Integer;
var
  Size, OldSize: Integer;
  Buffer: PChar;
begin
  if not Assigned( PTCDSTrkExecuteReport ) then
    LoadIt;
  if not Assigned( PTCDSTrkExecuteReport ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkExecuteReport' );
  PTCDSTrkExecuteReport( Handle, QueryID, TemplateID, PageReport, PChar( Title ), nil, nil, Size );
  OldSize := Size;
  GetMem( Buffer, Size );
  try
    Result := PTCDSTrkExecuteReport( Handle, QueryID, TemplateID, PageReport, PChar( Title ), nil, Buffer, Size );
    SetLength( HTMLStr, StrLen( Buffer ) );
    HTMLStr := String( Buffer );
  finally
    FreeMem( Buffer, OldSize );
  end;
end;

function TrkExportAsXMLFileSv( Handle, RootID: Cardinal; FileName: String ): Integer;
var
  Size: Integer;
begin
  if not Assigned( PTCDSTrkExportToXML ) then
    LoadIt;
  if not Assigned( PTCDSTrkExportToXML ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkExportToXML' );
  Result := PTCDSTrkExportToXML( Handle, RootID, PChar( FileName ), nil, Size );
end;

function TrkExportAsXMLStrSv( Handle, RootID: Cardinal; var XMLStr: String ): Integer;
var
  Size, OldSize: Integer;
  Buffer: PChar;
begin
  if not Assigned( PTCDSTrkExportToXML ) then
    LoadIt;
  if not Assigned( PTCDSTrkExportToXML ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkExportToXML' );
  PTCDSTrkExportToXML( Handle, RootID, nil, nil, Size );
  OldSize := Size;
  GetMem( Buffer, Size );
  try
    Result := PTCDSTrkExportToXML( Handle, RootID, nil, Buffer, Size );
    SetLength( XMLStr, StrLen( Buffer ) );
    XMLStr := String( Buffer );
  finally
    FreeMem( Buffer, OldSize );
  end;
end;

function TrkExportAsXMLFile( RootID: Cardinal; FileName: String ): Integer;
var
  Size: Integer;
begin
  if not Assigned( PTCDTrkExportToXML ) then
    LoadIt;
  if not Assigned( PTCDTrkExportToXML ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkExportToXML' );
  Result := PTCDTrkExportToXML( RootID, PChar( FileName ), nil, Size );
end;

function TrkDownloadFileBegin( IssueID: Cardinal; FileID: Integer; var Size: Integer ): Integer;
begin
  if not Assigned( PTCDTrkDownloadFileBegin ) then
    LoadIt;
  if not Assigned( PTCDTrkDownloadFileBegin ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDownloadFileBegin' );
  Result := PTCDTrkDownloadFileBegin( IssueID, FileID, Size );
end;

function TrkDownloadFileBeginSv( Handle, IssueID: Cardinal; FileID: Integer; var Size: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkDownloadFileBegin ) then
    LoadIt;
  if not Assigned( PTCDSTrkDownloadFileBegin ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDownloadFileBegin' );
  Result := PTCDSTrkDownloadFileBegin( Handle, IssueID, FileID, Size );
end;

function TrkDownloadImageBegin( IssueID: Cardinal; ImageID: Integer; var Size: Integer ): Integer;
begin
  if not Assigned( PTCDTrkDownloadImageBegin ) then
    LoadIt;
  if not Assigned( PTCDTrkDownloadImageBegin ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDownloadImageBegin' );
  Result := PTCDTrkDownloadImageBegin( IssueID, ImageID, Size );
end;

function TrkDownloadImageBeginSv( Handle, IssueID: Cardinal; ImageID: Integer; var Size: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkDownloadImageBegin ) then
    LoadIt;
  if not Assigned( PTCDSTrkDownloadImageBegin ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDownloadImageBegin' );
  Result := PTCDSTrkDownloadImageBegin( Handle, IssueID, ImageID, Size );
end;

function TrkDownloadFileData( IssueID: Cardinal; FileID: Integer; var Buffer; Count: Integer ): Integer;
begin
  if not Assigned( PTCDTrkDownloadFileData ) then
    LoadIt;
  if not Assigned( PTCDTrkDownloadFileData ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDownloadFileData' );
  Result := PTCDTrkDownloadFileData( IssueID, FileID, Buffer, Count );
end;

function TrkDownloadFileDataSv( Handle, IssueID: Cardinal; FileID: Integer; var Buffer; Count: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkDownloadFileData ) then
    LoadIt;
  if not Assigned( PTCDSTrkDownloadFileData ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDownloadFileData' );
  Result := PTCDSTrkDownloadFileData( Handle, IssueID, FileID, Buffer, Count );
end;

function TrkDownloadImageData( IssueID: Cardinal; ImageID: Integer; var Buffer; Count: Integer ): Integer;
begin
  if not Assigned( PTCDTrkDownloadImageData ) then
    LoadIt;
  if not Assigned( PTCDTrkDownloadImageData ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDownloadImageData' );
  Result := PTCDTrkDownloadImageData( IssueID, ImageID, Buffer, Count );
end;

function TrkDownloadImageDataSv( Handle, IssueID: Cardinal; ImageID: Integer; var Buffer; Count: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkDownloadImageData ) then
    LoadIt;
  if not Assigned( PTCDSTrkDownloadImageData ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDownloadImageData' );
  Result := PTCDSTrkDownloadImageData( Handle, IssueID, ImageID, Buffer, Count );
end;

function TrkDeleteObject( IssueID, ObjID: Cardinal ): Integer;
begin
  if not Assigned( PTCDTrkDeleteObject ) then
    LoadIt;
  if not Assigned( PTCDTrkDeleteObject ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDeleteObject' );
  Result := PTCDTrkDeleteObject( IssueID, ObjID );
end;

function TrkDeleteFile( IssueID: Cardinal; FileID: Integer ): Integer;
begin
  if not Assigned( PTCDTrkDeleteFile ) then
    LoadIt;
  if not Assigned( PTCDTrkDeleteFile ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDeleteFile' );
  Result := PTCDTrkDeleteFile( IssueID, FileID );
end;

function TrkDeleteObjectSv( Handle, IssueID, ObjID: Cardinal ): Integer;
begin
  if not Assigned( PTCDSTrkDeleteObject ) then
    LoadIt;
  if not Assigned( PTCDSTrkDeleteObject ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDeleteObject' );
  Result := PTCDSTrkDeleteObject( Handle, IssueID, ObjID );
end;

function TrkDeleteFileSv( Handle, IssueID: Cardinal; FileID: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkDeleteFile ) then
    LoadIt;
  if not Assigned( PTCDSTrkDeleteFile ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDeleteFile' );
  Result := PTCDSTrkDeleteFile( Handle, IssueID, FileID );
end;

function TrkDownloadFileEnd( IssueID: Cardinal; FileID: Integer ): Integer;
begin
  if not Assigned( PTCDTrkDownloadFileEnd ) then
    LoadIt;
  if not Assigned( PTCDTrkDownloadFileEnd ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDownloadFileEnd' );
  Result := PTCDTrkDownloadFileEnd( IssueID, FileID );
end;

function TrkDownloadFileEndSv( Handle, IssueID: Cardinal; FileID: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkDownloadFileEnd ) then
    LoadIt;
  if not Assigned( PTCDSTrkDownloadFileEnd ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDownloadFileEnd' );
  Result := PTCDSTrkDownloadFileEnd( Handle, IssueID, FileID );
end;

function TrkDownloadImageEnd( IssueID: Cardinal; ImageID: Integer ): Integer;
begin
  if not Assigned( PTCDTrkDownloadImageEnd ) then
    LoadIt;
  if not Assigned( PTCDTrkDownloadImageEnd ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDownloadImageEnd' );
  Result := PTCDTrkDownloadImageEnd( IssueID, ImageID );
end;

function TrkDownloadImageEndSv( Handle, IssueID: Cardinal; ImageID: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkDownloadImageEnd ) then
    LoadIt;
  if not Assigned( PTCDSTrkDownloadImageEnd ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDownloadImageEnd' );
  Result := PTCDSTrkDownloadImageEnd( Handle, IssueID, ImageID );
end;

function TrkUploadFileBegin( IssueID: Cardinal; var FileID: Integer; FileName: String ): Integer;
begin
  if not Assigned( PTCDTrkUploadFileBegin ) then
    LoadIt;
  if not Assigned( PTCDTrkUploadFileBegin ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkUploadFileBegin' );
  Result := PTCDTrkUploadFileBegin( IssueID, FileID, PChar( FileName ) );
end;

function TrkUploadFileBeginSv( Handle, IssueID: Cardinal; var FileID: Integer; FileName: String ): Integer;
begin
  if not Assigned( PTCDSTrkUploadFileBegin ) then
    LoadIt;
  if not Assigned( PTCDSTrkUploadFileBegin ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkUploadFileBegin' );
  Result := PTCDSTrkUploadFileBegin( Handle, IssueID, FileID, PChar( FileName ) );
end;

function TrkUploadFileData( IssueID: Cardinal; FileID: Integer; const Buffer; Count: Integer ): Integer;
begin
  if not Assigned( PTCDTrkUploadFileData ) then
    LoadIt;
  if not Assigned( PTCDTrkUploadFileData ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkUploadFileData' );
  Result := PTCDTrkUploadFileData( IssueID, FileID, Buffer, Count );
end;

function TrkUploadFileDataSv( Handle, IssueID: Cardinal; FileID: Integer; const Buffer; Count: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkUploadFileData ) then
    LoadIt;
  if not Assigned( PTCDSTrkUploadFileData ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkUploadFileData' );
  Result := PTCDSTrkUploadFileData( Handle, IssueID, FileID, Buffer, Count );
end;

function TrkUploadFileEnd( IssueID: Cardinal; FileID: Integer ): Integer;
begin
  if not Assigned( PTCDTrkUploadFileEnd ) then
    LoadIt;
  if not Assigned( PTCDTrkUploadFileEnd ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkUploadFileEnd' );
  Result := PTCDTrkUploadFileEnd( IssueID, FileID );
end;

function TrkUploadFileEndSv( Handle, IssueID: Cardinal; FileID: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkUploadFileEnd ) then
    LoadIt;
  if not Assigned( PTCDSTrkUploadFileEnd ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkUploadFileEnd' );
  Result := PTCDSTrkUploadFileEnd( Handle, IssueID, FileID );
end;

//
function TrkUploadImageBegin( IssueID: Cardinal; var ImageID: Integer; AName, ADescription: String ): Integer;
begin
  if not Assigned( PTCDTrkUploadImageBegin ) then
    LoadIt;
  if not Assigned( PTCDTrkUploadImageBegin ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkUploadImageBegin' );
  Result := PTCDTrkUploadImageBegin( IssueID, ImageID, PChar( AName ), PChar( ADescription ) );
end;

function TrkUploadImageBeginSv( Handle, IssueID: Cardinal; var ImageID: Integer; AName, ADescription: String ): Integer;
begin
  if not Assigned( PTCDSTrkUploadImageBegin ) then
    LoadIt;
  if not Assigned( PTCDSTrkUploadImageBegin ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkUploadImageBegin' );
  Result := PTCDSTrkUploadImageBegin( Handle, IssueID, ImageID, PChar( AName ), PChar( ADescription ) );
end;

function TrkUploadImageData( IssueID: Cardinal; ImageID: Integer; const Buffer; Count: Integer ): Integer;
begin
  if not Assigned( PTCDTrkUploadImageData ) then
    LoadIt;
  if not Assigned( PTCDTrkUploadImageData ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkUploadImageData' );
  Result := PTCDTrkUploadImageData( IssueID, ImageID, Buffer, Count );
end;

function TrkUploadImageDataSv( Handle, IssueID: Cardinal; ImageID: Integer; const Buffer; Count: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkUploadImageData ) then
    LoadIt;
  if not Assigned( PTCDSTrkUploadImageData ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkUploadImageData' );
  Result := PTCDSTrkUploadImageData( Handle, IssueID, ImageID, Buffer, Count );
end;

function TrkUploadImageEnd( IssueID: Cardinal; ImageID: Integer ): Integer;
begin
  if not Assigned( PTCDTrkUploadImageEnd ) then
    LoadIt;
  if not Assigned( PTCDTrkUploadImageEnd ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkUploadImageEnd' );
  Result := PTCDTrkUploadImageEnd( IssueID, ImageID );
end;

function TrkUploadImageEndSv( Handle, IssueID: Cardinal; ImageID: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkUploadImageEnd ) then
    LoadIt;
  if not Assigned( PTCDSTrkUploadImageEnd ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkUploadImageEnd' );
  Result := PTCDSTrkUploadImageEnd( Handle, IssueID, ImageID );
end;

//

function TrkExportAsXMLStr( RootID: Cardinal; var XMLStr: String ): Integer;
var
  Size, OldSize: Integer;
  Buffer: PChar;
begin
  if not Assigned( PTCDTrkExportToXML ) then
    LoadIt;
  if not Assigned( PTCDTrkExportToXML ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkExportToXML' );
  PTCDTrkExportToXML( RootID, nil, nil, Size );
  OldSize := Size;
  GetMem( Buffer, Size );
  try
    Result := PTCDTrkExportToXML( RootID, nil, Buffer, Size );
    SetLength( XMLStr, StrLen( Buffer ) );
    XMLStr := String( Buffer );
  finally
    FreeMem( Buffer, OldSize );
  end;
end;

function TrkIssueAsXMLStr( IssueID: Cardinal; var XMLStr: String; Full: Boolean ): Integer;
var
  Size, OldSize: Integer;
  Buffer: PChar;
begin
  if not Assigned( PTCDTrkIssueAsXML ) then
    LoadIt;
  if not Assigned( PTCDTrkIssueAsXML ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkIssueAsXML' );
  PTCDTrkIssueAsXML( IssueID, nil, nil, Size, Full );
  OldSize := Size;
  GetMem( Buffer, Size );
  try
    Result := PTCDTrkIssueAsXML( IssueID, nil, Buffer, Size, Full );
    SetLength( XMLStr, StrLen( Buffer ) );
    XMLStr := String( Buffer );
  finally
    FreeMem( Buffer, OldSize );
  end;
end;

function TrkIssueAsXMLFile( IssueID: Cardinal; FileName: String; Full: Boolean ): Integer;
var
  Size: Integer;
begin
  if not Assigned( PTCDTrkIssueAsXML ) then
    LoadIt;
  if not Assigned( PTCDTrkIssueAsXML ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkIssueAsXML' );
  Result := PTCDTrkIssueAsXML( IssueID, PChar( FileName ), nil, Size, Full );
end;

function TrkImportFromXML( FileName: String; CreateUsers, CreateProjects, AsNew: Boolean; var ErrMsg: String ): Integer;
var
  pErrMsg: PChar;
begin
  if not Assigned( PTCDTrkImportFromXML ) then
    LoadIt;
  if not Assigned( PTCDTrkImportFromXML ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkImportFromXML' );
  GetMem( pErrMsg, 1024 );
  try
    Result := PTCDTrkImportFromXML( PChar( FileName ), CreateUsers, CreateProjects, AsNew, pErrMsg );
    SetLength( ErrMsg, StrLen( pErrMsg ) );
    ErrMsg := String( pErrMsg );
  finally
    FreeMem( pErrMsg, 1024 );
  end;
end;

function TrkUserByName( Name: String; var UID: Cardinal; var FullName, EMail, Location: String ): Integer;
var
  pFullName, pEMail, pLocation: PChar;
begin
  if not Assigned( PTCDTrkUserByName ) then
    LoadIt;
  if not Assigned( PTCDTrkUserByName ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkUserByName' );
  GetMem( pFullName, 512 );
  try
    GetMem( pEMail, 512 );
    try
      GetMem( pLocation, 512 );
      try
        Result := PTCDTrkUserByName( PChar( Name ), UID, pFullName, pEMail, pLocation );
        SetLength( FullName, StrLen( pFullName ) );
        FullName := String( pFullName );
        SetLength( EMail, StrLen( pEMail ) );
        EMail := String( pEMail );
        SetLength( Location, StrLen( pLocation ) );
        Location := String( pLocation );
      finally
        FreeMem( pLocation, 512 );
      end;
    finally
      FreeMem( pEMail, 512 );
    end;
  finally
    FreeMem( pFullName, 512 );
  end;
end;

function TrkUserByID( UID: Cardinal; var Name, FullName, EMail, Location: String ): Integer;
var
  pName, pFullName, pEMail, pLocation: PChar;
begin
  if not Assigned( PTCDTrkUserByID ) then
    LoadIt;
  if not Assigned( PTCDTrkUserByID ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkUserByID' );
  GetMem( pName, 512 );
  try
    GetMem( pFullName, 512 );
    try
      GetMem( pEMail, 512 );
      try
        GetMem( pLocation, 512 );
        try
          Result := PTCDTrkUserByID( UID, pName, pFullName, pEMail, pLocation );
          SetLength( Name, StrLen( pName ) );
          Name := String( pName );
          SetLength( FullName, StrLen( pFullName ) );
          FullName := String( pFullName );
          SetLength( EMail, StrLen( pEMail ) );
          EMail := String( pEMail );
          SetLength( Location, StrLen( pLocation ) );
          Location := String( pLocation );
        finally
          FreeMem( pLocation, 512 );
        end;
      finally
        FreeMem( pEMail, 512 );
      end;
    finally
      FreeMem( pFullName, 512 );
    end;
  finally
    FreeMem( pName, 512 );
  end;
end;

function IntEnumConnections( Context, Data: Pointer; pName, pDescription, pHost: PChar; Port: Integer; Current: Boolean ): Boolean; stdcall; forward;
function IntEnumProjects( Context, Data: Pointer; pName: PChar; ID: Cardinal ): Boolean; stdcall; forward;
function IntEnumFolders( Context, Data: Pointer; pName: PChar; ID: Cardinal; Intray: Boolean ): Boolean; stdcall; forward;
function IntEnumQueries( Context, Data: Pointer; pName: PChar; ID: Cardinal; pDescription, pStatement: PChar; Temporary: Boolean; Shared: Boolean ): Boolean; stdcall; forward;
function IntEnumIssues( Context, Data: Pointer; pName: PChar; ID: Cardinal; IssueData: PTrkBaseIssue ): Boolean; stdcall; forward;
function IntEnumFields( Context, Data: Pointer; pFieldName, pFieldValue: PChar; FieldType: Word; UserDefined: Boolean ): Boolean; stdcall; forward;
function IntEnumTemplates( Context, Data: Pointer; ID: Cardinal; pName, pDescription: PChar; Scope: Word; Default: Boolean ): Boolean; stdcall; forward;
function IntEnumUsers( Context, Data: Pointer; ID: Cardinal; pName, pFullName, pEMail, pLocation: PChar ): Boolean; stdcall; forward;
function IntEnumHistory( Context, Data: Pointer; pAuthor, pFieldName, pOld, pNew: PChar; iTimestamp: Integer ): Boolean; stdcall; forward;
function IntEnumObjects( Context, Data: Pointer; TypeID, ObjectID: Cardinal; FileID: Integer; iTimestamp: Integer; pName, pObjTypeStr, pObjectPath, pDescription, pStatus: PChar ): Boolean; stdcall; forward;
function IntEnumImages( Context, Data: Pointer; ID: Integer; pName, pDescription: PChar ): Boolean; stdcall; forward;

function TrkEnumUsersSv( Handle: Cardinal; EnumProc: TEnumUsers; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDSTrkEnumUsers ) then
    LoadIt;
  if not Assigned( PTCDSTrkEnumUsers ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkEnumUsers' );
  Result := PTCDSTrkEnumUsers( Handle, @EnumProc, Data, IntEnumUsers );
end;

function TrkEnumTemplatesSv( Handle: Cardinal; EnumProc: TEnumTemplates; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDSTrkEnumTemplates ) then
    LoadIt;
  if not Assigned( PTCDSTrkEnumTemplates ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkEnumTemplates' );
  Result := PTCDSTrkEnumTemplates( Handle, @EnumProc, Data, IntEnumTemplates );
end;

function TrkEnumFieldsSv( Handle, IssueID: Cardinal; EnumProc: TEnumFields; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDSTrkEnumFields ) then
    LoadIt;
  if not Assigned( PTCDSTrkEnumFields ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkEnumFields' );
  Result := PTCDSTrkEnumFields( Handle, IssueID, @EnumProc, Data, IntEnumFields );
end;

function TrkEnumHistorySv( Handle, IssueID: Cardinal; EnumProc: TEnumHistory; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDSTrkEnumHistory ) then
    LoadIt;
  if not Assigned( PTCDSTrkEnumHistory ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkEnumHistory' );
  Result := PTCDSTrkEnumHistory( Handle, IssueID, @EnumProc, Data, IntEnumHistory );
end;

function TrkEnumObjectsSv( Handle, IssueID: Cardinal; EnumProc: TEnumObjects; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDSTrkEnumObjects ) then
    LoadIt;
  if not Assigned( PTCDSTrkEnumObjects ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkEnumObjects' );
  Result := PTCDSTrkEnumObjects( Handle, IssueID, @EnumProc, Data, IntEnumObjects );
end;

function TrkEnumImagesSv( Handle, IssueID: Cardinal; EnumProc: TEnumImages; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDSTrkEnumImages ) then
    LoadIt;
  if not Assigned( PTCDSTrkEnumImages ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkEnumImages' );
  Result := PTCDSTrkEnumImages( Handle, IssueID, @EnumProc, Data, IntEnumImages );
end;

function TrkEnumUsers( EnumProc: TEnumUsers; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumUsers ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumUsers ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumUsers' );
  Result := PTCDTrkEnumUsers( @EnumProc, Data, IntEnumUsers );
end;

function TrkEnumTemplates( EnumProc: TEnumTemplates; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumTemplates ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumTemplates ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumTemplates' );
  Result := PTCDTrkEnumTemplates( @EnumProc, Data, IntEnumTemplates );
end;

function TrkEnumFields( IssueID: Cardinal; EnumProc: TEnumFields; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumFields ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumFields ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumFields' );
  Result := PTCDTrkEnumFields( IssueID, @EnumProc, Data, IntEnumFields );
end;

function TrkEnumHistory( IssueID: Cardinal; EnumProc: TEnumHistory; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumHistory ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumHistory ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumHistory' );
  Result := PTCDTrkEnumHistory( IssueID, @EnumProc, Data, IntEnumHistory );
end;

function TrkEnumObjects( IssueID: Cardinal; EnumProc: TEnumObjects; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumObjects ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumObjects ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumObjects' );
  Result := PTCDTrkEnumObjects( IssueID, @EnumProc, Data, IntEnumObjects );
end;

function TrkEnumImages( IssueID: Cardinal; EnumProc: TEnumImages; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumImages ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumImages ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumImages' );
  Result := PTCDTrkEnumImages( IssueID, @EnumProc, Data, IntEnumImages );
end;

function TrkEnumIssuesSv( Handle, RootID: Cardinal; EnumProc: TEnumIssues; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDSTrkEnumIssues ) then
    LoadIt;
  if not Assigned( PTCDSTrkEnumIssues ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkEnumIssues' );
  Result := PTCDSTrkEnumIssues( Handle, RootID, @EnumProc, Data, IntEnumIssues );
end;

function TrkEnumIssues( RootID: Cardinal; EnumProc: TEnumIssues; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumIssues ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumIssues ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumIssues' );
  Result := PTCDTrkEnumIssues( RootID, @EnumProc, Data, IntEnumIssues );
end;

function TrkEnumQueriesSv( Handle: Cardinal; EnumProc: TEnumQueries; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDSTrkEnumQueries ) then
    LoadIt;
  if not Assigned( PTCDSTrkEnumQueries ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkEnumQueries' );
  Result := PTCDSTrkEnumQueries( Handle, @EnumProc, Data, IntEnumQueries );
end;

function TrkEnumQueries( EnumProc: TEnumQueries; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumQueries ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumQueries ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumQueries' );
  Result := PTCDTrkEnumQueries( @EnumProc, Data, IntEnumQueries );
end;

function TrkEnumFolders( RootID: Cardinal; EnumProc: TEnumFolders; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumFolders ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumFolders ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumFolders' );
  Result := PTCDTrkEnumFolders( RootID, @EnumProc, Data, IntEnumFolders );
end;

function TrkEnumProjectsSv( Handle: Cardinal; EnumProc: TEnumProjects; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDSTrkEnumProjects ) then
    LoadIt;
  if not Assigned( PTCDSTrkEnumProjects ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkEnumProjects' );
  Result := PTCDSTrkEnumProjects( Handle, @EnumProc, Data, IntEnumProjects );
end;

function TrkEnumProjects( EnumProc: TEnumProjects; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumProjects ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumProjects ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumProjects' );
  Result := PTCDTrkEnumProjects( @EnumProc, Data, IntEnumProjects );
end;

function TrkEnumConnections( EnumProc: TEnumConnections; Data: Pointer ): Integer;
begin
  if not Assigned( PTCDTrkEnumConnections ) then
    LoadIt;
  if not Assigned( PTCDTrkEnumConnections ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkEnumConnections' );
  Result := PTCDTrkEnumConnections( @EnumProc, Data, IntEnumConnections );
end;

function TrkDisconnectSv( Handle: Cardinal ): Integer;
begin
  if not Assigned( PTCDSTrkDisconnect ) then
    LoadIt;
  if not Assigned( PTCDSTrkDisconnect ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDisconnect' );
  Result := PTCDSTrkDisconnect( Handle );
end;

function TrkDisconnect: Integer;
begin
  if not Assigned( PTCDTrkDisconnect ) then
    LoadIt;
  if not Assigned( PTCDTrkDisconnect ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDisconnect' );
  Result := PTCDTrkDisconnect;
end;

function TrkRefreshCache: Integer;
begin
  if not Assigned( PTCDTrkRefreshCache ) then
    LoadIt;
  if not Assigned( PTCDTrkRefreshCache ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkRefreshCache' );
  Result := PTCDTrkRefreshCache;
end;

function TrkDeleteFolder( FolderID: Cardinal ): Integer;
begin
  if not Assigned( PTCDTrkDeleteFolder ) then
    LoadIt;
  if not Assigned( PTCDTrkDeleteFolder ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDeleteFolder' );
  Result := PTCDTrkDeleteFolder( FolderID );
end;

function TrkRenameFolder( FolderID: Cardinal; Name: String ): Integer;
begin
  if not Assigned( PTCDTrkRenameFolder ) then
    LoadIt;
  if not Assigned( PTCDTrkRenameFolder ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkRenameFolder' );
  Result := PTCDTrkRenameFolder( FolderID, PChar( Name ) );
end;

function TrkCreateFolder( ProjectID: Cardinal; var NewID: Cardinal; Name: String ): Integer;
begin
  if not Assigned( PTCDTrkCreateFolder ) then
    LoadIt;
  if not Assigned( PTCDTrkCreateFolder ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkCreateFolder' );
  Result := PTCDTrkCreateFolder( ProjectID, NewID, PChar( Name ) );
end;

function TrkDeleteProjectSv( Handle, ProjID: Cardinal ): Integer;
begin
  if not Assigned( PTCDSTrkDeleteProject ) then
    LoadIt;
  if not Assigned( PTCDSTrkDeleteProject ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDeleteProject' );
  Result := PTCDSTrkDeleteProject( Handle, ProjID );
end;

function TrkDeleteProject( ProjID: Cardinal ): Integer;
begin
  if not Assigned( PTCDTrkDeleteProject ) then
    LoadIt;
  if not Assigned( PTCDTrkDeleteProject ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDeleteProject' );
  Result := PTCDTrkDeleteProject( ProjID );
end;

function TrkRenameProjectSv( Handle, ProjID: Cardinal; Name: String ): Integer;
begin
  if not Assigned( PTCDSTrkRenameProject ) then
    LoadIt;
  if not Assigned( PTCDSTrkRenameProject ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkRenameProject' );
  Result := PTCDSTrkRenameProject( Handle, ProjID, PChar( Name ) );
end;

function TrkRenameProject( ProjID: Cardinal; Name: String ): Integer;
begin
  if not Assigned( PTCDTrkRenameProject ) then
    LoadIt;
  if not Assigned( PTCDTrkRenameProject ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkRenameProject' );
  Result := PTCDTrkRenameProject( ProjID, PChar( Name ) );
end;

function TrkCreateProjectSv( Handle: Cardinal; var NewID: Cardinal; Name: String ): Integer;
begin
  if not Assigned( PTCDSTrkCreateProject ) then
    LoadIt;
  if not Assigned( PTCDSTrkCreateProject ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkCreateProject' );
  Result := PTCDSTrkCreateProject( Handle, NewID, PChar( Name ) );
end;

function TrkCreateProject( var NewID: Cardinal; Name: String ): Integer;
begin
  if not Assigned( PTCDTrkCreateProject ) then
    LoadIt;
  if not Assigned( PTCDTrkCreateProject ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkCreateProject' );
  Result := PTCDTrkCreateProject( NewID, PChar( Name ) );
end;

function TrkDeleteIssueSv( Handle, IssueID: Cardinal ): Integer;
begin
  if not Assigned( PTCDSTrkDeleteIssue ) then
    LoadIt;
  if not Assigned( PTCDSTrkDeleteIssue ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkDeleteIssue' );
  Result := PTCDSTrkDeleteIssue( Handle, IssueID );
end;

function TrkDeleteIssue( IssueID: Cardinal ): Integer;
begin
  if not Assigned( PTCDTrkDeleteIssue ) then
    LoadIt;
  if not Assigned( PTCDTrkDeleteIssue ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkDeleteIssue' );
  Result := PTCDTrkDeleteIssue( IssueID );
end;

function TrkCreateIssueSv( Handle, ProjectID: Cardinal; var NewID: Cardinal; IssueType: Integer; Description: String; CompleteBy: Integer ): Integer;
begin
  if not Assigned( PTCDSTrkCreateIssue ) then
    LoadIt;
  if not Assigned( PTCDSTrkCreateIssue ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkCreateIssue' );
  Result := PTCDSTrkCreateIssue( Handle, ProjectID, NewID, IssueType, PChar( Description ), CompleteBy );
end;

function TrkCreateIssue( ProjectID: Cardinal; var NewID: Cardinal; IssueType: Integer; Description: String; CompleteBy: Integer ): Integer;
begin
  if not Assigned( PTCDTrkCreateIssue ) then
    LoadIt;
  if not Assigned( PTCDTrkCreateIssue ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkCreateIssue' );
  Result := PTCDTrkCreateIssue( ProjectID, NewID, IssueType, PChar( Description ), CompleteBy );
end;

function TrkGetFieldOptionsSv( Handle: Cardinal; FieldName: String; const OptionList: TStrings; var Default: String ): Integer;
var
  Size, OldSize: Integer;
  pOptions, pDefault: PChar;
begin
  if not Assigned( PTCDSTrkGetFieldOptions ) then
    LoadIt;
  if not Assigned( PTCDSTrkGetFieldOptions ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkGetFieldOptions' );
  Size := 1024;
  OldSize := Size;
  GetMem( pDefault, 1024 );
  try
    GetMem( pOptions, Size );
    try
      Result := PTCDSTrkGetFieldOptions( Handle, PChar( FieldName ), pOptions, pDefault, Size );
      if Result = Err_InvalidRecordSize then
      begin
        FreeMem( pOptions, OldSize );
        OldSize := Size;
        GetMem( pOptions, Size );
        Result := PTCDSTrkGetFieldOptions( Handle, PChar( FieldName ), pOptions, pDefault, Size );
      end;
      SetLength( Default, StrLen( pDefault ) );
      Default := String( pDefault );
      OptionList.Text := String( pOptions );
    finally
      FreeMem( pOptions, OldSize );
    end;
  finally
    FreeMem( pDefault, 1024 );
  end;
end;

function TrkGetFieldOptions( FieldName: String; const OptionList: TStrings; var Default: String ): Integer;
var
  Size, OldSize: Integer;
  pOptions, pDefault: PChar;
begin
  if not Assigned( PTCDTrkGetFieldOptions ) then
    LoadIt;
  if not Assigned( PTCDTrkGetFieldOptions ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkGetFieldOptions' );
  Size := 1024;
  OldSize := Size;
  GetMem( pDefault, 1024 );
  try
    GetMem( pOptions, Size );
    try
      Result := PTCDTrkGetFieldOptions( PChar( FieldName ), pOptions, pDefault, Size );
      if Result = Err_InvalidRecordSize then
      begin
        FreeMem( pOptions, OldSize );
        OldSize := Size;
        GetMem( pOptions, Size );
        Result := PTCDTrkGetFieldOptions( PChar( FieldName ), pOptions, pDefault, Size );
      end;
      SetLength( Default, StrLen( pDefault ) );
      Default := String( pDefault );
      OptionList.Text := String( pOptions );
    finally
      FreeMem( pOptions, OldSize );
    end;
  finally
    FreeMem( pDefault, 1024 );
  end;
end;

function TrkSetIssueFieldsSv( Handle, IssueID: Cardinal; UpdatePairs: String ): Integer;
begin
  if not Assigned( PTCDSTrkSetIssueFields ) then
    LoadIt;
  if not Assigned( PTCDSTrkSetIssueFields ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkSetIssueFields' );
  Result := PTCDSTrkSetIssueFields( Handle, IssueID, PChar( UpdatePairs ) );
end;

function TrkSetIssueFields( IssueID: Cardinal; UpdatePairs: String ): Integer;
begin
  if not Assigned( PTCDTrkSetIssueFields ) then
    LoadIt;
  if not Assigned( PTCDTrkSetIssueFields ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkSetIssueFields' );
  Result := PTCDTrkSetIssueFields( IssueID, PChar( UpdatePairs ) );
end;

function TrkSetIssueFieldSv( Handle, IssueID: Cardinal; FieldName, FieldValue: String ): Integer;
begin
  if not Assigned( PTCDSTrkSetIssueField ) then
    LoadIt;
  if not Assigned( PTCDSTrkSetIssueField ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkSetIssueField' );
  Result := PTCDSTrkSetIssueField( Handle, IssueID, PChar( FieldName ), PChar( FieldValue ) );
end;

function TrkSetIssueField( IssueID: Cardinal; FieldName, FieldValue: String ): Integer;
begin
  if not Assigned( PTCDTrkSetIssueField ) then
    LoadIt;
  if not Assigned( PTCDTrkSetIssueField ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkSetIssueField' );
  Result := PTCDTrkSetIssueField( IssueID, PChar( FieldName ), PChar( FieldValue ) );
end;

function TrkRefreshCacheSv: Integer;
begin
  if not Assigned( PTCDSTrkRefreshCache ) then
    LoadIt;
  if not Assigned( PTCDSTrkRefreshCache ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkRefreshCache' );
  Result := PTCDSTrkRefreshCache;
end;

function TrkGetIssueFieldSv( Handle, IssueID: Cardinal; FieldName: String; var FieldValue: String ): Integer;
var
  Size, OldSize: Integer;
  pFieldValue: PChar;
begin
  if not Assigned( PTCDSTrkGetIssueField ) then
    LoadIt;
  if not Assigned( PTCDSTrkGetIssueField ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkGetIssueField' );
  Size := 1024;
  OldSize := Size;
  GetMem( pFieldValue, Size );
  try
    Result := PTCDSTrkGetIssueField( Handle, IssueID, PChar( FieldName ), pFieldValue, Size );
    if Result = Err_InvalidRecordSize then
    begin
      FreeMem( pFieldValue, OldSize );
      OldSize := Size;
      GetMem( pFieldValue, Size );
      Result := PTCDSTrkGetIssueField( Handle, IssueID, PChar( FieldName ), pFieldValue, Size );
    end;
    SetLength( FieldValue, StrLen( pFieldValue ) );
    FieldValue := String( pFieldValue );
  finally
    FreeMem( pFieldValue, OldSize );
  end;
end;

function TrkGetIssueField( IssueID: Cardinal; FieldName: String; var FieldValue: String ): Integer;
var
  Size, OldSize: Integer;
  pFieldValue: PChar;
begin
  if not Assigned( PTCDTrkGetIssueField ) then
    LoadIt;
  if not Assigned( PTCDTrkGetIssueField ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkGetIssueField' );
  Size := 1024;
  OldSize := Size;
  GetMem( pFieldValue, Size );
  try
    Result := PTCDTrkGetIssueField( IssueID, PChar( FieldName ), pFieldValue, Size );
    if Result = Err_InvalidRecordSize then
    begin
      FreeMem( pFieldValue, OldSize );
      OldSize := Size;
      GetMem( pFieldValue, Size );
      Result := PTCDTrkGetIssueField( IssueID, PChar( FieldName ), pFieldValue, Size );
    end;
    SetLength( FieldValue, StrLen( pFieldValue ) );
    FieldValue := String( pFieldValue );
  finally
    FreeMem( pFieldValue, OldSize );
  end;
end;

// Back-door initialization of TC Tracker. This function uses the default settings
// to initialize Tracker (i.e. Current UserName/Password/Connection) and is designed
// for use where a connection has already been established by, for example, Version
// Manager
// If no connection has been defined, or the user needs to login, then the function
// will display the relevant dialogs.
function TrkInit( Parent: HWnd ): Boolean;
begin
  if not Assigned( PTCTrkInit ) then
    LoadIt;
  if not Assigned( PTCTrkInit ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkInit' );
  Result := PTCTrkInit( Parent );
end;

function TrkGetCoreInfo( Key, FieldName: String ): String;
var
  Res, Size, NewSize: Integer;
  pValue: PChar;
begin
  Result := '';
  if not Assigned( PTCTrkGetCoreInfo ) then
    LoadIt;
  if not Assigned( PTCTrkGetCoreInfo ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkGetCoreInfo' );
  Size := 1024;
  NewSize := Size;
  GetMem( pValue, Size );
  try
    Res := PTCTrkGetCoreInfo( PChar( Key ), PChar( FieldName ), pValue, NewSize );
    if Res = Err_InvalidRecordSize then
    begin
      // Increase the data size...
      FreeMem( pValue, Size );
      Size := NewSize;
      GetMem( pValue, Size );
      PTCTrkGetCoreInfo( PChar( Key ), PChar( FieldName ), pValue, NewSize );
    end;
    SetLength( Result, StrLen( pValue ) );
    Result := String( pValue );
  finally
    FreeMem( pValue, Size );
  end;
end;

function TrkAllUserID: Cardinal;
begin
  if not Assigned( PTCTrkAllUserID ) then
    LoadIt;
  if not Assigned( PTCTrkAllUserID ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkAllUserID' );
  Result := PTCTrkAllUserID;
end;

function TrkIsAdminUser: Boolean;
begin
  if not Assigned( PTCTrkIsAdminUser ) then
    LoadIt;
  if not Assigned( PTCTrkIsAdminUser ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkIsAdminUser' );
  Result := PTCTrkIsAdminUser;
end;

function TrkHasAccessRights( Items: TCardinalArray ): Boolean;
begin
  if not Assigned( PTCTrkHasAccessRights ) then
    LoadIt;
  if not Assigned( PTCTrkHasAccessRights ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkHasAccessRights' );
  Result := PTCTrkHasAccessRights( @Items );
end;

function TrkGroupsAndUsersFromIDs( Items: TCardinalArray ): String;
var
  pNames: PChar;
begin
  if not Assigned( PTCTrkGroupsAndUsersFromIDs ) then
    LoadIt;
  if not Assigned( PTCTrkGroupsAndUsersFromIDs ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkGroupsAndUsersFromIDs' );
  GetMem( pNames, 16384 );
  try
    StrCopy( pNames, '' );
    PTCTrkGroupsAndUsersFromIDs( @Items, pNames );    
    SetLength( Result, StrLen( pNames ) );
    Result := String( pNames );
  finally
    FreeMem( pNames, 16384 );
  end;
end;

function TrkSelectUsers( var Items: TCardinalArray; var Names: String ): Boolean;
var
  i: Integer;
  pItems, pNames: PChar;
  List: TStrings;
  ID: Cardinal;
begin
  if not Assigned( PTCTrkSelectUsers ) then
    LoadIt;
  if not Assigned( PTCTrkSelectUsers ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkSelectUsers' );
  GetMem( pItems, 16384 );
  try
    GetMem( pNames, 16384 );
    try
      StrCopy( pItems, '' );
      for i := Low( Items ) to High( Items ) do
        if StrLen( pItems ) = 0 then
          StrCopy( pItems, PChar( IntToStr( Items[ i ] ) ) )
        else
          StrCat( pItems, PChar( ',' + IntToStr( Items[ i ] ) ) );
      StrCopy( pNames, '' );
      Result := PTCTrkSelectUsers( pItems, pNames );
      if Result then
      begin
        SetLength( Items, 0 );
        List := TStringList.Create;
        try
          List.Text := StringReplace( String( pItems ), ',', #13, [ rfReplaceAll ] );
          for i := 0 to List.Count - 1 do
          try
            ID := StrToInt( List[ i ] );
            SetLength( Items, Length( Items ) + 1 );
            Items[ High( Items ) ] := ID;
          except
          end;
        finally
          List.Free;
        end;
        SetLength( Names, StrLen( pNames ) );
        Names := String( pNames );
      end;
    finally
      FreeMem( pNames, 16384 );
    end;
  finally
    FreeMem( pItems, 16384 );
  end;
end;

function TrkSetCoreInfo( Key, FieldName, FieldValue: String ): Integer;
begin
  if not Assigned( PTCTrkSetCoreInfo ) then
    LoadIt;
  if not Assigned( PTCTrkSetCoreInfo ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkSetCoreInfo' );
  Result := PTCTrkSetCoreInfo( PChar( Key ), PChar( FieldName ), PChar( FieldValue ) );
end;

procedure TrkUpdatePanelHtml( Key, Html: String );
begin
  if not Assigned( PTCTrkUpdatePanelHtml ) then
    LoadIt;
  if not Assigned( PTCTrkUpdatePanelHtml ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkUpdatePanelHtml' );
  PTCTrkUpdatePanelHtml( PChar( Key ), PChar( Html ) );
end;

function TrkCanModifyIssue( IssueID: Cardinal ): Boolean;
begin
  if not Assigned( PTCTrkCanModifyIssue ) then
    LoadIt;
  if not Assigned( PTCTrkCanModifyIssue ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkCanModifyIssue' );
  Result := PTCTrkCanModifyIssue( IssueID );
end;

procedure TrkSelectIssue( IssueID: Cardinal );
begin
  if not Assigned( PTCTrkSelectIssue ) then
    LoadIt;
  if not Assigned( PTCTrkSelectIssue ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkSelectIssue' );
  PTCTrkSelectIssue( IssueID );
end;

procedure TrkSelectPage( PageCaption: String );
begin
  if not Assigned( PTCTrkSelectPage ) then
    LoadIt;
  if not Assigned( PTCTrkSelectPage ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCTrkSelectPage' );
  PTCTrkSelectPage( PChar( PageCaption ) );
end;

function TrkConnectSv( Name, Password: String; ExpiresAfter: Integer; var Handle: Cardinal ): Integer;
begin
  if not Assigned( PTCDSTrkConnect ) then
    LoadIt;
  if not Assigned( PTCDSTrkConnect ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDSTrkConnect' );
  Result := PTCDSTrkConnect( PChar( Name ), PChar( Password ), ExpiresAfter, Handle );
end;

function TrkConnect( Connection, Name, Password: String ): Integer;
begin
  if not Assigned( PTCDTrkConnect ) then
    LoadIt;
  if not Assigned( PTCDTrkConnect ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkConnect' );
  Result := PTCDTrkConnect( PChar( Connection ), PChar( Name ), PChar( Password ) );
end;

procedure TrkCurrentConnection( var Connection, Username: String; var Connected: Boolean );
var
  pConnection, pUserName: PChar;
begin
  if not Assigned( PTCDTrkCurrentConnection ) then
    LoadIt;
  if not Assigned( PTCDTrkCurrentConnection ) then
    raise ETrkFunctionNotExported.Create( 'Function Not Exported: TCDTrkCurrentConnection' );
  GetMem( pConnection, 1024 );
  try
    GetMem( pUserName, 512 );
    try
      PTCDTrkCurrentConnection( pConnection, pUserName, Connected );
      SetLength( Connection, StrLen( pConnection ) );
      Connection := String( pConnection );
      SetLength( UserName, StrLen( pUserName ) );
      UserName := String( pUserName );
    finally
      FreeMem( pUserName, 512 );
    end;
  finally
    FreeMem( pConnection, 1024 );
  end;
end;

function ClientDLL: String;
begin
  if RealPath = '' then
    RealPath := InstallDir;
  Result := AddBackslash( RealPath ) + TrkCoreInterfaceFile;
end;

procedure LoadIt;
var
  APath: String;
begin
  if LibHandle > 0 then Exit;
  if RealPath = '' then
    RealPath := InstallDir;
  APath := AddBackslash( RealPath ) + TrkCoreInterfaceFile;
  if FileExists( APath ) then
  begin
    LibHandle := LoadLibrary( PChar( APath ) );
    if LibHandle > 0 then
    begin
      {$IFDEF DEBUGAPI}
      CodeSite.EnterMethod( 'Loading Tracker API' );
      {$ENDIF}
      PTCTrkInit := GetProcAddress( LibHandle, 'TCTrkInit' );
      PTCTrkSelectIssue := GetProcAddress( LibHandle, 'TCTrkSelectIssue' );
      PTCTrkCanModifyIssue := GetProcAddress( LibHandle, 'TCTrkCanModifyIssue' );
      PTCTrkSelectPage := GetProcAddress( LibHandle, 'TCTrkSelectPage' );
      PTCTrkGetCoreInfo := GetProcAddress( LibHandle, 'TCTrkGetCoreInfo' );
      PTCTrkSetCoreInfo := GetProcAddress( LibHandle, 'TCTrkSetCoreInfo' );
      PTCTrkSelectUsers := GetProcAddress( LibHandle, 'TCTrkSelectUsers' );
      PTCTrkGroupsAndUsersFromIDs := GetProcAddress( LibHandle, 'TCTrkGroupsAndUsersFromIDs' );
      PTCTrkHasAccessRights := GetProcAddress( LibHandle, 'TCTrkHasAccessRights' );
      PTCTrkIsAdminUser := GetProcAddress( LibHandle, 'TCTrkIsAdminUser' );
      PTCTrkAllUserID := GetProcAddress( LibHandle, 'TCTrkAllUserID' );
      PTCTrkUpdatePanelHtml := GetProcAddress( LibHandle, 'TCTrkUpdatePanelHtml' );
      PTCDTrkConnect := GetProcAddress( LibHandle, 'TCDTrkConnect' );
      PTCDTrkCurrentConnection := GetProcAddress( LibHandle, 'TCDTrkCurrentConnection' );
      PTCDTrkEnumConnections := GetProcAddress( LibHandle, 'TCDTrkEnumConnections' );
      PTCDTrkEnumProjects := GetProcAddress( LibHandle, 'TCDTrkEnumProjects' );
      PTCDTrkEnumFolders := GetProcAddress( LibHandle, 'TCDTrkEnumFolders' );
      PTCDTrkEnumQueries := GetProcAddress( LibHandle, 'TCDTrkEnumQueries' );
      PTCDTrkEnumIssues := GetProcAddress( LibHandle, 'TCDTrkEnumIssues' );
      PTCDTrkEnumFields := GetProcAddress( LibHandle, 'TCDTrkEnumFields' );
      PTCDTrkEnumHistory := GetProcAddress( LibHandle, 'TCDTrkEnumHistory' );
      PTCDTrkEnumObjects := GetProcAddress( LibHandle, 'TCDTrkEnumObjects' );
      PTCDTrkEnumImages := GetProcAddress( LibHandle, 'TCDTrkEnumImages' );
      PTCDTrkEnumTemplates := GetProcAddress( LibHandle, 'TCDTrkEnumTemplates' );
      PTCDTrkEnumUsers := GetProcAddress( LibHandle, 'TCDTrkEnumUsers' );
      PTCDTrkGetIssueField := GetProcAddress( LibHandle, 'TCDTrkGetIssueField' );
      PTCDTrkSetIssueField := GetProcAddress( LibHandle, 'TCDTrkSetIssueField' );
      PTCDTrkSetIssueFields := GetProcAddress( LibHandle, 'TCDTrkSetIssueFields' );
      PTCDTrkGetFieldOptions := GetProcAddress( LibHandle, 'TCDTrkGetFieldOptions' );
      PTCDTrkCreateIssue := GetProcAddress( LibHandle, 'TCDTrkCreateIssue' );
      PTCDTrkDeleteIssue := GetProcAddress( LibHandle, 'TCDTrkDeleteIssue' );
      PTCDTrkCreateProject := GetProcAddress( LibHandle, 'TCDTrkCreateProject' );
      PTCDTrkRenameProject := GetProcAddress( LibHandle, 'TCDTrkRenameProject' );
      PTCDTrkDeleteProject := GetProcAddress( LibHandle, 'TCDTrkDeleteProject' );
      PTCDTrkCreateFolder := GetProcAddress( LibHandle, 'TCDTrkCreateFolder' );
      PTCDTrkRenameFolder := GetProcAddress( LibHandle, 'TCDTrkRenameFolder' );
      PTCDTrkDeleteFolder := GetProcAddress( LibHandle, 'TCDTrkDeleteFolder' );
      PTCDTrkUserByID := GetProcAddress( LibHandle, 'TCDTrkUserByID' );
      PTCDTrkUserByName := GetProcAddress( LibHandle, 'TCDTrkUserByName' );
      PTCDTrkIssueAsXML := GetProcAddress( LibHandle, 'TCDTrkIssueAsXML' );
      PTCDTrkImportFromXML := GetProcAddress( LibHandle, 'TCDTrkImportFromXML' );
      PTCDTrkIssueAsHTML := GetProcAddress( LibHandle, 'TCDTrkIssueAsHTML' );
      PTCDTrkExecuteReport := GetProcAddress( LibHandle, 'TCDTrkExecuteReport' );
      PTCDTrkExportToXML := GetProcAddress( LibHandle, 'TCDTrkExportToXML' );
      PTCDTrkUploadFileBegin := GetProcAddress( LibHandle, 'TCDTrkUploadFileBegin' );
      PTCDTrkUploadFileData := GetProcAddress( LibHandle, 'TCDTrkUploadFileData' );
      PTCDTrkUploadFileEnd := GetProcAddress( LibHandle, 'TCDTrkUploadFileEnd' );
      PTCDTrkUploadImageBegin := GetProcAddress( LibHandle, 'TCDTrkUploadImageBegin' );
      PTCDTrkUploadImageData := GetProcAddress( LibHandle, 'TCDTrkUploadImageData' );
      PTCDTrkUploadImageEnd := GetProcAddress( LibHandle, 'TCDTrkUploadImageEnd' );
      PTCDTrkDownloadFileBegin := GetProcAddress( LibHandle, 'TCDTrkDownloadFileBegin' );
      PTCDTrkDownloadFileData := GetProcAddress( LibHandle, 'TCDTrkDownloadFileData' );
      PTCDTrkDownloadFileEnd := GetProcAddress( LibHandle, 'TCDTrkDownloadFileEnd' );
      PTCDTrkDownloadImageBegin := GetProcAddress( LibHandle, 'TCDTrkDownloadImageBegin' );
      PTCDTrkDownloadImageData := GetProcAddress( LibHandle, 'TCDTrkDownloadImageData' );
      PTCDTrkDownloadImageEnd := GetProcAddress( LibHandle, 'TCDTrkDownloadImageEnd' );
      PTCDTrkDeleteObject := GetProcAddress( LibHandle, 'TCDTrkDeleteObject' );
      PTCDTrkDeleteFile := GetProcAddress( LibHandle, 'TCDTrkDeleteFile' );
      PTCDTrkRefreshCache := GetProcAddress( LibHandle, 'TCDTrkRefreshCache' );
      PTCDTrkGetErrorString := GetProcAddress( LibHandle, 'TCDTrkGetErrorString' );
      PTCDTrkDisconnect := GetProcAddress( LibHandle, 'TCDTrkDisconnect' );
      // Server-side
      PTCDSTrkConnect := GetProcAddress( LibHandle, 'TCDSTrkConnect' );
      PTCDSTrkRefreshCache := GetProcAddress( LibHandle, 'TCDSTrkRefreshCache' );
      PTCDSTrkGetIssueField := GetProcAddress( LibHandle, 'TCDSTrkGetIssueField' );
      PTCDSTrkSetIssueField := GetProcAddress( LibHandle, 'TCDSTrkSetIssueField' );
      PTCDSTrkSetIssueFields := GetProcAddress( LibHandle, 'TCDSTrkSetIssueFields' );
      PTCDSTrkGetFieldOptions := GetProcAddress( LibHandle, 'TCDSTrkGetFieldOptions' );
      PTCDSTrkCreateIssue := GetProcAddress( LibHandle, 'TCDSTrkCreateIssue' );
      PTCDSTrkDeleteIssue := GetProcAddress( LibHandle, 'TCDSTrkDeleteIssue' );
      PTCDSTrkCreateProject := GetProcAddress( LibHandle, 'TCDSTrkCreateProject' );
      PTCDSTrkRenameProject := GetProcAddress( LibHandle, 'TCDSTrkRenameProject' );
      PTCDSTrkDeleteProject := GetProcAddress( LibHandle, 'TCDSTrkDeleteProject' );
      PTCDSTrkEnumProjects := GetProcAddress( LibHandle, 'TCDSTrkEnumProjects' );
      PTCDSTrkEnumQueries := GetProcAddress( LibHandle, 'TCDSTrkEnumQueries' );
      PTCDSTrkEnumIssues := GetProcAddress( LibHandle, 'TCDSTrkEnumIssues' );
      PTCDSTrkEnumFields := GetProcAddress( LibHandle, 'TCDSTrkEnumFields' );
      PTCDSTrkEnumHistory := GetProcAddress( LibHandle, 'TCDSTrkEnumHistory' );
      PTCDSTrkEnumObjects := GetProcAddress( LibHandle, 'TCDSTrkEnumObjects' );
      PTCDSTrkEnumImages := GetProcAddress( LibHandle, 'TCDSTrkEnumImages' );
      PTCDSTrkEnumTemplates := GetProcAddress( LibHandle, 'TCDSTrkEnumTemplates' );
      PTCDSTrkEnumUsers := GetProcAddress( LibHandle, 'TCDSTrkEnumUsers' );
      PTCDSTrkExecuteReport := GetProcAddress( LibHandle, 'TCDSTrkExecuteReport' );
      PTCDSTrkExportToXML := GetProcAddress( LibHandle, 'TCDSTrkExportToXML' );
      PTCDSTrkUploadFileBegin := GetProcAddress( LibHandle, 'TCDSTrkUploadFileBegin' );
      PTCDSTrkUploadFileData := GetProcAddress( LibHandle, 'TCDSTrkUploadFileData' );
      PTCDSTrkUploadFileEnd := GetProcAddress( LibHandle, 'TCDSTrkUploadFileEnd' );
      PTCDSTrkUploadImageBegin := GetProcAddress( LibHandle, 'TCDSTrkUploadImageBegin' );
      PTCDSTrkUploadImageData := GetProcAddress( LibHandle, 'TCDSTrkUploadImageData' );
      PTCDSTrkUploadImageEnd := GetProcAddress( LibHandle, 'TCDSTrkUploadImageEnd' );
      PTCDSTrkDownloadFileBegin := GetProcAddress( LibHandle, 'TCDSTrkDownloadFileBegin' );
      PTCDSTrkDownloadFileData := GetProcAddress( LibHandle, 'TCDSTrkDownloadFileData' );
      PTCDSTrkDownloadFileEnd := GetProcAddress( LibHandle, 'TCDSTrkDownloadFileEnd' );
      PTCDSTrkDownloadImageBegin := GetProcAddress( LibHandle, 'TCDSTrkDownloadImageBegin' );
      PTCDSTrkDownloadImageData := GetProcAddress( LibHandle, 'TCDSTrkDownloadImageData' );
      PTCDSTrkDownloadImageEnd := GetProcAddress( LibHandle, 'TCDSTrkDownloadImageEnd' );
      PTCDSTrkDeleteObject := GetProcAddress( LibHandle, 'TCDSTrkDeleteObject' );
      PTCDSTrkDeleteFile := GetProcAddress( LibHandle, 'TCDSTrkDeleteFile' );
      PTCDSTrkGetErrorString := GetProcAddress( LibHandle, 'TCDSTrkGetErrorString' );
      PTCDSTrkDisconnect := GetProcAddress( LibHandle, 'TCDSTrkDisconnect' );
    end
    else
      raise Exception.Create( Format( 'Error Loading Tracker Interface: %s', [ APath ] ) );
  end
  else
    raise ETrkCannotLocateClient.Create( Format( 'Could not locate Tracker Client: %s', [ APath ] ) );
end;

procedure TrkReleaseAPI;
begin
  if Assigned( PTCTrkInit ) then
  begin
    {$IFDEF DEBUGAPI}
    CodeSite.ExitMethod( 'Releasing Tracker API' );
    {$ENDIF}
    PTCTrkInit := nil;
    PTCTrkSelectIssue := nil;
    PTCTrkCanModifyIssue := nil;
    PTCTrkSelectPage := nil;
    PTCTrkGetCoreInfo := nil;
    PTCTrkSetCoreInfo := nil;
    PTCTrkSelectUsers := nil;
    PTCTrkGroupsAndUsersFromIDs := nil;
    PTCTrkHasAccessRights := nil;
    PTCTrkIsAdminUser := nil;
    PTCTrkAllUserID := nil;
    PTCTrkUpdatePanelHtml := nil;
    PTCDTrkConnect := nil;
    PTCDTrkCurrentConnection := nil;
    PTCDTrkEnumConnections := nil;
    PTCDTrkEnumProjects := nil;
    PTCDTrkEnumFolders := nil;
    PTCDTrkEnumQueries := nil;
    PTCDTrkEnumIssues := nil;
    PTCDTrkEnumFields := nil;
    PTCDTrkEnumHistory := nil;
    PTCDTrkEnumObjects := nil;
    PTCDTrkEnumImages := nil;
    PTCDTrkEnumTemplates := nil;
    PTCDTrkEnumUsers := nil;
    PTCDTrkGetIssueField := nil;
    PTCDTrkSetIssueField := nil;
    PTCDTrkSetIssueFields := nil;
    PTCDTrkGetFieldOptions := nil;
    PTCDTrkCreateIssue := nil;
    PTCDTrkDeleteIssue := nil;
    PTCDTrkCreateProject := nil;
    PTCDTrkRenameProject := nil;
    PTCDTrkDeleteProject := nil;
    PTCDTrkCreateFolder := nil;
    PTCDTrkRenameFolder := nil;
    PTCDTrkDeleteFolder := nil;
    PTCDTrkUserByID := nil;
    PTCDTrkUserByName := nil;
    PTCDTrkIssueAsXML := nil;
    PTCDTrkImportFromXML := nil;
    PTCDTrkIssueAsHTML := nil;
    PTCDTrkExecuteReport := nil;
    PTCDTrkExportToXML := nil;
    PTCDTrkUploadFileBegin := nil;
    PTCDTrkUploadFileData := nil;
    PTCDTrkUploadFileEnd := nil;
    PTCDTrkDownloadFileBegin := nil;
    PTCDTrkDownloadFileData := nil;
    PTCDTrkDownloadFileEnd := nil;
    PTCDTrkDownloadImageBegin := nil;
    PTCDTrkDownloadImageData := nil;
    PTCDTrkDownloadImageEnd := nil;
    PTCDTrkDeleteObject := nil;
    PTCDTrkDeleteFile := nil;
    PTCDTrkRefreshCache := nil;
    PTCDTrkGetErrorString := nil;
    PTCDTrkDisconnect := nil;
    // Server-side
    PTCDSTrkConnect := nil;
    PTCDSTrkRefreshCache := nil;
    PTCDSTrkGetIssueField := nil;
    PTCDSTrkSetIssueField := nil;
    PTCDSTrkSetIssueFields := nil;
    PTCDSTrkGetFieldOptions := nil;
    PTCDSTrkCreateIssue := nil;
    PTCDSTrkDeleteIssue := nil;
    PTCDSTrkCreateProject := nil;
    PTCDSTrkRenameProject := nil;
    PTCDSTrkDeleteProject := nil;
    PTCDSTrkEnumProjects := nil;
    PTCDSTrkEnumQueries := nil;
    PTCDSTrkEnumIssues := nil;
    PTCDSTrkEnumFields := nil;
    PTCDSTrkEnumHistory := nil;
    PTCDSTrkEnumObjects := nil;
    PTCDSTrkEnumImages := nil;
    PTCDSTrkEnumTemplates := nil;
    PTCDSTrkEnumUsers := nil;
    PTCDSTrkExecuteReport := nil;
    PTCDSTrkExportToXML := nil;
    PTCDSTrkUploadFileBegin := nil;
    PTCDSTrkUploadFileData := nil;
    PTCDSTrkUploadFileEnd := nil;
    PTCDSTrkDownloadFileBegin := nil;
    PTCDSTrkDownloadFileData := nil;
    PTCDSTrkDownloadFileEnd := nil;
    PTCDSTrkDownloadImageBegin := nil;
    PTCDSTrkDownloadImageData := nil;
    PTCDSTrkDownloadImageEnd := nil;
    PTCDSTrkDeleteObject := nil;
    PTCDSTrkDeleteFile := nil;
    PTCDSTrkGetErrorString := nil;
    PTCDSTrkDisconnect := nil;
    if LibHandle > 0 then
      FreeLibrary( LibHandle );
    LibHandle := 0;
  end;
end;

function IntEnumConnections( Context, Data: Pointer; pName, pDescription, pHost: PChar; Port: Integer; Current: Boolean ): Boolean;
var
  AProc: TEnumConnections;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), String( pDescription ), String( pHost ), Port, Current );
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

function IntEnumFolders( Context, Data: Pointer; pName: PChar; ID: Cardinal; Intray: Boolean ): Boolean;
var
  AProc: TEnumFolders;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), ID, Intray );
end;

function IntEnumQueries( Context, Data: Pointer; pName: PChar; ID: Cardinal; pDescription, pStatement: PChar; Temporary: Boolean; Shared: Boolean ): Boolean;
var
  AProc: TEnumQueries;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), ID, String( pDescription ), String( pStatement ), Temporary, Shared );
end;

function IntEnumIssues( Context, Data: Pointer; pName: PChar; ID: Cardinal; IssueData: PTrkBaseIssue ): Boolean;
var
  AProc: TEnumIssues;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pName ), ID, IssueData );
end;

function IntEnumFields( Context, Data: Pointer; pFieldName, pFieldValue: PChar; FieldType: Word; UserDefined: Boolean ): Boolean;
var
  AProc: TEnumFields;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pFieldName ), String( pFieldValue ), FieldType, UserDefined );
end;

function IntEnumHistory( Context, Data: Pointer; pAuthor, pFieldName, pOld, pNew: PChar; iTimestamp: Integer ): Boolean;
var
  AProc: TEnumHistory;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, String( pAuthor ), String( pFieldName ), String( pOld ), String( pNew ), FileDateToDateTime( iTimestamp ) );
end;

function IntEnumObjects( Context, Data: Pointer; TypeID, ObjectID: Cardinal; FileID: Integer; iTimestamp: Integer; pName, pObjTypeStr, pObjectPath, pDescription, pStatus: PChar ): Boolean;
var
  AProc: TEnumObjects;
  dt: TDateTime;
begin
  Result := True;
  AProc := Context;
  if iTimestamp > 0 then
    dt := FileDateToDateTime( iTimestamp )
  else
    dt := 0;
  if Assigned( AProc ) then
    Result := AProc( Data, TypeID, ObjectID, FileID, dt, String( pName ), String( pObjTypeStr ), String( pObjectPath ), String( pDescription ), String( pStatus ) );
end;

function IntEnumImages( Context, Data: Pointer; ID: Integer; pName, pDescription: PChar ): Boolean;
var
  AProc: TEnumImages;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, ID, String( pName ), String( pDescription ) );
end;

function IntEnumTemplates( Context, Data: Pointer; ID: Cardinal; pName, pDescription: PChar; Scope: Word; Default: Boolean ): Boolean;
var
  AProc: TEnumTemplates;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, ID, String( pName ), String( pDescription ), Scope, Default );
end;

function IntEnumUsers( Context, Data: Pointer; ID: Cardinal; pName, pFullName, pEMail, pLocation: PChar ): Boolean;
var
  AProc: TEnumUsers;
begin
  Result := True;
  AProc := Context;
  if Assigned( AProc ) then
    Result := AProc( Data, ID, String( pName ), String( pFullName ), String( pEMail ), String( pLocation ) );
end;

end.
