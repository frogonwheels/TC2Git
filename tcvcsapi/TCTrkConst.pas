{ $HDR$}
{ ******************************************************************** }
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{ ******************************************************************** }
{ $Log:  209008: TCTrkConst.pas 
{
{   Rev 1.0    18/10/2007 10:38:30 AM  CompileSystem    Version: 1.1.000
{ 1.1.0
}
{
{   Rev 1.0    3/8/2006 6:17:20 PM  Michael
{ Internal Track  utility
}
{
    Rev 1.4    28/10/2005 12:44:44  Ewan
  Latest Changes (28/10/2005)
}
{
    Rev 1.4    28/10/2005 12:44:44  Ewan    Version: Marker
  Latest Changes (28/10/2005)
}
{
    Rev 1.3    16/07/2005 14:00:58  Ewan
  Latest Release... Tracker Fixes Mainly
}
{
    Rev 1.2    07/02/2004 15:06:44  Ewan
  Latest Release
}
{
    Rev 1.2    07/02/2004 15:06:44  Ewan
  Latest Release
}
{
    Rev 1.2    07/02/2004 15:06:44  Ewan
  Latest changes
}
{
    Rev 1.1    04/06/2003 15:44:56  Ewan    Version: 7.1.2.5
  June Release
}
unit TCTrkConst;

interface

const
  // Selection information for the Addin Interface...
  si_Mixed = 0;
  si_Repository = 1;
  si_Projects = 2;
  si_Folders = 3;
  si_Issues = 4;
  si_Queries = 5;

const
  // FieldTypes
  ftUDString = 0;
  ftUDInteger = 1;
  ftUDDate = 2;
  ftUDFloat = 3;

const
  // Issue type...
  it_Bug = 1;
  it_Todo = 2;
  it_Enhancement = 4;
  it_Task = 8;
  it_WorkRequest = 16;
  it_InfoRequest = 32;
  it_ChangeRequest = 64;
  it_Requirement = 128;
  it_Idea = 256;

const
  // Object types
  otFile = 0;           // Local file
  otArchive = 1;        // VM Archive
  otTracker = 2;        // Issue
  otSharedFile = 3;     // Shared File

const
  // Error messages...
  Err_OK = 0;
  Err_InsufficientAccess = 14;
  Err_InvalidName = 39;
  Err_ObjectNotFound = 40;
  Err_NotLoggedIn = 48;
  Err_ConnectionNotDefined = 49;
  Err_ObjectNameAlreadyInUse = 54;
  Err_Offline = 59;
  Err_ServerError = 61;
  Err_PersonalLicense = 74;
  Err_NoLicenses = 75;
  Err_CouldNotCreateFile = 76;
  Err_InvalidConnection = 78;
  Err_AlreadyConnected = 79;
  Err_NotConnected = 80;
  Err_CouldNotConnectToServer = 81;
  Err_TCNotInstalled = 101;
  Err_ErrorUpdatingImage = 102;
  Err_ErrorUpdatingObject = 103;
  Err_ObjectAlreadyIncluded = 104;
  Err_ErrorUpdatingIssue = 105;
  Err_InvalidRecordSize = 106;
  Err_AddinPreventedModification = 107;
  Err_AddinPreventedDeletion = 108;
  Err_InvalidFieldName = 109;
  Err_InvalidFieldValue = 110;
  Err_CannotModifyField = 111;
  Err_ErrorUpdatingFile = 112;
  Err_InvalidUsername = 113;
  Err_OwnerNotDefined = 114;
  Err_ProjectNotDefined = 115;
  Err_NoDescription = 116;

  Err_InvalidServerVersion = 150;
  Err_UnknownUserOrLeaseExpired = 151;

implementation

end.
