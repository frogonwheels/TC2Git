{ $HDR$}
{ ******************************************************************** }
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{ ******************************************************************** }
{ $Log:  209010: TCTrkTypes.pas 
{
{   Rev 1.0    18/10/2007 10:38:30 AM  CompileSystem    Version: 1.1.000
{ 1.1.0
}
{
{   Rev 1.0    3/8/2006 6:17:20 PM  Michael
{ Internal Track  utility
}
{
    Rev 1.8    07/11/2005 16:49:28  Ewan
  Latest Changes (07/11/2005)
}
{
    Rev 1.8    07/11/2005 16:49:28  Ewan
  Latest Changes (07/11/2005)
}
{
    Rev 1.7    28/10/2005 12:44:46  Ewan    Version: Marker
  Latest Changes (28/10/2005)
}
{
    Rev 1.6    22/07/2005 03:30:10  Ewan
  Latest release (again)
}
{
    Rev 1.5    16/07/2005 14:01:00  Ewan
  Latest Release... Tracker Fixes Mainly
}
{
    Rev 1.4    11/02/2004 10:57:58  Ewan
  Latest Release
}
{
    Rev 1.4    11/02/2004 10:57:58  Ewan
  Latest Release
}
{
    Rev 1.4    11/02/2004 10:57:58  Ewan
  Checkin for Linux
}
{
    Rev 1.3    07/02/2004 15:06:44  Ewan
  Latest changes
}
{
    Rev 1.2    27/12/2003 16:34:06  Ewan    Version: 7.1.2.65
  Latest Release
}
{
    Rev 1.1    07/02/2003 00:04:48  Ewan    Version: 7.1.1.35
  Released Version
}
unit TCTrkTypes;

interface

uses Windows, SysUtils;

type
  // Issue info...
  TTrkBaseIssue = record
    IssueType: Integer;
    // Users
    ID: Cardinal;
    Owner: Cardinal;              // ID of the Owner
    AssignedTo: Cardinal;         // ID of the user the issue is currently assigned to
    CompletedBy: Cardinal;        // ID of the user that completed the issue
    VerifiedBy: Cardinal;         // ID of the user that verified completion of the issue
    // Timestamps (in UTC format)
    Created: Integer;             // Creation timestamp
    CompleteBy: Integer;          // Date/Time that the issue needs to be completed by
    Completed: Integer;           // Completion timestamp
    Verified: Integer;            // Verification timestamp
    // Pointers to string data
    Name: PChar;
    Priority: PChar;
    Status: PChar;
    Description: PChar;
    Area: PChar;
    Severity: PChar;
    Version: PChar;
    ImplementedInVersion: PChar;
    ReportedBy: PChar;
    EMail: PChar;
    ClosureCat: PChar;
    // Access settings
    CanModify: Boolean;
    CanDelete: Boolean;
    CanComplete: Boolean;
    CanVerify: Boolean;
    // Visible in UI
    VisibleInUI: Boolean;
    // Actual string data
    FData: PChar;
  end;
  PTrkBaseIssue = ^TTrkBaseIssue;

  TCardinalArray = array of Cardinal;
  PCardinalArray = ^TCardinalArray;

  // External
  TEnumConnections = function ( Data: Pointer; Name, Description, Host: String; Port: Integer; Current: Boolean ): Boolean;
  TEnumProjects = function ( Data: Pointer; Name: String; ID: Cardinal ): Boolean;
  TEnumFolders = function ( Data: Pointer; Name: String; ID: Cardinal; Intray: Boolean ): Boolean;
  TEnumQueries = function ( Data: Pointer; Name: String; ID: Cardinal; Description, Statement: String; Temporary: Boolean; Shared: Boolean ): Boolean;
  TEnumIssues = function ( Data: Pointer; Name: String; ID: Cardinal; IssueData: PTrkBaseIssue ): Boolean;
  TEnumFields = function ( Data: Pointer; FieldName, FieldValue: String; FieldType: Word; UserDefined: Boolean ): Boolean;
  TEnumTemplates = function ( Data: Pointer; ID: Cardinal; Name, Description: String; Scope: Word; Default: Boolean ): Boolean;
  TEnumUsers = function ( Data: Pointer; ID: Cardinal; Name, FullName, EMail, Location: String ): Boolean;
  TEnumHistory = function ( Data: Pointer; Author, FieldName, Old, New: String; Timestamp: TDateTime ): Boolean;
  TEnumObjects = function ( Data: Pointer; TypeID, ObjectID: Cardinal; FileID: Integer; Timestamp: TDateTime; pName, ObjTypeStr, ObjectPath, Description, Status: String ): Boolean;
  TEnumImages = function ( Data: Pointer; ID: Integer; Name, Description: String ): Boolean;
  // Addins
  TEnumRepository = function ( Context, Data: Pointer; ID: Cardinal; pName: PChar; ObjType: Integer ): Boolean; stdcall;
  // General
  TSplashProgress = procedure ( Mode, Value: Integer ); stdcall;
  TGetObjectInfo = function ( const AnID: Cardinal; const pName, pData: PChar ): Integer; stdcall;

  // Internal
  TIntEnumConnections = function ( Context, Data: Pointer; pName, pDescription, pHost: PChar; Port: Integer; Current: Boolean ): Boolean; stdcall;
  TIntEnumProjects = function ( Context, Data: Pointer; pName: PChar; ID: Cardinal ): Boolean; stdcall;
  TIntEnumFolders = function ( Context, Data: Pointer; pName: PChar; ID: Cardinal; Intray: Boolean ): Boolean; stdcall;
  TIntEnumQueries = function ( Context, Data: Pointer; pName: PChar; ID: Cardinal; pDescription, pStatement: PChar; Temporary: Boolean; Shared: Boolean ): Boolean; stdcall;
  TIntEnumIssues = function ( Context, Data: Pointer; pName: PChar; ID: Cardinal; IssueData: PTrkBaseIssue ): Boolean; stdcall;
  TIntEnumFields = function ( Context, Data: Pointer; pFieldName, pFieldValue: PChar; FieldType: Word; UserDefined: Boolean ): Boolean; stdcall;
  TIntEnumTemplates = function ( Context, Data: Pointer; ID: Cardinal; pName, pDescription: PChar; Scope: Word; Default: Boolean ): Boolean; stdcall;
  TIntEnumUsers = function ( Context, Data: Pointer; ID: Cardinal; pName, pFullName, pEMail, pLocation: PChar ): Boolean; stdcall;
  TIntEnumHistory = function ( Context, Data: Pointer; pAuthor, pFieldName, pOld, pNew: PChar; iTimestamp: Integer ): Boolean; stdcall;
  TIntEnumObjects = function ( Context, Data: Pointer; TypeID, ObjectID: Cardinal; FileID: Integer; iTimestamp: Integer; pName, pObjTypeStr, pObjectPath, pDescription, pStatus: PChar ): Boolean; stdcall;
  TIntEnumImages = function ( Context, Data: Pointer; ID: Integer; pName, pDescription: PChar ): Boolean; stdcall;

  // Toolbars and Menus
  TToolbarType = ( tbButtons, tbDropDown, tbCheckBox );

  TToolbarInfo = packed record
    Break: Boolean;
    FixedSize: Boolean;
    HorizontalOnly: Boolean;
    MinHeight: Integer;
    MinWidth: Integer;
    Text: array[ 0..255 ] of Char;
    Width: Integer;
    Style: TToolbarType;
    AnID: Cardinal;
    HelpContext: Cardinal;
    Checked: Boolean;
    ShowCaptions: Boolean;
  end;

  TTopMenuInfo = packed record
    Caption: array[ 0..255 ] of Char;
    Hint: array[ 0..255 ] of Char;
    ExistingID: Integer;
    InsertBefore: Integer;
    Count: Integer;
  end;

  TItemInfo = packed record
    AnID: Integer;
    Separator: Boolean;
    Caption: array[ 0..255 ] of Char;
    Hint: array[ 0..255 ] of Char;
    Action: array[ 0..255 ] of Char;
    ShortCut: Word;
    AnImage: HBitmap;
    Selected: Boolean;
    RadioButton: Boolean;
    InsertBefore: Integer;
    HelpContext: Cardinal;
  end;
  PItemInfo = ^TItemInfo;

type
  // Internal exceptions
  ETrkCannotLocateClient = class( Exception );
  ETrkFunctionNotExported = class( Exception );

type
  // Internal
  TNotifyToolbar = procedure ( UpdatedID: Cardinal; Style: TToolbarType; Info: Cardinal ); stdcall;
  TNotifyUserChange = procedure ( NewID: Cardinal; IsAdmin: Boolean ); stdcall;
  TUpdateStatusBar = procedure ( Index: Integer; DisplayText: PChar ); stdcall;
  THelpProc = procedure ( pFileName: PChar; Context: Cardinal ); stdcall;
  THelpKeywordProc = procedure ( pFileName: PChar; pKeyword: PChar ); stdcall;

implementation

end.
