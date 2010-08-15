{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2001 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  26507: TCVcsTypes.pas }
{
    Rev 1.15    10/03/2008 10:18:30  Ewan
  New release - Hopefully last before major upgrade
}
{
    Rev 1.14    12/12/2005 16:26:04  Ewan
  New Version (7.2)
}
{
    Rev 1.14    12/12/2005 16:26:04  Ewan
  New Version (7.2)
}
{
    Rev 1.13    28/04/2005 23:14:20  Ewan
  Checkin for Linux update
}
{
    Rev 1.12    18/07/2004 18:21:46  Ewan
  Latest Release
}
{
    Rev 1.12    18/07/2004 18:21:46  Ewan
  Latest Release
}
{
    Rev 1.12    18/07/2004 18:21:46  Ewan
  Latest Release
}
{
    Rev 1.12    18/07/2004 18:21:46  Ewan    Version: 7.1.2.90
  Latest Release
}
{
    Rev 1.11    11/02/2004 10:58:46  Ewan    Version: 7.1.2.85
  Latest Changes and Server Test
}
{
    Rev 1.11    11/02/2004 10:58:46  Ewan
  Checkin for Linux
}
{
    Rev 1.10    27/12/2003 16:36:18  Ewan    Version: 7.1.2.65
  Latest Release
}
{
    Rev 1.9    17/09/2003 15:04:58  Ewan
  Latest Linux
}
{
    Rev 1.8    15/09/2003 22:39:32  Ewan
  Temp
}
{
    Rev 1.7    13/03/2003 23:15:52  Ewan    Version: 7.1.1.38
  Fixed threads to prevent Invalid Stream methods. New Release
}
{
    Rev 1.6    01/02/2003 14:50:24  Ewan
  Testing
}
{
    Rev 1.5    27/11/2002 01:19:46  Ewan    Version: 7.1.1.20
  Latest release. Final one before Linux port
}
{
{   Rev 1.4    24/10/2002 23:03:44  Ewan    Version: 7.1 Release
{ Final release of TC 7.1
}
{
{   Rev 1.3    02/10/2002 00:47:10  Ewan    Version: 7.1 Beta 3
{ Beta release 3
}
{
{   Rev 1.2    10/02/2002 23:33:04  Ewan    Version: 7.0.2.14
}
{
{   Rev 1.2    11/02/2002 00:33:04  Ewan
{ Release 7.0.2.0
}
{
{   Rev 1.1    08/02/2002 23:54:28  Ewan
{ This should be a very long comment and should stretch over a few lines.
{ Maximum Width should be around 76 characters and, if there are enough spaces,
{ should form a neat block.
{ 
{ I will repeat myself here, just as a test to see if I can stretch things or
{ get it to be fooled. Never know, though...
}
{
{   Rev 1.0    06/02/2002 11:05:44  Ewan
{ Initial Revision
}
unit TCVcsTypes;

interface

uses
  SysUtils,
  {$IFDEF LINUX}
  Libc;
  {$ELSE}
  Windows;
  {$ENDIF}

type
  TCardinalArray = array of Cardinal;
  PCardinalArray = ^TCardinalArray;
  // External
  TEnumConnections = function ( Data: Pointer; Name, Description, Host: String; Port: Integer; Current: Boolean ): Boolean;
  TEnumViews = function ( Data: Pointer; Name, Description: String; ID: Cardinal; Shared, Current: Boolean ): Boolean;
  TEnumProjects = function ( Data: Pointer; Name: String; ID: Cardinal ): Boolean;
  TEnumFolders = function ( Data: Pointer; Name, TCPath, LocalFolder: String; ID, ParentID: Cardinal; FolderCount, FileCount: Integer ): Boolean;
  TEnumFiles = function ( Data: Pointer; Name, LocalPath, LockedBy: String; ID, ParentID, AncestorID: Cardinal; Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; IsVirtual, Frozen: Boolean ): Boolean;
  TEnumLockedFiles = function ( Data: Pointer; Name, LockPath: String; ID, ParentID, LockedRevID: Cardinal; Modified, RevisionCount, Status: Integer ): Boolean;
  TEnumNewFiles = function ( Data: Pointer; FullPath: String; ProjectID, FolderID: Cardinal ): Boolean;
  TEnumRevisions = function ( Data: Pointer; Name, Author, Comments, LockedBy: String; ID, ParentID: Cardinal; Modified, Timestamp, CompressedSize, OriginalSize, CRC, VerCount, PromoCount: Integer ): Boolean;
  TEnumLabels = function ( Data: Pointer; LabelType: Integer; Name, Comments: String; ID: Cardinal; Timestamp: Integer ): Boolean;
  // Addins
  TEnumRepository = function ( Context, Data: Pointer; ID: Cardinal; pName: PAnsiChar; ObjType: Integer ): Boolean; stdcall;
  // General
  TSplashProgress = procedure ( Mode, Value: Integer ); stdcall;
  TImportExportProgress = function ( Stage, Value: Integer ): Boolean; stdcall;
  TGetObjectInfo = function ( const AnID: Cardinal; const pName, pData: PAnsiChar ): Integer; stdcall;
  TActionFeedback = procedure ( iStage, iResult: Integer; ObjectID: Cardinal ); stdcall;
  TMergeFeedbackProc = function ( pText: PAnsiChar; IsError: Boolean ): Boolean; stdcall;

  TCheckOutInfo = record
    Comments: PAnsiChar;
    Extra: PAnsiChar;
    Revision: PAnsiChar;
    LocalPath: PAnsiChar;
    VersionID: Cardinal;
    AssignVersionID: Cardinal;
    Overwrite: Boolean;
    Lock: Boolean;
    Flags: Integer;
  end;
  PCheckOutInfo = ^TCheckOutInfo;

  TCheckInInfo = record
    Comments: PAnsiChar;
    Extra: PAnsiChar;
    VersionID: Cardinal;
    Flags: Integer;
  end;
  PCheckInInfo = ^TCheckInInfo;

  // Internal
  TIntEnumConnections = function ( Context, Data: Pointer; pName, pDescription, pHost: PAnsiChar; Port: Integer; Current: Boolean ): Boolean; stdcall;
  TIntEnumViews = function ( Context, Data: Pointer; pName, pDescription: PAnsiChar; ID: Cardinal; Shared, Current: Boolean ): Boolean; stdcall;
  TIntEnumProjects = function ( Context, Data: Pointer; pName: PAnsiChar; ID: Cardinal ): Boolean; stdcall;
  TIntEnumFolders = function ( Context, Data: Pointer; pName, pTCPath, pLocalFolder: PAnsiChar; ID, ParentID: Cardinal; FolderCount, FileCount: Integer ): Boolean; stdcall;
  TIntEnumFiles = function ( Context, Data: Pointer; pName, pLocalPath, pLockedBy: PAnsiChar; ID, ParentID, AncestorID: Cardinal; Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer; IsVirtual, Frozen: Boolean ): Boolean; stdcall;
  TIntEnumLockedFiles = function ( Context, Data: Pointer; pName, pLockPath: PAnsiChar; ID, ParentID, LockedRevID: Cardinal; Modified, RevisionCount, Status: Integer ): Boolean; stdcall;
  TIntEnumNewFiles = function ( Context, Data: Pointer; pFullPath: PAnsiChar; ProjectID, FolderID: Cardinal ): Boolean; stdcall;
  TIntEnumRevisions = function ( Context, Data: Pointer; pName, pAuthor, pComments, pLockedBy: PAnsiChar; ID, ParentID: Cardinal; Modified, Timestamp, CompressedSize, OriginalSize, CRC, VerCount, PromoCount: Integer ): Boolean; stdcall;
  TIntEnumLabels = function ( Context, Data: Pointer; LabelType: Integer; pName, pComments: PAnsiChar; ID: Cardinal; Timestamp: Integer ): Boolean; stdcall;


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
    {$IFDEF LINUX}
    AnImage: Pointer; // QPixmapH;
    {$ELSE}
    AnImage: HBitmap;
    {$ENDIF}
    Selected: Boolean;
    RadioButton: Boolean;
    InsertBefore: Integer;
    HelpContext: Cardinal;
  end;
  PItemInfo = ^TItemInfo;

type
  // Internal exceptions
  EGpvCannotLocateClient = class( Exception );
  EGpvFunctionNotExported = class( Exception );

type
  // Internal
  TNotifyToolbar = procedure ( UpdatedID: Cardinal; Style: TToolbarType; Info: Cardinal ); stdcall;
  TNotifyUserChange = procedure ( NewID: Cardinal; IsAdmin: Boolean ); stdcall;
  TUpdateStatusBar = procedure ( Index: Integer; DisplayText: PAnsiChar ); stdcall;
  THelpProc = procedure ( pFileName: PAnsiChar; Context: Cardinal ); stdcall;
  THelpKeywordProc = procedure ( pFileName: PAnsiChar; pKeyword: PAnsiChar ); stdcall;
  TSetMainMenuProperties = procedure ( ATag: Integer; Show, Enable: Boolean ); stdcall;

  TCallbackInfo = packed record
    PProgressProc: TSplashProgress;
    PNotifyToolbar: TNotifyToolbar;
    PNotifyUserChange: TNotifyUserChange;
    PUpdateStatusBar: TUpdateStatusBar;
    PHelpProc: THelpProc;
    PHelpKeywordProc: THelpKeywordProc;
    PSetMainMenuProperties: TSetMainMenuProperties;
  end;

implementation

end.


