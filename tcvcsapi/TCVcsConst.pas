{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2001 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  26504: TCVcsConst.pas }
{
    Rev 1.15    28/04/2005 23:14:16  Ewan
  Checkin for Linux update
}
{
    Rev 1.15    28/04/2005 23:14:16  Ewan
  Checkin for Linux update
}
{
    Rev 1.14    18/11/2004 17:15:42  Ewan
  Latest Release
}
{
    Rev 1.14    18/11/2004 17:15:42  Ewan
  Latest Release
}
{
    Rev 1.14    18/11/2004 17:15:42  Ewan
  Latest Release
}
{
    Rev 1.14    18/11/2004 17:15:42  Ewan    Version: 7.1.2.98
  Root for new maintenance branch
}
{
    Rev 1.13    18/07/2004 18:21:46  Ewan    Version: 7.1.2.90
  Latest Release
}
{
    Rev 1.12    20/10/2003 23:34:04  Ewan    Version: 7.1.2.85
  Latest Changes and Server Test
}
{
    Rev 1.12    20/10/2003 23:34:04  Ewan
  Pre-Build
}
{
    Rev 1.11    13/10/2003 10:25:52  Ewan
  Backup Checkin
}
{
    Rev 1.10    22/08/2003 00:12:42  Ewan
  Just in case things go haywire
}
{
    Rev 1.9    17/03/2003 02:20:04  Ewan    Version: 7.1.1.40
  Fixed Installer
  Fixed Modelmaker
  Fixed Datamodule bug in IDE
}
{
    Rev 1.8    01/02/2003 14:50:24  Ewan
  Testing
}
{
    Rev 1.7    27/11/2002 01:19:46  Ewan    Version: 7.1.1.20
  Latest release. Final one before Linux port
}
{
{   Rev 1.6    02/10/2002 00:47:08  Ewan    Version: 7.1 Beta 3
{ Beta release 3
}
{
{   Rev 1.5    18/09/2002 22:59:28  Ewan    Version: 7.1 Beta 3
{ Prior to redeveloping Builder
}
{
{   Rev 1.4    24/08/2002 01:54:44  Ewan    Version: 7.1 Beta 2
{ Beta 2
}
{
{   Rev 1.3    03/05/2002 15:34:50  Ewan    Version: 7.0.2.14
}
{
{   Rev 1.3    03/05/2002 15:34:50  Ewan
{ New Release. Checkin before holiday
}
{
{   Rev 1.2    22/02/2002 00:54:24  Ewan    Version: 7.0.2.2
{ Latest...
}
{
{   Rev 1.1    11/02/2002 00:33:04  Ewan
{ Release 7.0.2.0
}
{
{   Rev 1.0    06/02/2002 11:05:42  Ewan
{ Initial Revision
}
unit TCVcsConst;

interface

const
  // TCBrowseFolder types
  btFolders = 0;
  btFiles = 1;

const
  // Label Types
  lt_VersionLabel = 1;
  lt_PromotionLabel = 2;

  // View types
  vt_VersionLabel = 1;
  vt_PromotionLabel = 2;
  vt_Date = 4;

const
  // Object types for TCGetObjectInfo / TCEnumObjects
  ot_Unknown = 0;
  ot_CoreObject = 1;
  ot_Project = 2;
  ot_Folder = 3;
  ot_File = 4;
  ot_Revision = 5;

const
  // Action ID's for multiple files
  act_Checkin       = 1;
  act_Checkout      = 2;
  act_Get           = 3;
  act_Promote       = 4;
  act_Lock          = 5;
  act_Unlock        = 6;
  act_Freeze        = 7;
  act_Thaw          = 8;
  act_AssignVersion = 9;
  act_RemoveVersion = 10;
  act_Rename        = 11;

const
  // History report columns
  hrNone = 0;
  hrRevisionName = 1;
  hrComments = 2;
  hrTimestamp = 4;
  hrAuthor = 8;
  hrLockedBy = 16;
  hrVersionLabels = 32;
  hrPromotionLevels = 64;

const
  // File Status
  VCS_STATUS_INVALID        = -1;     // Status could not be obtained, don't rely on it
  VCS_STATUS_NOTCONTROLLED  = $0000;  // File is not under source control
  VCS_STATUS_CONTROLLED     = $0001;  // File is under source code control
  VCS_STATUS_CHECKEDOUT     = $0002;  // Checked out to current user at local path
  VCS_STATUS_OUTOTHER       = $0004;  // File is checked out to another user
  VCS_STATUS_OUTMULTIPLE    = $0010;  // File is checked out to multiple people
  VCS_STATUS_OUTOFDATE      = $0020;  // The file is not the most recent
  VCS_STATUS_DELETED        = $0040;  // File has been deleted from the project
  VCS_STATUS_FROZEN         = $0080;  // No more revisions allowed
  VCS_STATUS_SHARED         = $0200;  // File is shared between projects
  VCS_STATUS_MODIFIED       = $0800;  // Local file has been modified
	VCS_STATUS_OUTBYUSER		  = $1000;  // File is checked out by current user someplace

const
  Err_UnknownError = -1;
  Err_OK = 0;
  Err_VersionAlreadyAssigned = 2;
  Err_FileNotLockedBy = 3;
  Err_FileNotChanged = 4;
  Err_ErrorCreatingRevision = 5;
  Err_CannotFindRevision = 6;
  Err_ObjectHasLock = 10;
  Err_InsufficientAccess = 14;
  Err_UserAlreadyContained = 23;
  Err_GroupAlreadyContained = 24;
  Err_CannotDeleteSpecialGroup = 25;
  Err_CannotDeleteSuperUser = 26;
  Err_GroupContainsGroup = 27;       // Recursion
  Err_RecordModifiedByOther = 28;
  Err_InvalidPassword = 29;
  Err_InvalidIndex = 30;
  Err_LockAlreadyExists = 31;
  Err_CannotFindLock = 32;
  Err_FileNotLocked = 33;
  Err_RevisionNotLocked = 34;
  Err_RevisionNotLockedBy = 35;
  Err_CannotLocateLabel = 38;
  Err_InvalidName = 39;
  Err_ObjectNotFound = 40;
  Err_FileLockedByUser = 41;
  Err_FileLocked = 42;
  Err_ErrorCreatingFile = 43;
  Err_PathNotSpecified = 44;
  Err_NotCheckedOutTo = 45;
  Err_FileIsWritable = 46;
  Err_VersionNotFound = 47;
  Err_NotLoggedIn = 48;
  Err_ConnectionNotDefined = 49;
  Err_LocalFileNotFound = 50;
  Err_CannotFindVersion = 51;
  Err_GroupNotFound = 52;
  Err_CouldNotCreateGroup = 53;
  Err_ObjectNameAlreadyInUse = 54;
  Err_CannotFindView = 55;
  Err_FileHasBeenRemoved = 56;
  Err_RenameNotSupported = 57;
  Err_RevisionBranched = 58;
  Err_Offline = 59;
  Err_FileNotShared = 60;
  Err_ServerError = 61;
  Err_FilesTheSame = 62;
  Err_CannotRenameSharedFile = 63;
  Err_FileGroupsNotSupported = 64;
  Err_CannotCheckOutInPromotionView = 65;
  Err_CannotCheckInInPromotionView = 66;
  Err_CannotDeleteUserWithLocks = 67;
  Err_HasOfflineLock = 68;
  Err_CannotDelRevisionWithBranch = 69;
  Err_RevisionIsLocked = 70;
  Err_ServerInsufficientSpace = 71;
  Err_ClientInsufficientSpace = 72;
  Err_NoRevisions = 73;
  Err_PersonalLicense = 74;
  Err_NoLicenses = 75;
  Err_ServerBusy = 76;
  Err_FileFrozen = 77;
  Err_InvalidConnection = 78;
  Err_AlreadyConnected = 79;
  Err_NotConnected = 80;
  Err_CouldNotConnectToServer = 81;
  Err_VersionDoesNotExist = 82;
  Err_ActionNotValidInPromoView = 83;
  Err_InsufficientSpaceForData = 84;
  Err_RevisionHasNoData = 85;    // No history is maintained for this file.
  Err_CannotLockNonTip = 86;     // No history is maintained for this file.
  Err_AddinError = 87;
  Err_CannotOpenFile = 88;
  Err_ActionCancelled = 89;
  Err_UnknownCommand = 90;
  Err_ConnectionProblem = 91;
  Err_OfflineSelected = 92;
  Err_Cancelled = 94;
  Err_CannotCreateDirectory = 95;
  Err_InsufficientLabelAccess = 96;
  Err_CannotCheckOutInReadOnlyView = 97;
  Err_CannotCheckInInReadOnlyView = 98;
  Err_ActionNotValidInReadOnlyView = 99;
  Err_BaseVersionNotInBranch = 100;
  Err_BaseVersionNotSet = 101;
  Err_NotCheckedOutFromProject = 102;   // The file is a share and wasn't checked out from this project
  Err_InvalidServerVersion = 150;
  Err_UnknownUserOrLeaseExpired = 151;

const
  // Checkin settings
  ci_CheckInIfUnchanged = 1;      // -fu
  ci_LeaveLocked = 2;             // -fl
  ci_MoveVersion = 4;             // -fm
  ci_ForceBranch = 8;             // -fb
  ci_MakeWorkfileReadonly = 16;   // -fr
  ci_DeleteWorkFile = 32;         // -fd
  ci_PromptForComments = 64;      // N/A in Commandline
  ci_UseLockComments = 128;       // Lock comments override entered comments when available
  ci_CantFreeMemory = 256;        // Internal...

const
  // Checkout/Get settings
  co_LeaveWorkfileWritable = 1;
  co_IgnoreLocked = 2;
  co_MoveVersion = 4;

const
  // Client dialog addin interface
  cad_DlgView = 1001;
  cad_DlgVersion = 1002;
  cad_DlgCheckIn = 1003;
  cad_DlgCheckOut = 1004;
  cad_DlgPromotion = 1005;
  cad_DlgFolder = 1006;
  cad_DlgFile = 1007;
  cad_DlgProject = 1008;
  cad_DlgRevision = 1009;
  cad_DlgUser = 1010;

// Top level menus
const
  FixedMenus = 9999;
  mnuFile = 5000;
  mnuEdit = 5001;
  mnuHelp = 5002;
  // Existing menu items...
  mnuExisting = 9999;

const
  // Client Detail Panel addin
  cdp_Panel = 2001;

const
  {$IFDEF LINUX}
  VcsCoreInterfaceFile = 'libGPVCCore.so';
  {$ELSE}
  VcsCoreInterfaceFile = 'GPVCCore.Dll';
  {$ENDIF}
  ForwardSlash = '/';

const
  // Import/Export
  IE_HasUsers = 1;
  IE_HasArchives = 2;

implementation

end.
