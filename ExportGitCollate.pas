unit ExportGitCollate;

interface

uses TCDirectIntf, Generics.Collections, classes, TrkIntf;
{$DEFINE GROUP_DEPENDS}
//{$DEFINE FEAT_UPLOAD}
type
  // A TC Folder
  TFolderInfo = class
    FolderName, TCPath: string;
    FolderID, ParentID: Cardinal;
    Required : Boolean;
    procedure AfterConstruction; override;
  end;

  // Associative ordered list of folders.
  TFolderList = TObjectDictionary<Cardinal, TFolderInfo>;

  TRevisionInfo = class;
  // List of revisions
  TRevisionList = TObjectList<TRevisionInfo>;
  PVersionList = ^TRevisionList;

  // A TC File
  TFileInfo = class
    Filename: String;
    ItemID: Cardinal;
    ParentID: Cardinal;
    Folder: TFolderInfo;
    Revisions: TRevisionList;
    Required : Boolean;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

  // List of files.
  TFilesList = TObjectList<TFileInfo>;
  PFilesList = ^TFilesList;
  TCheckinGroup = class;

  // A revision of a file.
  TRevisionInfo = class
  public
    Required: Boolean;
    FileInf: TFileInfo;
    Date: TDateTime;
    SortDate : TDateTime;
    RevisionName: String;
    RevisionID, ParentID: Cardinal;
    Author: String;
    Comments: String;
    // Dependency tracking.
    PreDepends, PostDepends: TRevisionInfo;
{$IFDEF GROUP_DEPENDS}
    AssignedGroup: TCheckinGroup;
{$ENDIF}
  end;

  // List of Project Names and IDs
  TProjectPair = TPair<String, Cardinal>;
  TProjectList = TList<TProjectPair>;

  // List of check-in groups.
  TCheckinList = TObjectList<TCheckinGroup>;

  // Group of files to be checked in as a whole.
  TCheckinGroup = class
  public
    SortDate: TDateTime;
    LabelDate : TDateTime;
    Author: String;
    Comments: String;
    Revisions: TRevisionList;

    Order: integer;
{$IFDEF GROUP_DEPENDS}
    // Dependency tracking.
    PreDepends, PostDepends: TCheckinList;
{$ENDIF}
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    Function Describe: string;

  end;

  TTCUser = class
  protected
    FUserName, FFullName, FEMail, FLocation: string;
  public
    constructor Create(AName, AFullName, AEmail, ALocation : String);
    property UserName : String read FUserName;
    property FullName : String read FFullName;
    property EMail : String read FEMail;
    property Location : string read FLocation;
  end;

  TTCUserList = class(TObjectList<TTCUser>)
  public
    procedure LoadUsers(Const Connection, Name, Password : String);
  end;

  // Runtime options
  TPromptMode = (pmNew, pmFile, pmCommit, pmCheckin, pmFinal, pmUpdateRef,
    pmGarbage, pmPush, pmMerge);
  TCollateDebugOpts = (cdoInit, cdoMaps, cdoDetail, cdoFileGet, cdoFileadd,
    cdoCommits, cdoPush, cdoMerge, cdoPruneLog);
  TPromptModes = set of TPromptMode;

  TSubmoduleType = (stMain, stSubmodule, stExtract);

  TSubmoduleInf = record
    IsSubmodule : boolean;
    Path : String;
    Repository : String;
  end;

  TTCCollator = class
  private
    FStripMacros: Boolean;
    procedure CollateCheckins;
    procedure GetAuthorsFilename(var fname: string);
    procedure DoDump(var F: Text);
    procedure LoadFiles;
  protected
    FConnection, FUsername, FPassword : String;
    FProjects: TProjectList;
    FFiles: TFilesList;
    FRevisions: TRevisionList;
    FCheckins: TCheckinList;
    FUsers : TTCUserList;
    FProjIdx: integer;
    FProjID: Cardinal;
    FRootID: Cardinal;
    FDiffSecs: integer;
    FFolders: TFolderList;
    FSignOff: TDictionary<String, String>;
    FPathMaps : TDictionary<String, String>;
    FSubmoduleMaps : TDictionary<String, TSubmoduleInf>;
    FSubmoduleCache : TObjectDictionary<String, TPair<TSubmoduleInf, String> >;
    FSubmoduleMod: TStringList;
    FRawMaps : TStrings;
    FPromptMode: TPromptModes;
    FCommand: String;
    FOutputDir: String;
    FTag: string;
    FBranch : String;
    FRepository: string;
    FDebugOpts : set of TCollateDebugOpts;
    FStartTime : TDateTime;
    FPromptMSecs : Int64;
    FGarbageCollect : boolean;
    FUseSignoff : Boolean;
    FUseTrackUsers: boolean;
    FPushAtEnd  : boolean;
    FIncludeBranches : boolean;
    FAllowOrphan : boolean;

    function rDebug(opt : TCollateDebugOpts): boolean;
    procedure wDebug(opt : TCollateDebugOpts; NewVal: boolean);
    function rProject(idx: integer): String;
    function rProjCount: integer;
    procedure wActiveProj(NewVal: integer);
    procedure wTag(NewVal: string);
    procedure wBranch(NewVal: String);

    //: Find the object by ID in TC
    function FindObjectID(root: Cardinal; Path: String): Cardinal;
    //: Load the TC Folders
    procedure LoadFolders;
    //: Assign folders to files.
    procedure AssignFolders;
    //: Map the path for the folder to the root folder.
    function GetPathToRoot(FolderID: Cardinal; mapped :boolean = true): string;
    //: Get the sign-off string for the author.
    function GetSignOff(const Author: String): String;
    //: The Tag used in Git to reference the last version extracted from TC
    function TCTag: string;
    function TCTagOld: string;

    {: Perform an (option) prompt.
      @return false to cancel
    }
    function Prompt(pm: TPromptMode): Boolean;

    {: Execute a git command.
      @param cmd Array of Parameters to git command.
      @param return Text of response from command (pass nil if not required)
      @param echo  True to echo response to stdout
      @param GitPath  The alternate path to the git repository (or #0 to leave default)
    }
    function Git(cmd: array of string; return: TStrings = nil; echo: Boolean = true; GitPath : String = #0) : integer;

    {: Get the current branch for the path.
    }
    function GitCurrentBranch( GitPath : String = #0) : String;

    {: Prune all the revision found in the GIT comments from being extracted.
    }
    procedure PruneDir( const Path : String);
    {: Prune the revisions required by loading information from git.
    }
    procedure Prune;

    {: Perform initialisation of GIT Repository.
    }
    function DoInitRepo( const Path : string; addTCDirs : boolean; var IsNew : boolean) : Boolean;
    {: Init all repositories in preparation.
    }
    function InitGit: Boolean;
    {: Return true if the required reference exists.
    }
    function HasTCRef( DirName : string = #0; oldRef : boolean = false): Boolean;

    {: Return true if the reference exists.
    }
    function GitHasRef(RefName : String; Dirname : String = #0 ) : Boolean;

    {: Check for dates out of order.
    }
    function CheckDates: Boolean;

    {: Traverse folders and files to find the TC information for the specified file.
    }
    function getFileInfoForPath(const Filename: string; addMissing : boolean = false): TFileInfo;
    {: Traverse folders to find the TC info for the specified folder
    }
    function getFolderInfo(ParentID: cardinal; const FolderName: String) : TFolderInfo;

    //: Debug output
    procedure DebugLn( opt : TCollateDebugOpts; Const LogVal : String);

    //: Extract submodule information for a path
    function IsSubmodule(const Path : String; var SubmoduleRoot, SubModulePath : String; Mark: Boolean): TSubmoduleType;
    //: Get mapped path from original path
    function MappedPath(Const Path : String) : string;

    // function CheckRevisionDependencies: Boolean;
    // function LoadRevisionDependencies: Boolean;
{$IFDEF GROUP_DEPENDS}
    function CheckGroupDependencies: Boolean;
    function LoadGroupDependencies: Boolean;
{$ENDIF}
  public
    constructor Create;
    procedure BeforeDestruction; override;
    //: Connect to repository
    procedure Connect(const Connection, Name, Password: String);

    //: Read maps from file
    procedure ReadMaps( const Filename : String);
    //: Add a single map/submodule declaration
    procedure AddMap( Const Path : String; const MapTO : string);

    //: Set the project to use
    procedure SetProject(const ProjName: String);
    //: Select the root folder from TC project
    procedure SetRootFolder(const FolderName: String);
    //: Load TC repository information
    procedure Load;
    //: Dump objects
    procedure Dump( Filename : String); overload;
    //: Dump to stdout
    Procedure Dump; overload;
    //: Perform sync TC->GIT
    procedure Perform;
{$IFDEF FEAT_UPLOAD}
    //: TODO Perform upload (GIT->TC)
    procedure Upload;
{$ENDIF}
    //: Load Authors from file
    procedure LoadAuthors;
    //: Save authors to file
    procedure SaveAuthors;

    //: Merge checkout
    procedure MergeAll;
    //: Push changes
    procedure PushAll;

    //: Does the directory have GIT
    function DirHasGit(DirName : String = #0): Boolean;
    //: Are there any modified repositories/submodules
    function CheckModifiedRepositories : boolean;
    //: Check if a single repository has changed modules.
    function CheckChanged(DirName : String = #0): Boolean;

    //: Set debug flag.
    procedure SetDebug( const strVal : String);

    procedure GitAllProjects(cmd: array of string; logName: string;
      onlyMarked: Boolean; return: TStrings = nil; echo: Boolean = true;
      MainProject: Boolean = true);

    procedure ApplyPatch(const PatchFile, patchLabel : String; checkinOnly : boolean);

    //: All TC Projects
    property Project[idx: integer]: String read rProject;
    //: Number of TC Projects
    property ProjectCount: integer read rProjCount;
    //: The index of the current active project
    property ActiveProject: integer read FProjIdx write wActiveProj;
    //: Allowable time-span for checkins being grouped
    property DiffSecs: integer read FDiffSecs write FDiffSecs;
    //: Which sections will prompt
    property PromptMode: TPromptModes read FPromptMode write FPromptMode;
    //: The Git command
    property Command: String read FCommand write FCommand;
    //: Primary Output directory for the git repository
    property OutputDir: String read FOutputDir write FOutputDir;
    //: Tag used for identifying to GIT
    property Tag: string read FTag write wTag;
    //: Add branch to checkout when downloading files.
    property Branch: String read FBranch write wBranch;
    property Repository : string read FRepository write FRepository;
    //: Set true to call 'git gc' at end.
    property GarbageCollect : boolean read FGarbageCollect write FGarbageCollect;
    //: Get/Set debug channel
    property Debug[opt : TCollateDebugOpts] : boolean read rDebug write wDebug;
    //: Set false to disable sign-off
    property UseSignoff: Boolean read FUseSignoff write FUseSignoff;
    //: Set true to use users from track
    property UseTrackUsers : boolean read FUseTrackUsers write FUseTrackUsers;
    property PushAtEnd: boolean read FPushAtEnd write FPushAtEnd;
    // : Should macros be stripped from files!
    property StripMacros: Boolean read FStripMacros write FStripMacros;
    //: Create a orphan branch if Tag doesn't exist.
    property AllowOrphan : Boolean read FAllowOrphan write FAllowOrphan;

  end;

procedure ExportMain;

implementation

uses
  sysutils, Generics.Defaults, TCVcsTypes, TCVCSUtils, TCVcsConst,
  AnsiStrings, StrUtils, shellAPI, windows, messages, DateUtils, registry;

const
  CMaxSecsGap = 300;
  CRevBegin = '--##--';
  CRevEnd = '##--##';
  CDebugOpts : array[TCollateDebugOpts] of string
  = ( 'init', 'maps', 'detail', 'fileget', 'fileadd', 'commits', 'push', 'merge', 'prunelog');
  CPrompts : array[TPromptMode] of string
  = ('new', 'file', 'commit', 'checkin', 'final', 'ref', 'garbage',
    'push','merge');

procedure WritePercent(curcount, totalCount: longint; var lastProg: integer); forward;
function IsBranchRevision( revision : String) : boolean; forward;
function IsParentOf(childRev, parentRev: String): Boolean; forward;
procedure StripFileMacros(Filename: String); forward;
function LoadFilesList(Data: Pointer; Name, LocalPath, LockedBy: String;
  ID, ParentID, AncestorID: Cardinal; Modified, Timestamp, CompressedSize,
  RevisionCount, ShareCount, Status: integer;
  IsVirtual, Frozen: Boolean): Boolean; forward;

procedure VcsErrCvt( Res : integer; Extra : String = '');
begin
  if res <> Err_OK then
    Raise Exception.Create(VcsErrorString(res)+IfThen(Extra='','',' '+Extra) );
end;
function PromptListStr(sep : string=', ') : string;
var
  str : string;
begin
  result := '';
  for str in CPrompts do
  begin
    if result <> '' then
      result := result +sep;
    result := result + str;
  end;
end;

function DebugListStr(sep : string = ', ') : string;
var
  str : string;
begin
  result := '';
  for str in CDebugOpts do
  begin
    if result <> '' then
      result := result + sep;
    result := result + str;
  end;
end;

// TODO: Make this not show the password.
function ReadPassword : String;
var
  passwd : String;
begin
  passwd := '';
  ReadLn(Passwd);
  result := passwd;
end;

procedure ExportMain;
var
  idx: integer;
  curParam: string;
  paramlist: TStringList;
  Connection, username, Password: string;
  codetag, OutputDir, Command: string;
  collator: TTCCollator;
  DiffSecs: integer;
  Prompt: TPromptModes;
  curPrompt : TPromptMode;
  promptlist: TStringList;
{$IFDEF FEAT_UPLOAD}  
  doUpload: Boolean;
{$ENDIF}
  doApplyPatch : Boolean;
  doOnlyCheckinPatch : boolean;
  found : boolean;
  doFetch : boolean;
  dumpFile : String;
  patchFile, patchLabel : string;
begin
  paramlist := TStringList.Create;
  try
    collator := TTCCollator.Create;
{$IFDEF FEAT_UPLOAD}
    doUpload := false;
{$ENDIF}
    Connection := '';
    OutputDir := '';
    codetag := '';
    dumpfile := '';
    patchFile := '';
    patchLabel := '';
    doFetch := true;
    doApplyPatch := false;
    doOnlyCheckinPatch := false;
    Prompt := [pmNew, pmCommit, pmFinal, pmGarbage, pmPush, pmMerge];
    DiffSecs := CMaxSecsGap;
    idx := 1;
    while idx <= ParamCount do
    begin
      curParam := ParamStr(idx);
      if (Length(CurParam) <= 1) or not CharInSet(curParam[1], ['-', '/']) then
        paramlist.Add(curParam)
      else
      begin
        case curParam[2] of
          'C', 'c':
            begin
              inc(idx);
              if idx <= ParamCount then
                Connection := ParamStr(idx);
            end;
          'G', 'g':
            begin
              inc(idx);
              if idx <= ParamCount then
                DiffSecs := StrToInt(ParamStr(idx));
            end;
          'O', 'o':
            begin
              inc(idx);
              if idx <= ParamCount then
                OutputDir := ParamStr(idx);
            end;
          'X', 'x':
            begin
              inc(idx);
              if idx <= ParamCount then
                Command := ParamStr(idx);
            end;
          'T', 't':
            begin
              inc(idx);
              if idx <= ParamCount then
                codetag := ParamStr(idx);
            end;
          'P', 'p':
            begin
              // Parse prompts
              inc(idx);
              if idx <= ParamCount then
              begin
                curParam := LowerCase(ParamStr(idx));
                if curParam = 'all' then
                  Prompt := [pmNew, pmFile, pmCommit, pmCheckin, pmFinal]
                else if curParam = 'none' then
                  Prompt := []
                else
                begin
                  promptlist := TStringList.Create;
                  try
                    Prompt := [];
                    promptlist.CommaText := curParam;
                    for curParam in promptlist do
                    begin
                      found := false;
                      for curPrompt := low(TPromptMode) to high(TPromptMode) do
                        if CompareText(CPrompts[curPrompt], curParam) = 0 then
                        begin
                          include(Prompt, curPrompt);
                          found := true;
                          break;
                        end;
                      if not found then
                      begin
                        Writeln( 'Valid prompts: '+ PromptListStr);
                        exit;
                      end;
                    end;
                  finally
                    promptlist.Free;
                  end;
                end;

              end;
            end;
          'S','s':
            if length(curparam) < 3 then
              collator.UseSignoff := true
            else
              collator.UseSignoff := curParam[3]= '-';
{$IFDEF FEAT_UPLOAD}
          'U', 'u':       
             doUpload := true;
{$ENDIF}
          '@': // Read file of maps/exclusions
            begin
              inc(idx);
              if idx <= ParamCount then
                collator.ReadMaps(ParamStr(idx));
            end;
          'D','d':
            begin
              inc(idx);
              if idx <= ParamCount then
                collator.SetDebug(ParamStr(idx));
            end;
          'M','m':
            begin
              inc(idx);
              if idx <= ParamCount then
                collator.Branch := ParamStr(idx);
            end;
          'R','r':
            begin
              inc(idx);
              if idx <= ParamCount then
                collator.Repository := ParamStr(idx);
            end;
          'Z','z':
              collator.GarbageCollect := true;
          '-','/':
              case IndexText( copy(curParam, 3,length(curParam)-2),
                ['trackusers', 'push', 'dump', 'no-fetch', 'strip-macro',
                 'strip-macros', 'apply-patch', 'apply-label', 'apply-checkin',
                 'allow-orphan']) of
                0:{trackusers} collator.UseTrackUsers := true;
                1:{push} collator.PushAtEnd := true;
                2:{dump}
                  begin
                    inc(idx);
                    if idx <= ParamCount then
                      dumpFile := ParamStr(idx);
                  end;
                3:{no-fetch}
                  doFetch := false;
                4,5:{strip-macro} collator.StripMacros := true;
                6:{apply-patch}
                  begin
                    doFetch := false;
                    doApplyPatch := true;
                    inc(idx);
                    if idx <= ParamCount then
                      patchFile := ParamStr(idx);
                  end;
                7:{apply-label}
                  begin
                    inc(idx);
                    if idx <= ParamCount then
                      patchLabel := ParamStr(idx);
                  end;
                8:{apply-checkin}
                  doOnlyCheckinPatch := true;
                9:{allow-orphan}
                  collator.AllowOrphan := true;
              else
                raise exception.Create('Unknown option:'+curParam);
              end;
        else
          raise exception.Create('Unknown option: '+curParam);
        end;
      end;
      inc(idx);
    end;

    if paramlist.Count < 3 then
      raise Exception.Create(
        'unknown options'#13#10+
        'Usage <username>:<password> <Project> [<path>] [<options>]'#13#10 +
        ' /C TCconnection}  Specify the TC connection to use'#13#10 +
        ' /G <gapseconds>      maximum seconds for grouping a commit'#13#10 +
        ' /O <OutputDir>       Export directory'#13#10+
        ' /X <gitpath>         Command path for git'#13#10+
        ' /P <msg>{,<msg>}     Prompt messages: all,none,'+PromptListStr(',')+#13#10+
        ' /R <repo>            Upstream Repository'#13#10+
        ' /T <Tag>             External tag to use in git for the export'#13#10+
        ' /Z                   Garbage collect at end'#13#10+
        ' /M <branch>          Merge branch at end'#13#10+
        ' /S[+-]               Enable/disable signoff'#13#10+
        ' --apply-patch {file} Apply patch to project'#13#10+
        ' --apply-label {lab}  Label to attach to checked in files'#13#10+
        ' --apply-checkin      Only checkin patch'#13#10+
//        ' --trackusers         Load users from Track'#13#10+
        ' --push               Push all modified repositories at end'#13#10+
        ' --dump <file>        Dump commits to file'#13#10+
        ' --no-fetch           Don''t fetch from TC'#13#10+
        ' --strip-macro        Strip RCS expansions from file'#13#10 +
        ' @  <filename>        Filename with renames and skips'#13#10+
        '     path=newpath     Export to different path (relative to the output dir)'#13#10+
        '     path=-           Skip exports'#13#10 +
        '     path=>{url}      Specify path (after conversion) is a submodule url to be CREATED'#13#10+
        '     path=>>{path}    Specify path (after conversion) is extracted independently'#13#10+
        ' --allow-orphan       If the tag doesn''t exist create an orphan repo'#13#10+
        ' /D <debug>{,<debug>} Debug options:'+DebugListStr(',')
        );

    username := paramlist[0];
    idx := Pos(':', username);
    if idx > 0 then
    begin
      Password := Copy(username, idx + 1, Length(username));
      username := Copy(username, 1, idx - 1);
    end
    else
    begin
      Write('Password:');
      Password := ReadPassword;
    end;
    if Connection = '' then
      Connection := 'Development';

    collator.OutputDir := OutputDir;
    collator.PromptMode := Prompt;

    // Connect to TC
    Write('Connecting: ' + username + '@' + Connection);
    collator.Connect(Connection, username, Password);
    Writeln('.');
    // Set the project to connect to.
    collator.SetProject(paramlist[1]);

    Write('Finding root folder: ' + paramlist[2]);
    if paramlist.Count > 1 then
      collator.SetRootFolder(paramlist[2]);
  finally
    paramlist.Free;
  end;

  Writeln('.');
  collator.Tag := codetag;
  collator.DiffSecs := DiffSecs;
  collator.Command := Command;

  if doApplyPatch then
  begin
    collator.ApplyPatch(PatchFile, patchLabel, doOnlyCheckinPatch);
  end
  else
  begin
    // Check if there are modifications to the repositories.
    if (OutputDir <> '') and doFetch and collator.CheckModifiedRepositories  then
      exit;

    // Load and collate the project's checkins.
    collator.Load;
    if dumpFile <> '' then
      collator.Dump(dumpFile);

    if OutputDir = '' then
    begin
      if dumpFile = '' then
        collator.Dump

    end
    else if doFetch then
    begin
      // Perform download from TC -> Local GIT
      collator.Perform;
{$IFDEF FEAT_UPLOAD}
      // TODO: Perform upload.
      if doUpload then
        collator.Upload;
{$ENDIF}
    end;
  end;

end;

{ TTCCollator }

procedure TTCCollator.Connect(const Connection, Name, Password: String);
var
  mapExcl : String;
begin
  FConnection := Connection;
  FUsername := Name;
  FPassword := Password;
  VcsErrCvt(VcsConnect(Connection, Name, Password), Connection);

  if (FOutputDir <> '') then
  begin
    mapexcl := IncludeTrailingPathDelimiter(FOutputDir)+'.tcdirs';
    if FileExists(mapexcl) then
      ReadMaps(mapexcl);
  end;
end;

constructor TTCCollator.Create;
begin
  inherited;
  FProjIdx  := -1;
  FFiles    := TFilesList.Create;
  FRevisions:= TRevisionList.Create(false);
  FCheckins := TCheckinList.Create(true);
  FFolders  := TFolderList.Create([doOwnsValues]);
  FSignOff  := TDictionary<String, string>.Create;
  FPathMaps := TDictionary<String, string>.Create;
  FSubmoduleMaps := TDictionary<String, TSubmoduleInf>.Create;
  FSubmoduleCache := TObjectDictionary<String, TPair<TSubmoduleInf, String>>.Create;
  FSubmoduleMod := TStringList.Create;
  FSubmoduleMod.Sorted := true;
  FSubmoduleMod.Duplicates := dupIgnore;
  FDiffSecs := CMaxSecsGap;
  FUseSignoff := true;
end;

procedure TTCCollator.BeforeDestruction;
begin
  FFiles.Free;
  FRevisions.Free;
  FCheckins.Free;
  FFolders.Free;
  FSignOff.Free;
  FPathMaps.Free;
  FSubmoduleMaps.Free;
  FSubmoduleCache.Free;
  FSubmoduleMod.Free;
  FUsers.Free;
  inherited;

end;
procedure TTCCollator.Dump( Filename : String);
var
  F : Text;
begin
  AssignFile(F, FileName);
  Rewrite(F);
  try
    DoDump(F);
  Finally
    CloseFile(f);
  end;
end;

procedure TTCCollator.Dump;
begin
  DoDump(output);
end;

procedure TTCCollator.DoDump(var F: Text);
var
  checkin: TCheckinGroup;
  cmt: string;
  revision: TRevisionInfo;
  Comments: TStringList;
begin
  Comments := TStringList.Create;
  try
    for checkin in FCheckins do
    begin
      Writeln(F, '--');
      Writeln(F, 'User: ' + checkin.Author);
      Writeln(F, 'Date: ' + FormatDateTime('yyyy.mm.dd hh:nn', checkin.LabelDate));
      Writeln(F, 'Comments: ');
      Comments.Text := checkin.Comments;
      for cmt in Comments do
      begin
        Write(F, '  ');
        Writeln(F, cmt);
      end;
      Writeln(F, 'Files:');
      for revision in checkin.Revisions do
      begin
        Write(F, '  File: (' + IntToStr(revision.FileInf.ItemID)
            + 'v' + revision.RevisionName + ') ' + revision.FileInf.Filename);
        if assigned(revision.FileInf.Folder) then
          Write(F, ' in "' + revision.FileInf.Folder.FolderName + '"');
        Writeln(F, ' to "$' + GetPathToRoot(revision.FileInf.ParentID) + '"');
      end;
    end;
  finally
    Comments.Free;
  end;
end;

procedure TTCCollator.AddMap(const Path, MapTo: string);
var
  MPath, MMapTo : String;
  Inf : TSubmoduleInf;
  idx : integer;
begin
  if not assigned(FRawMaps) then
    FRawMaps := TStringList.Create;

  // Normalise Path Seperators
  MPath := ReplaceStr(Path,'/','\');
  MMapTo := ReplaceStr(MapTo,'/','\');
  FRawMaps.Add(MPath+'='+MMapTo);
  if (MapTo <> '') and (MapTo[1] = '>') then
  begin
    inf.IsSubmodule := (length(MapTo) <= 2) or (MapTo[2] <> '>');

    if inf.IsSubmodule then
    begin
      inf.Repository := Copy(MMapTo,2,length(MapTo)-1);
      inf.Path := MPath;
    end
    else
    begin

      idx := PosEx('>',MMapTo,3);
      if idx > 0 then
      begin
        inf.Repository :=  Copy(MMapTo,idx+1,length(MMapTo)-idx);
        inf.Path := Copy(MMapTo,3,idx-3);
      end
      else
      begin
        inf.Path := Copy(MMapTo,3,Length(MapTo)-2);
        inf.Repository := '';
      end;
    end;

    FSubmoduleMaps.AddOrSetValue(MPath, inf);
    FSubmoduleCache.AddOrSetValue(Mpath, TPair<TSubmoduleInf,String>.Create(inf,''));
  end
  else
    FPathMaps.AddOrSetValue(MPath,MMapTo);
end;

function TTCCollator.MappedPath(const Path: String): string;
var
  findpath, mappedTo : String;
  pathlen, splitpos  : integer;
begin
  // Apply any path conversions to a path.

  result := Path; // Default to the whole path
  findpath := Path;
  pathlen := length(path);
  splitpos :=  pathlen+1;
  // Ignore trailing \
  if (splitpos > 1) and (path[splitpos-1] = '\') then
  begin
    Dec(SplitPos);
    findpath := Copy(Path,1,splitPos-1);
    dec(PathLen);
  end;

  while splitpos > 0 do
  begin
    // Search cache
    if FPathMaps.TryGetValue(findpath, mappedTo) then
    begin
      result := mappedTo;
      if SplitPos <= Length(path) then
      begin
        // Add in the remainder of the path.
        if (result <> '-') then
          result := result + Copy(Path,splitpos, 1+pathlen-splitpos);
        // Remember the expansion so it's quicker next time.
        FPathMaps.AddOrSetValue(Path,result);
      end;
      break;
    end;
    // Move onto next part of path.
    Dec(SplitPos);
    while (splitPos>0) do
    begin
      case Path[splitpos] of
        '\','/': break;
      end;
      Dec(splitPos);
    end;
    // This is the bit we search for now.
    findpath := Copy(Path,1,splitPos-1);
  end;
end;

function TTCCollator.IsSubmodule(const Path : String; var SubmoduleRoot, SubModulePath: String; Mark: Boolean): TSubmoduleType;
var
  findpath : String;
  mappedTo : TPair<TSubmoduleInf,String>;
  pathlen , splitpos  : integer;
begin
  result := stMain;
  findpath := Path;
  pathlen := length(path);
  splitpos := pathlen+1;
  // Ignore trailing \
  if (splitpos > 1) and (path[splitpos-1] = '\') then
  begin
    Dec(SplitPos);
    findpath := Copy(Path,1,splitPos-1);
    dec(Pathlen);
  end;

  while splitpos > 0 do
  begin
    if FSubmoduleCache.TryGetValue(findpath, mappedTo) then
    begin

      SubModulePath := mappedTo.Value;
      SubmoduleRoot := mappedTo.Key.Path;
      if SplitPos <= pathlen then
      begin
        // Add in the remainder of the path.
        if submodulePath <> '' then
          submodulePath := IncludeTrailingPathDelimiter(submodulepath);
        submodulePath := submodulePath + Copy(Path,splitpos+1, pathlen-splitpos);
        // Remember the expansion
        FSubmoduleCache.AddOrSetValue(Copy(Path,1,pathlen),
          TPair<TSubmoduleInf,String>.Create(mappedTo.Key, submodulePath));
      end;

      if mappedTo.Key.IsSubmodule then
        result := stSubmodule
      else
        result := stExtract;

      if Mark then
        FSubmoduleMod.Add(SubmoduleRoot);

      break;
    end;

    Dec(SplitPos);
    while (splitPos>0) do
    begin
      case Path[splitpos] of
        '\','/': break;
      end;
      Dec(splitPos);
    end;
    // This is the bit we search for now.
    findpath := Copy(Path,1,splitPos-1);
  end;
end;

procedure TTCCollator.ReadMaps(const Filename: String);
var
  strs : TStringList;
  curline : String;
  idx : integer;
begin
  // Read in maps from file
  strs := TStringList.Create;
  try
    strs.LoadFromFile(filename);
    for curline in strs do
    begin
      if length(curline) > 0 then
        case curline[1] of
          '#': ;
          ';': ;
        else
          idx := PosEx('=',curline);
          if idx = 0 then
            AddMap(curline,'')
          else
            AddMap(Copy(CurLine,1,idx-1),Copy(curline,idx+1,Length(curline)-idx));
        end;
    end;
  finally
    strs.free;
  end;

end;


procedure ClearCheckoutInfo(choutinf: PCheckoutInfo);
begin
  StrCopy(choutinf.Comments, '');
  StrCopy(choutinf.Extra, '');
  StrCopy(choutinf.revision, '');
  StrCopy(choutinf.LocalPath, '');
  choutinf.VersionID := 0;
  choutinf.AssignVersionID := 0;
  choutinf.Overwrite := false;
  choutinf.Flags := 0;
end;

function ExecCmd(const Dir, cmd: string; params: array of string;
  lines: TStrings = nil; echo: Boolean = true): Dword;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Security: TSecurityAttributes;
  ReadPipe, WritePipe: THandle;
  ExitCode: Dword;
  TrimDir: String;
  Directory: PChar;
  cmdline: String;
  procedure AddToCommand(param: string);
  var
    idx: integer;
  begin
    if Length(cmdline) > 0 then
      cmdline := cmdline + ' ';

    if Pos(' ', param) = 0 then
      cmdline := cmdline + param
    else if Copy(param, 1, 2) <> '--' then
      cmdline := cmdline + '"' + param + '"'
    else
    begin
      idx := Pos('=', param);
      cmdline := cmdline + Copy(param, 1, idx) + '"' + Copy(param, idx + 1,
        Length(param)) + '"';
    end;
  end;

const
  CReadBuffer = 2400;
var
  param: string;
  Buffer: PAnsiChar;
  strBuf: String;
  allstrings: String;
  BytesRead, BytesRemain, bytestoread: Dword;

  procedure ReadData;
  begin
    //
    PeekNamedPipe(ReadPipe, Buffer, CReadBuffer, @BytesRead, @BytesRead, nil);

    BytesRemain := BytesRead;
    while BytesRemain > 0 do
    begin

      BytesRead := 0;
      FillChar(Buffer[0], CReadBuffer, #0);
      if BytesRemain >= CReadBuffer then
        bytestoread := CReadBuffer
      else
        bytestoread := BytesRemain;

      ReadFile(ReadPipe, Buffer[0], bytestoread, BytesRead, nil);
      Dec(BytesRemain, BytesRead);
      Buffer[BytesRead] := #0;
      OemToAnsi(Buffer, Buffer);
      strBuf := String(AnsiString(Buffer));
      if assigned(lines) then
        allstrings := allstrings + strBuf;
      if echo then
        Write(strBuf);
    end;
  end;
var
  reg : TRegistry;
  oldCP, ACP : Cardinal;
begin

  Security.nlength := SizeOf(TSecurityAttributes);
  Security.binherithandle := true;
  Security.lpsecuritydescriptor := nil;
  ExitCode := 0;
  allstrings := '';

  if Createpipe(ReadPipe, WritePipe, @Security, 0) then
  begin
    try
      FillChar(StartupInfo, SizeOf(StartupInfo), 0);
      with StartupInfo do
      begin
        cb := SizeOf(StartupInfo);
        dwFlags := STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW;
        wShowWindow := SW_HIDE;
        hStdOutput := WritePipe; // STD_OUTPUT_HANDLE; // ;
        hStdInput := INVALID_HANDLE_VALUE; // STD_INPUT_HANDLE; //
        hStdError := WritePipe; // STD_ERROR_HANDLE;
      end;

      TrimDir := Trim(Dir);

      if Length(TrimDir) = 0 then
        Directory := nil
      else
        Directory := PChar(TrimDir);
      oldCP := GetConsoleCP;
      acp := 0;
      reg := TRegistry.Create;
      try
        reg.RootKey := HKEY_LOCAL_MACHINE;

        if (reg.OpenKeyReadOnly('\SYSTEM\CurrentControlSet\Control\Nls\CodePage')) then
        begin
          try
            acp := Cardinal(StrToInt(reg.ReadString('ACP')));
          except
            on E : Exception do
              WriteLn('Getting CP: '+E.message);
          end;
        end;
      finally
        reg.Free;
      end;

      if ExtractFileExt(ExpandFileName(cmd)) = '.cmd' then
      begin
        cmdline := 'cmd /C';

      end
      else
        cmdline := '';
      AddToCommand(cmd);
      for param in params do
        AddToCommand(param);
      if acp <> 0 then
        SetConsoleCP(acp);
      try
        if CreateProcess(nil, PChar(cmdline), @Security, @Security, true,
          NORMAL_PRIORITY_CLASS, nil, Directory, StartupInfo, ProcessInfo) then
        begin
          try
            Buffer := AllocMem(CReadBuffer + 1);
            try
              while WaitForSingleObject(ProcessInfo.hProcess, 0) <> WAIT_OBJECT_0 do
              begin
                // -- check if the process is still active
                GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
                if ExitCode <> STILL_ACTIVE then
                  break;

                ReadData;
              end;
              ReadData;
            finally
              FreeMem(Buffer);
            end;
            GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
          finally
            CloseHandle(ProcessInfo.hProcess);
            CloseHandle(ProcessInfo.hThread);
          end;
        end;
      finally
        SetConsoleCP(oldCP);
      end;
      if assigned(lines) then
        lines.Text := allstrings;
    finally
      CloseHandle(ReadPipe);
      CloseHandle(WritePipe);
    end;
  end;
  result := ExitCode;
end;

function TTCCollator.Git(cmd: array of string; return: TStrings = nil; echo: Boolean = true; GitPath : String = #0) : integer;
var
  gitcmd, s: string;
begin
  if FCommand <> '' then
    gitcmd := FCommand
  else
  begin
    gitcmd := 'c:\Program Files\Git\bin\git.exe'; //cmd\git.cmd'
  end;

  if echo then
  begin
    Write('git');
    for s in cmd do
      Write(' ' + s);
    Writeln;
  end;
  if GitPath= #0 then
    GitPath := OutputDir;

  result := ExecCmd(GitPath, gitcmd, cmd, return, echo);
end;

{ Get the current branch for the path.
}
function TTCCollator.GitCurrentBranch( GitPath : String = #0) : String;
var
  retvals : TStrings;
  branch : String;
begin
  result := '';
  retVals := TStringList.Create;
  try
    Git(['branch'], retVals, false, GitPath);
    for branch in retvals do
      if (length(branch) > 0) and (branch[1] = '*') then
      begin
        result := Copy(branch, 3,length(branch)-2);
        break;
      end;
  finally
    retvals.Free;
  end;
end;

function TTCCollator.HasTCRef( DirName : string = #0; oldRef : boolean = false): Boolean;
begin
  if DirName = #0 then
    DirName := FOutputDir;
  if not DirHasGit(DirName) then
    result := false
  else
    result := FileExists(IncludeTrailingPathDelimiter(  DirName)
        + '.git\refs\heads\' + IfThen(oldRef,TCTagOld,TCTag));
end;
//Return true if the reference exists.
function TTCCollator.GitHasRef( RefName : String; Dirname : String = #0) : Boolean;
var
  strRet : TStrings;
  check : String;
begin

  result := DirHasGit(DirName);
  if result then
  begin
    strRet := TStringList.Create;
    try
      Git(['show-ref',RefName],strRet,false,DirName);
      for check in strRet do
        if Trim(Check) <> '' then
          exit;
      result := false;
    finally
      strRet.Free;
    end;
  end;
end;


function TTCCollator.DirHasGit(DirName : String = #0): Boolean;
begin
  if DirName = #0 then
    DirName := FOutputDir;
  result := DirectoryExists(IncludeTrailingPathDelimiter(DirName) + '.git')
    and FileExists(IncludeTrailingPathDelimiter(DirName) + '.git\config');
end;

function IsGITID(gitID: String): Boolean;
var
  ch: Char;
begin
  result := Length(gitID) = 40;
  if result then
    for ch in gitID do
    begin
      if not CharInSet(ch, ['0' .. '9', 'a' .. 'f', 'A', 'F']) then
      begin
        result := false;
        break;
      end;
    end;
end;

function TTCCollator.InitGit: Boolean;
var
  isNew : boolean;
  submodule : TPair<String, TSubmoduleInf>;
  smoddir : string;
  hassubmodinit : boolean;
begin
  // Main Repo
  result := DoInitRepo(FOutputDir, true, isNew);
  if isNew and (FRepository <> '') Then
  begin
    // Add in the remote repository
    Git(['remote', 'add', 'server', FRepository], nil, cdoInit in FDebugOpts);
  end;
  if assigned(FSubmoduleMaps) and (FSubmoduleMaps.Count > 0) and isnew then
  begin
    hasSubmodInit := false;

    for submodule in FSubmoduleMaps do
    begin
        // Check it's not an extracted module
      if (submodule.value.IsSubmodule) then
      begin
        // It's a proper submodule .. initialise it.
        smoddir := IncludeTrailingPathDelimiter(FOutputDir)+ submodule.key;
        if not DirHasGit(Smoddir) then
        begin
          if not hasSubmodInit then
          begin
            Git(['submodule','init'], nil, cdoInit in FDebugOpts );
            hasSubmodInit := true;
          end;
          ForceDirectories(Smoddir);
          DoInitRepo(smoddir, false, isNew);
          //Git(['init'], nil, cdoInit in FDebugOpts, smoddir);
          // Add the remote server to the submodule as 'server'
          Git(['remote', 'add', 'server', submodule.value.Repository], nil, cdoInit in FDebugOpts, smoddir);
          // Add the submodule. This should add it as a new submodule.
          // By changing to / path seperator, the .gitmodules will have '/'
          // Git doesn't like having \ as the pathsep in .gitmodules
          Git(['submodule', 'add', '--', submodule.value.Repository, ReplaceStr(submodule.key,'\','/')],
            nil, (cdoFileadd in FDebugOpts) and (cdoInit in FDebugOpts));
        end;
      end
      else
      begin
        // It's an extracted module
        smoddir := submodule.Value.Path;
        if (smoddir <> '') and (smoddir[1] = '.') then
          smoddir := IncludeTrailingPathDelimiter(FOutputDir)+ smoddir; // Relative
        ForceDirectories(Smoddir);
        DoInitRepo( smoddir, false, isnew);
        if submodule.value.Repository <> '' then
          Git(['remote', 'add', 'server', submodule.value.Repository], nil, cdoInit in FDebugOpts, smoddir);
      end;
    end;
    if hasSubmodInit then
      Git(['commit','-m','submodules added.'], nil, cdoInit in FDebugOpts);
  end;
end;

function TTCCollator.DoInitRepo( const Path : string; addTCDirs : boolean; var IsNew : boolean) : Boolean;
var
  gitignore, gitmap, mapexcl: String;
  f: TextFile;
begin
  result := true;
  isNew := false;
  if not DirHasGit(path) then
  begin
    Writeln('Initialising GIT Repository in ' + Path);
    if not Prompt(pmNew) then
    begin
      result := false;
      exit;
    end;
    Git(['init'],nil, cdoInit in FDebugOpts, path);

    if not DirHasGit(Path) then
    begin
      result := false;
      exit;
    end;
    if (FBranch <> '') and (FBranch <> 'master') then
      // Change default path.
      Git(['symbolic-ref','HEAD','refs/heads/'+FBranch], nil, cdoInit in FDebugOpts, path);

    isNew := true;
    gitignore := IncludeTrailingPathDelimiter(Path) + '.gitignore';

    AssignFile(f, gitignore);
    ReWrite(f);
    try
      Writeln(f, 'commit.$$$');
      Writeln(f, '*.[Dd][Cc][PUpu]');
      Writeln(f, '*.[bB][Pp][Ll]');
      Writeln(f, '*.identcache');
      Writeln(f, '*.[bB][Aa][Kk]');
      Writeln(f, '*.~*');
      Writeln(f, '*.[Dd][Ss][KkMm]');
      Writeln(f, '*.copy');
      Writeln(f, '*.orig');
      Writeln(f, '*.sw[poqrst]');
      Writeln(f, '.authors');
      Writeln(f, '.tcdirs');
      Writeln(F, '*.origin');
    finally
      CloseFile(f);
    end;
    Git(['add','--','.gitignore'], nil, cdoInit in FDebugOpts, path);
    if addTcDirs then
    begin
      mapexcl := IncludeTrailingPathDelimiter(Path)+'.tcdirs';
      if assigned(FRawMaps) and (FRawMaps.Count > 0)
        and not FileExists(mapexcl) then
      begin

        AssignFile(f, mapexcl);
        ReWrite(f);
        try
          Writeln(f, '# Directory maps and exclusions');
          for gitmap in FRawMaps do
            WriteLn(f, gitmap);
        finally
          CloseFile(f);
        end;
      end;
      Git(['add','--','.tcdirs'], nil, cdoInit in FDebugOpts, path);
    end;
    Git(['commit','-m','git2tc setup'], nil, cdoInit in FDebugOpts, path);
    // Create the branch, now there is a commit to add
    Git(['checkout', '-b', TCTag], nil, cdoInit in FDebugOpts, path);
  end;
end;

type
  TSubmoduleCommit = class
  public
    IsSubmodule : boolean;
    Refs : TStrings;
    constructor Create( AIsSubmodule : Boolean );
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

constructor TSubmoduleCommit.Create( AIsSubmodule : Boolean );
begin
  IsSubmodule := AIsSubmodule;
  inherited Create;
end;

procedure TSubmoduleCommit.AfterConstruction;
begin
  inherited;
  refs := TStringList.Create;
end;

procedure TSubmoduleCommit.BeforeDestruction;
begin
  refs.Free;
  inherited;
end;

// returns true if dfm file is in a binary format : Delphidabbler.com
function IsDFMBinary(Filename: string): Boolean;
var
  F: TFileStream;
  B: Byte;
begin
  B := 0;
  F := TFileStream.Create(Filename, fmOpenRead);
  try
    F.Read(B, 1);
    result := B = $FF;
  finally
    F.Free;
  end;
end;

function Esses( count : Integer; singular : string = ''; plural : string = 's') : string;
begin
  if count = 1 then
    result := singular
  else
    result := plural;
end;

// convert a binary dfm file to a text dfm file : Delphidabbler.com
function Dfm2Txt(Src, Dest: string): Boolean;
var
  SrcS, DestS: TFileStream;
begin
  if Src = Dest then
  begin
    result := false;
    exit;
  end;
  SrcS := TFileStream.Create(Src, fmOpenRead);
  DestS := TFileStream.Create(Dest, fmCreate);
  try
    ObjectResourceToText(SrcS, DestS);

    if FileExists(Src) and FileExists(Dest) then
      result := true
    else
      result := false;
  finally
    SrcS.Free;
    DestS.Free;
  end;
end;

procedure TTCCollator.Perform;
var
  checkin: TCheckinGroup;
  revision: TRevisionInfo;
  Comments: TStringList;
  cmt, Filename, signoff, basepath, outDir : string;
  filepath : String;
  revid: AnsiString;
  choutinf: PCheckoutInfo;
  coRevisionID: Cardinal;
  commitName, exts, extension, gitname, gitnameext: string;

  (*commitid,*) extlist: TStringList;
  procedure UpdateRef(gitPath : String);
  (*var
    gitID : string; *)
  begin
    (*
    commitid.Clear;
    if not Prompt(pmUpdateRef) then
      raise Exception.Create('User Aborted');
    Git(['log', '--format=format:%H', '--max-count=1'], commitid, false, gitPath);
    if commitid.Count > 0 then
      gitID := commitid[0]
    else
      gitID := '';
    if not IsGITID(gitID) then
    begin
      Writeln('missing GIT identifier for '+gitPath+':');
      Writeln(commitid.Text);
      Write('Find and enter Commit ID:');
      ReadLn(gitID);
    end;
    if not HasTCRef(gitpath) then
    begin
      Git(['branch','-r',TCTag], nil, cdoCommits in FDebugOpts, gitPath);
      Git(['checkout',TCTag], nil, cdoCommits in FDebugOpts, gitPath);
    end;
    if IsGITID(gitID) then
      Git(['update-ref', 'refs/' + TCTag, gitID], nil, cdoCommits in FDebugOpts, gitPath)
    else
      Writeln('Skipping update ref for: '+gitPath);
    *)
  end;
  procedure WriteCommitComment( filename : String; comments : TStrings; Refs : TStrings);
  var
    f: TextFile;
    cmt, ref : string;
    idx: integer;
  begin
    AssignFile(f, filename);
    Rewrite(f);
    try
      if Comments.count = 0 then
        WriteLn(f, '-')
      else
      begin
        for idx := 0 to Comments.Count - 1 do
        begin
          cmt := Comments[idx];
          // Add a paragraph separator from first line.
          if (idx = 1) and (Trim(cmt) <> '') then
            Writeln(F, '');
          Writeln(F, cmt);
        end;
        Writeln(F, '');
      end;
      if FUseSignoff then
        Writeln(f, 'Signed-off-by: ' + signoff);
      if refs.count > 0 then
      begin
        Writeln(f, CRevBegin);
        for ref in refs do
          Writeln(f,ref);
        Writeln(f, CRevEnd);
      end;
    finally
      CloseFile(f);
    end;
  end;

var
  SubmoduleRoot, SubModulePath, gitPath  : string;
  SubmoduleCommits : TObjectDictionary<String, TSubmoduleCommit>;
  curSubmodCommit : TSubmoduleCommit;
  modCommit : TPair<String, TSubmoduleCommit>;
  mainModuleRefs : TStrings;
  gitDate : String;
  lastBlank: Boolean;
  userName, email : string;
  idx,idy : integer;
  procTime : Int64;
  procHrs, PrcMins, PrcSecs : Integer;
  totalCount, curPos : longint;
  lastProg, thisprog, progcount : integer;
  putdot : boolean;
  curModuleRefs : TStrings;
  hasSubmoduleCommit : boolean;
  submodule : TPair<String, TSubmoduleInf>;
  smoddir : string;
  stripfile, curBranch, usebranch: string;
  isOK : boolean;
begin
  LoadAuthors;
  commitName := IncludeTrailingPathDelimiter(FOutputDir) + 'commit.$$$';
  extlist := nil;
  (*commitid := nil;*)
  SubmoduleCommits := nil;
  mainModuleRefs := nil;
  Comments := TStringList.Create;
  try
    extlist := TStringList.Create;
    (*commitid := TStringList.Create; *)
    mainModuleRefs := TStringList.Create;
    SubmoduleCommits := TObjectDictionary<String, TSubmoduleCommit>.Create;
    for checkin in FCheckins do
      GetSignOff(checkin.Author); // Make sure we have author sign-offs for all.

    ForceDirectories(FOutputDir);

    usebranch := IfThen(FBranch='','master',FBranch);
    InitGit;
    curBranch := GitCurrentBranch;
    if curBranch <> TCTag then
    begin
      if HasTCRef then
        Git(['checkout', TCTag])
      else
      begin

        if HasTCRef(#0,true) and (curBranch <> TCTagOld) then
          Git(['checkout', TCTagOld])
        else if curBranch <> usebranch then
        begin
          if GitHasRef(useBranch) then
            Git(['checkout', useBranch])
          else if FAllowOrphan then
            Git(['checkout', '--orphan', useBranch]);
        end;

        Git(['checkout',  '-b', TCTag]);
      end;
    end;

    for submodule in FSubmoduleMaps do
    begin
      if submodule.Value.IsSubmodule then
          // It's a proper submodule .. Checkout the tag
        smoddir := IncludeTrailingPathDelimiter(FOutputDir)+ submodule.key
      else
      begin
         // It's an extracted module
        smoddir := submodule.Value.Path;
        if (smoddir <> '') and (smoddir[1] = '.') then
          smoddir := IncludeTrailingPathDelimiter(FOutputDir)+ smoddir; // Relative
      end;
      curBranch := GitCurrentBranch(smoddir);
      if curBranch  <> TCTag then
      begin
        Writeln(Format('Checkout branch %s for %s',[TCTag, smoddir]));
        if HasTCRef(smoddir) then
          Git(['checkout', TCTag],nil,true,smoddir)
        else
        begin
          if HasTCRef(smoddir, true) and (curBranch <> TCTagOld) then
            Git(['checkout', TCTagOld],nil,true,smoddir)
          else if curBranch <> useBranch then
          begin
            if GitHasRef(useBranch, smoddir) then
              Git(['checkout', useBranch], nil,true,smoddir)
            else if FAllowOrphan then
              Git(['checkout', '--orphan', usebranch], nil, true, smoddir);
          end;

          Git(['checkout', '-b', TCTag],nil,true,smoddir);
        end;
      end;
    end;

    totalCount := FCheckins.Count;
    Writeln(Format('Importing %d commit%s into repository at %s.', [totalCount,Esses(totalCount),FOutputDir]));
    curPos := 0;
    lastProg := -1;
    progcount := 0;
    putdot := true;
    for checkin in FCheckins do
    begin
      // Output progress
      thisProg := (200 * curPos) div totalCount;
      if (FDebugOpts * [cdoCommits, cdoFileadd, cdoDetail ]) <> [] then
      begin
        Writeln('--');
        WriteLn(Format('[%.1f%%]', [thisProg/2.0]));
      end
      else
      begin
        if thisProg > lastprog then
        begin
          if (thisProg div 2) = (lastProg div 2) then
          begin
            write('.');
            putdot := true;
          end
          else
          begin
            if not putdot then
              write('.');
            Write(IntToStr(thisProg div 2));
            putdot := false;
            inc(progcount);
            if progCount >= 10 then
            begin
              progCount := 0;
              Writeln;
            end;
          end;
          lastProg := thisProg;
        End;
      end;

      inc(curPos);

      signoff := GetSignOff(checkin.Author);

      Comments.Text := checkin.Comments;
      if cdoDetail in FDebugOpts then
      begin
        Writeln('User: ' + checkin.Author);
        Writeln('Sign: ' + signoff);
        Writeln('Date: ' + FormatDateTime('yyyy.mm.dd hh:nn', checkin.LabelDate));
        Writeln('Comments: ');

        for cmt in Comments do
        begin
          Write('  ');
          Writeln(cmt);
        end;
      end;

      // Override the dates, name and email using enviornment variables
      gitDate := FormatDateTime('yyyy-mm-dd hh:nn:ss', checkin.LabelDate);
      SetEnvironmentVariable('GIT_AUTHOR_DATE', PChar(gitDate));
      SetEnvironmentVariable('GIT_COMMITTER_DATE', PChar(gitDate));
      idx := PosEx('<', signoff);
      if idx > 0 then
      begin
        userName := trim(Copy(signoff,1,idx-1));
        idy := PosEx('>', signoff,idx+1);
        if idy = 0 then
          idy := length(signoff)+1;
        email := trim(Copy(signoff,idx+1, idy-(idx+1)));
        SetEnvironmentVariable('GIT_COMMITTER_NAME', PChar(userName));
        SetEnvironmentVariable('GIT_COMMITTER_EMAIL', PChar(email));
      end;

      // Go through the files for a commit.
      SubmoduleCommits.Clear;
      mainModuleRefs.Clear;
      choutinf := InitializeCheckOutInfo;
      try
        if cdoFileGet in FDebugOpts then
          Writeln('Files:');

        for revision in checkin.Revisions do
        begin
          basepath := GetPathToRoot(revision.FileInf.ParentID);

          // Initialise TC checkout structures
          coRevisionID := revision.RevisionID;
          Filename := revision.FileInf.Filename;
          revid := AnsiString(revision.RevisionName);

          outDir := IncludeTrailingPathDelimiter(FOutputDir);

          // Get sub-module information
          case IsSubmodule(basepath, SubmoduleRoot, SubModulePath, true) of
            stSubmodule:
            begin
              // Submodule - commit to the submodule path
              // .. and commit submodule changes to main repository.
              outDir := IncludeTrailingPathDelimiter(outdir+SubModuleRoot);
              submoduleRoot := ExcludeTrailingPathDelimiter(SubmoduleRoot);
              if not SubmoduleCommits.TryGetValue(subModuleRoot,curSubmodCommit) then
              begin
                curSubmodCommit := TSubmoduleCommit.Create(true);
                SubmoduleCommits.Add(submoduleRoot, curSubmodCommit);
              end;
              curModuleRefs := curSubmodCommit.Refs;
              basePath := SubModulePath;
            end;
            stExtract:
            begin
              // Extract - to a path outside  the main repository
              if (submoduleRoot <> '') and (submoduleRoot[1] <> '.') then
                outDir := SubModuleRoot
              else
                outDir := outDir + SubModuleRoot;
              if not SubmoduleCommits.TryGetValue(outDir,curSubmodCommit) then
              begin
                curSubmodCommit := TSubmoduleCommit.Create(false);
                SubmoduleCommits.Add(outDir, curSubmodCommit);
              end;
              curModuleRefs := curSubmodCommit.Refs;
              basePath := SubModulePath;
              outdir := IncludeTrailingPathDelimiter(outDir);
            end;
          else
            curModuleRefs := mainModuleRefs;
          end;

          filepath := (outDir + basepath);

          // Checkout, don't lock - leaving writable.
          ClearCheckoutInfo(choutinf);
          choutinf.Lock := false;
          choutinf.Overwrite := true;
          choutinf.Flags := co_LeaveWorkfileWritable or co_IgnoreLocked;
          StrCopy(choutinf.revision, PAnsiChar(revid));
          StrCopy(choutinf.LocalPath, PAnsiChar(AnsiString(filepath)));

          // Debugging
          if cdoFileGet in FDebugOpts then
          begin
            Write('  File: (' + revision.RevisionName + ') ' +
                revision.FileInf.Filename);
            if assigned(revision.FileInf.Folder) then
              Write(' in "' + revision.FileInf.Folder.FolderName + '"');
            Write(' to "' + filepath + '"');
          end;

          // Find the name relative to the git repo.
          if basepath = '' then
            gitname := Filename
          else
            gitname := IncludeTrailingPathDelimiter(basepath)  + Filename;

          // Check out a file from TC
          try
            VcsErrCvt(VcsCheckOutFileEx(revision.FileInf.ItemID, coRevisionID, choutinf, Filename), gitname);
          except
            on E: Exception do
            begin
              writeln;
              Writeln(
                Format('Exception on File Checkout: %s (%u v %s): %s',
                 [gitName, revision.FileInf.ItemID, revision.RevisionName,E.message]));
            end;
          end;

          if cdoFileGet in FDebugOpts then
            Writeln('.');

          if not Prompt(pmFile) then
            raise Exception.Create('User Aborted');

          // In TC a single file can be a group of files to check in.
          exts := '';
          try
            VcsErrCvt(VcsGetFileGroupExtensions(
              IncludeTrailingPathDelimiter(filepath) + Filename, exts));
          except
            on E: Exception do
            begin
              writeln;
              Writeln(
                Format('Exception getting File extensions: %s (%u v %s): %s',
                 [gitName, revision.FileInf.ItemID, revision.RevisionName,E.message]));
            end;
          end;
          // Add this file to the references list for the commit comment.
          curModuleRefs.Add(Format('%uv%s:%s', [revision.FileInf.ItemID,
              revision.RevisionName, revision.FileInf.Filename]));

          // Add all the files grouped under that name into the staging area.
          extlist.Delimiter := ';';
          extlist.DelimitedText := exts;
          if extList.Count = 0 then
            extList.Add('');

          for extension in extlist do
          begin
            // If any of the 'File Group' extensions, then add them in too.
            gitnameext := ChangeFileExt(gitname, extension);
            stripfile := outDir + gitnameext;
            if FileExists(stripfile) then
            begin
              // Process files.
              try
                case IndexText(extension, ['.dfm', '.pas', '.dpr']) of
                  0: { DFM }
                    if IsDFMBinary(stripfile) then
                    begin
                      try
                        isOK := Dfm2Txt(stripfile, stripfile + '.texted') ;
                      except
                        on E : Exception do
                        begin
                          Writeln('Error Converting '+stripfile+' to text dfm: '+E.Message);
                          Git(['checkout','--', gitnameext], nil, cdoFileadd in FDebugOpts, outDir);
                          // Restore last
                          if FileExists(stripfile + '.origin') then
                            sysutils.DeleteFile(stripfile + '.origin');
                        end;
                      end;
                      if isok then
                      begin
                        if FileExists(stripfile + '.origin') then
                          sysutils.DeleteFile(stripfile + '.origin');
                        if not sysutils.RenameFile(stripfile,
                          stripfile + '.origin') then
                          Writeln('Rename ' + stripfile + ' to origin failed')
                        else if not sysutils.RenameFile(stripfile + '.texted',
                          stripfile) then
                          Writeln('Rename of ' + stripfile + '.texted failed');
                      end;
                    end;
                  1: { PAS,DPR }
                    if FStripMacros then
                      StripFileMacros(stripfile);
                end;
              except
                on E : Exception do
                begin
                  Writeln('Error Normalising: '+StripFile+' :'+E.Message);
                end;
              end;

              // Add file (use -- to make sure the file is treated as a file)
              Git(['add', '--', gitnameext], nil, cdoFileadd in FDebugOpts, outDir);
            end
          end;

        end;

        if not Prompt(pmCommit) then
          raise Exception.Create('User Aborted');

        // Commit changes to submodules.
        for modCommit in SubmoduleCommits do
        begin
          SubmoduleRoot := modCommit.key;
          WriteCommitComment(commitName, Comments, modCommit.Value.Refs);
          if modCommit.Value.IsSubmodule then
            gitPath  :=IncludeTrailingPathDelimiter(FOutputDir)+submoduleRoot
          else
            gitPath := submoduleRoot;
          Git(['commit', '-F', commitName, '--author=' + signoff],nil, cdoCommits in FDebugOpts, gitPath );
          UpdateRef(gitPath);
        end;

        // Add submodule changes to commit.
        //
        hasSubmoduleCommit := false;
        for modCommit in SubmoduleCommits do
          if modCommit.Value.IsSubmodule then
          begin
            Git(['add', '--', modCommit.Key],nil, cdoFileadd in FDebugOpts);
            hasSubmoduleCommit := true;
          end;

        // Then commit everything
        //
        if hasSubmoduleCommit or (mainModuleRefs.Count > 0) then
        begin
          WriteCommitComment(commitName, Comments, mainModuleRefs);

          Git(['commit', '-F', commitName, '--author=' + signoff],nil, cdoCommits in FDebugOpts);

          UpdateRef(FOutputDir);
        end;
        sysutils.DeleteFile(commitName);

      finally
        ReleaseCheckOutInfo(choutinf);
      end;

      if not Prompt(pmCheckin) then
        raise Exception.Create('User Aborted');
    end;
    if (FDebugOpts * [cdoCommits, cdoFileadd, cdoDetail ]) = [] then
      WriteLn('.');
    WriteLn('Started: '+FormatDateTime('ddmmm hh:nn', FStartTime));
    WriteLn('Finished: '+FormatDateTime('ddmmm hh:nn', Now));
    procTime := MilliSecondsBetween(Now, FStartTime)- FPromptMSecs;
    procTime := procTime div (1000);
    prcSecs  := procTime mod 60;
    procTime := procTime div 60;
    prcMins  := procTime mod 60;
    procHrs := procTime div 60;
    WriteLn(Format('Processing Time: %d hr%s %d min%s %d sec%s for %d commit%s',
      [procHrs, Esses(procHrs), prcMins, Esses(prcMins), prcSecs, Esses(prcSecs), totalCount, Esses(totalCount) ]));
    GitAllProjects(['repack'], 'Repack: %s', true);
    GitAllProjects(['prune-packed'], 'Prune: %s', true);
    //
    if FGarbageCollect then
    begin
      if Prompt(pmGarbage) then
      begin
        GitAllProjects(['gc'],'Garbage Collect:%s', true);
        WriteLn('Finished GC: '+FormatDateTime('ddmmm hh:nn', Now));
      end;
    end;

    MergeAll;

    if PushAtEnd then
      PushAll;

  finally
    Comments.Free;
    extlist.Free;
    (*commitid.Free; *)
    SubmoduleCommits.Free;
    mainModuleRefs.Free;
  end;
end;

// Merge checkout
procedure TTCCollator.MergeAll;
begin
  if FBranch <> '' then
  begin
    GitAllProjects(['checkout',FBranch], 'Checkout: %s', true, nil, cdoMerge in FDebugOpts);

    GitAllProjects(['merge',TCTag], 'Merge: %s to '+FBranch, true, nil, cdoMerge in FDebugOpts);
  end;
end;

// Push changes
procedure TTCCollator.PushAll;
var
  pushBranch : String;
begin
  if FBranch = '' then
    pushBranch := 'master'
  else
    pushBranch := FBranch;
  WriteLn('Pushing to server');
  // First all the other projects
  GitAllProjects(['push', 'server', pushBranch], 'Push: %s', true, nil, cdoPush in FDebugOpts, false);
  // then the main
  WriteLn('Pushing Main project');
  Git(['push', 'server', pushBranch], nil, cdoPush in FDebugOpts);
end;


function TTCCollator.getFolderInfo(ParentID: cardinal; const FolderName: String): TFolderInfo;
var
  Folder: TPair<cardinal, TFolderInfo>;
begin
  result := nil;
  for Folder in FFolders do
    if (Folder.Value.ParentID = ParentID) and (CompareText(Folder.Value.FolderName, FolderName) = 0) then
    begin
      result := Folder.Value;
      break;
    end;
end;

type
TFolderLoadData = record
  FilesList : TFilesList;
  FolderInfo : TFolderInfo
end;
PFolderLoadData = ^TFolderLoadData;

function LoadFilesFolderList(Data: Pointer; Name, LocalPath, LockedBy: String;
  ID, ParentID, AncestorID: Cardinal; Modified, Timestamp, CompressedSize,
  RevisionCount, ShareCount, Status: integer;
  IsVirtual, Frozen: Boolean): Boolean;
var
  pfd: PFolderLoadData;
  finfo: TFileInfo;
begin
  pfd := PFolderLoadData(Data);
  finfo := TFileInfo.Create;
  finfo.Filename := Name;
  finfo.ItemID := ID;
  finfo.ParentID := ParentID;
  if ParentId = pfd^.FolderInfo.FolderID then
    finfo.Folder := pfd^.FolderInfo;
  pfd^.FilesList.Add(finfo);
  result := true;
end;

function TTCCollator.getFileInfoForPath(const Filename: string; addMissing : boolean = false): TFileInfo;
var
  foundFolder : boolean;
  function FindFile(parentID : cardinal; const filepart : string) : TFileInfo;
  var
    curFile: TFileInfo;
  begin
    result := nil;
    for curFile in FFiles do
    begin
      if (curFile.ParentID = parentID) then
      begin
        foundFolder := true;
        If (CompareText(curFile.Filename, filepart) = 0) then
        begin
          result := curFile;
          break;
        end;
      end;
    end;
  end;
var
  dirpart, filepart, curdir: String;
  dirs: TStrings;
  curParent: Cardinal;
  curFolder: TFolderInfo;
  enumData : TFolderLoadData;
begin
  foundFolder := false;
  result := nil;
  curFolder := nil;
  filepart := ExtractFileName(Filename);
  dirpart := ExtractFileDir(Filename);
  dirs := TStringList.Create;
  try
    while dirpart <> '' do
    begin
      dirs.Insert(0, ExtractFileName(dirpart));
      dirpart := ExtractFileDir(dirpart);
    end;
    curParent := FRootID;
    for curdir in dirs do
    begin
      curFolder := getFolderInfo(curParent, curdir);
      if not assigned(curFolder) then
        exit; // not there.  TODO Pass this info back.

      curParent := curFolder.FolderID;
    end;
    result := FindFile(curParent, filePart);

    if not assigned(result) and addmissing and not foundFolder and assigned(curFolder) then
    begin
      enumData.FilesList := FFiles;
      enumData.FolderInfo := curFolder;
      VcsErrCvt(VcsEnumFiles(curParent, LoadFilesFolderList, @enumData, false));
      result := FindFile(curParent, filePart);
    end;

  finally
    dirs.Free;
  end;

end;

{$IFDEF FEAT_UPLOAD}
procedure TTCCollator.Upload;
  function GetSingle(outval: TStrings): string;
  var
    res: String;
  begin
    result := '';
    for res in outval do
      if res <> '' then
      begin
        result := res;
        break;
      end;
  end;

var
  gitout, files, messages: TStringList;
  tagrev, ancestor, curRef, lastRef, mainext, curFile, lastfile: String;
  idx, foundsign: integer;
  fileinfs: array of TFileInfo;
  curInfo: TFileInfo;
  mainBranch : String;
  (*RevisionID: Cardinal;
  CheckoutInfo: PCheckoutInfo;
  filePath, basepath : String;
  *)
begin
  // Roll back
  if not HasTCRef then
  begin
    Writeln('Missing GIT reference :' + TCTag);
    exit;
  end;

  gitout := TStringList.Create;
  try
    // Get the head.
    Git(['rev-list', TCTag], gitout);
    tagrev := GetSingle(gitout);
    if tagrev = '' then
    begin
      Writeln('Missing GIT reference :' + TCTag);
      exit;
    end;
    if FBranch = '' then
      mainBranch := 'master'
    else
      mainBranch := FBranch;


    gitout.Clear;
    // Now the common ancestor
    Git(['merge-base', TCTag, mainBranch], gitout);
    ancestor := GetSingle(gitout);
    // We want the 'master' to be a direct descendent of TCTag.
    if (ancestor <> tagrev) then
    begin
      Writeln(mainBranch+' is not an a descendent of ' + TCTag +
          ' please merge or rebase so that it is.');
      exit;
    end;

    Git(['checkout', TCTag]);

    // Generate a list of items from master, stopping at TCTag.
    Git(['rev-list', '--reverse', mainBranch, '^' + TCTag], gitout);

    lastRef := tagrev;
    messages := nil;
    files := TStringList.Create;
    try
      messages := TStringList.Create;

      // now go through each one and check it in.
      for curRef in gitout do
      begin
        files.Clear;
        // Find files changed between two revisions.
        Git(['diff', '--name-only', curRef, '^' + lastRef], files);

        // Change all the files to the parent/main associated file
        if files.Count > 0 then
        begin
          for idx := 0 to files.Count - 1 do
          begin
            if VcsGetFileGroupExt(IncludeTrailingPathDelimiter(FOutputDir)
                + files[idx], mainext) = Err_OK then
              files[idx] := ChangeFileExt(files[idx], '.' + mainext);
          end;
          // Get Unique list of files checked in.
          files.Sort;
          lastfile := files[files.Count - 1];
          for idx := files.Count - 2 downto 0 do
          begin
            curFile := files[idx];
            if curFile = lastfile then
              files.Delete(idx)
            else
              lastfile := curFile;
          end;

          // Find the fileinfo for each file.
          setlength(fileinfs, files.Count);
          for idx := 0 to files.Count - 1 do
          begin
            curFile := files[idx];
            curInfo := getFileInfoForPath(curFile);
            if not assigned(curInfo) then
            begin
              // TODO Create a place-holder
              // Also add all the directories that will be required.
            end;
            fileinfs[idx] := curInfo;
          end;

          // Get comment for GIT commit
          Git(['cat-file', '-p', curRef], messages);
          // Remove header bit.
          while messages.Count > 0 do
          begin
            if messages[0] <> '' then
              messages.Delete(0)
            else
              break;
          end;
          messages.Delete(0);

          foundsign := -1;
          // Then remove the signed-off-by message
          for idx := 0 to messages.Count - 1 do
            if StartsText(messages[idx], 'signed-off-by') then
            begin
              foundsign := idx;
              break;
            end;
          if foundsign >= 0 then
            for idx := messages.Count - 1 downto foundsign do
              messages.Delete(idx);

          Writeln('Using Commit Message:');
          Writeln(messages.Text);

          // Checkout the file in TC
          for curInfo in fileinfs do
          begin
            if not assigned(curInfo) then
            begin
              Writeln('TODO: Add file')

            end
            else
            begin
              // Find the fileid
              Writeln('TODO: Checkout file: ' + curInfo.Filename);

              (* Lock the file
                ClearCheckoutInfo(CheckoutInfo);

                CheckoutInfo.Lock := True;
                CheckoutInfo.Overwrite := true;
                CheckoutInfo.Flags := co_LeaveWorkfileWritable {or co_IgnoreLocked};
                basepath := GetPathToRoot(curInfo.ParentID);
                filepath := AnsiString(IncludeTrailingPathDelimiter(FOutputDir)
                  + basepath);
                StrCopy(CheckoutInfo.LocalPath, PAnsiChar(filepath));
                VcsErrCvt(VcsCheckOutFileEx( curinfo.ItemID, revisionID, CheckoutInfo,curInfo.Filename ));
              *)
            end;
          end;

          // Now get the files from git.
          Git(['checkout', curRef]);

          // Now Check-in the files
          for curInfo in fileinfs do
          begin
            Writeln('TODO: Checkin file: ' + curInfo.Filename);
            (*
            // When adding
            VcsErrCvt(VcsCheckInFileEx(FProjID, curInfo.ParentID, FileID, RevisionID, curInfo.FileName));
            // Checkin existing
            VcsErrCvt(VcsCheckInFileEx(0,0, FileID, RevisionID, curInfo.FileName));
            *)
          end;

          // Now the tricky bit - update git - need to change the comment so that it contains the new versions
        end;

        lastRef := curRef;
      end;
    finally
      files.Free;
      messages.Free;
    end;

  finally
    gitout.Free;
  end;
end;
{$ENDIF}

function TTCCollator.Prompt(pm: TPromptMode): Boolean;
var
  response: String;
  promptStart : TDateTime;
const
  CMsg: array [ low(TPromptMode) .. high(TPromptMode)] of string =
    ('Create GIT Repo', 'Process File', 'Commit Changes', 'Next Checkin',
    'Finish', 'Update Ref', 'Garbage Collect', 'Merge to Branch',
    'Push Changes');
begin
  result := true;
  if (pm in FPromptMode) then
  begin
    promptStart := Now;
    repeat
      Write(CMsg[pm] + ': Continue [y]es [n]o [a]ll [i]gnore all prompts? ');
      ReadLn(response);
      if response = 'y' then
        break
      else if response = 'n' then
      begin
        result := false;
        break;
      end
      else if response = 'a' then
      begin
        Exclude(FPromptMode, pm);
        break;
      end
      else if response = 'i' then
      begin
        FPromptMode := [];
        break;
      end;
    until false;
    Inc(FPromptMSecs, MilliSecondsBetween(Now, promptStart));
  end;
end;

type
  TPathToFind = record
    Path: string;
    IDFound: Cardinal;
  end;

  PPathToFind = ^TPathToFind;

function FindPath(Data: Pointer; Name, TCPath, LocalFolder: String;
  ID, ParentID: Cardinal; FolderCount, FileCount: integer): Boolean;
var
  pptf: PPathToFind;
begin
  result := true;
  pptf := PPathToFind(Data);
  if CompareText(pptf.Path, Name) = 0 then
  begin
    pptf.IDFound := ID;
    result := false;
  end;
end;

function TTCCollator.FindObjectID(root: Cardinal; Path: String): Cardinal;

var
  idx, last: integer;
  ptf: TPathToFind;

begin
  result := root;
  last := 1;
  if not IsPathDelimiter(Path, Length(Path)) then
    Path := IncludeTrailingPathDelimiter(Path);
  for idx := 1 to Length(Path) do
  begin
    if IsPathDelimiter(Path, idx) then
    begin
      ptf.Path := Copy(Path, last, idx - last);
      if length(ptf.path) > 0 then
      begin
        ptf.IDFound := 0;
        VcsErrCvt(VcsEnumFolders(result, FindPath, @ptf, false), Path );

        last := idx + 1;
        if ptf.IDFound > 0 then
          result := ptf.IDFound
        else
          raise Exception.CreateFmt('Unable to find ''%s''', [ptf.Path]);
      end;
    end;
  end;

end;

function LoadFilesList(Data: Pointer; Name, LocalPath, LockedBy: String;
  ID, ParentID, AncestorID: Cardinal; Modified, Timestamp, CompressedSize,
  RevisionCount, ShareCount, Status: integer;
  IsVirtual, Frozen: Boolean): Boolean;
var
  pfl: PFilesList;
  finfo: TFileInfo;
begin
  pfl := PFilesList(Data);
  finfo := TFileInfo.Create;
  finfo.Filename := Name;
  finfo.ItemID := ID;
  finfo.ParentID := ParentID;
  pfl^.Add(finfo);
  result := true;
end;

type
  TLoadRevisionInfo = record
    vl: TRevisionList;
    pfi: TFileInfo;
  end;

  PLoadRevisionInfo = ^TLoadRevisionInfo;

function LoadRevisionsList(Data: Pointer; Name, Author, Comments,
  LockedBy: String; ID, ParentID: Cardinal; Modified, Timestamp,
  CompressedSize, OriginalSize, CRC, VerCount,
  PromoCount: integer): Boolean;
var
  plri: PLoadRevisionInfo;
  vinfo: TRevisionInfo;
begin
  plri := PLoadRevisionInfo(Data);
  vinfo := TRevisionInfo.Create;
  vinfo.Required := true;
  vinfo.FileInf := plri.pfi;
  vinfo.Date := FileDateToDateTime(Timestamp);
  vinfo.SortDate := vinfo.Date;
  vinfo.RevisionID := ID;
  vinfo.RevisionName := Name;
  vinfo.ParentID := ParentID;
  vinfo.Author := Author;
  vinfo.Comments := Comments;
  plri.vl.Add(vinfo);
  result := true;
end;

procedure TTCCollator.wTag(NewVal: string);
begin
  FTag := sysutils.StringReplace(sysutils.StringReplace(NewVal, '/', '.',
      [rfReplaceAll]), '\', '.', [rfReplaceAll]);
end;

procedure TTCCollator.wBranch(NewVal: String);
begin
  if newVal = '-' then
    FBRanch := ''
  else
    FBranch := sysutils.StringReplace(sysutils.StringReplace(NewVal, '/', '.',
      [rfReplaceAll]), '\', '.', [rfReplaceAll]);
end;

function TTCCollator.TCTag: string;
begin
  if FTag = '' then
    result := 'imports/tc'
  else
    result := 'imports/tc.' + FTag;
end;

function TTCCollator.TCTagOld: string;
begin
  if FTag = '' then
    result := 'remotes/tc'
  else
    result := 'remotes/tc.' + FTag;
end;

function WhiteTill(const strVal: String; tillidx: integer): Boolean;
var
  idy: integer;
begin
  result := true;
  for idy := 1 to tillidx - 1 do
    if not CharInSet(strVal[idy], [' ', #9]) then
    begin
      result := false;
      break;
    end;
end;

procedure TTCCollator.Prune;
var
  submodule : TPair<String, TSubmoduleInf>;
  smoddir  : string;
  FileInf : TFileInfo;
  revInf  : TRevisionInfo;
begin
  if FOutputDir <> '' then
  begin
    PruneDir(FOutputDir);
    if Assigned(FSubmoduleMaps) and (FSubmoduleMaps.Count > 0) then
      for submodule in FSubmoduleMaps do
      begin
        if submodule.Value.IsSubmodule then
          // It's a proper submodule
          smoddir := IncludeTrailingPathDelimiter(FOutputDir) + submodule.Key
        else
        begin
          // It's an extracted module
          smoddir := submodule.Value.Path;
          if (smoddir <> '') and (smoddir[1] = '.') then
            smoddir := IncludeTrailingPathDelimiter(FOutputDir) + smoddir;
          // Relative
        end;

        // Prune the submodule/extracted module
        if DirHasGit(smoddir) then
          PruneDir(smoddir);
      end;
  end;
  if not FIncludeBranches then
  begin
    for FileInf in FFiles do
      for revInf in FileInf.Revisions do
      begin
        if IsBranchRevision(revInf.RevisionName) then
          revInf.Required := false;
      end;
  end;
end;

procedure TTCCollator.PruneDir( const Path : String);
var
  gitout : TStrings;
  insection : boolean;
  curline, foundRev : String;
  fileid : Cardinal;
  startRev, idx, linelen : integer;
  ch : char;
  FileInf : TFileInfo;
  revInf  : TRevisionInfo;
  srchRev : boolean;
  idf, lastProg, totalProg: integer;
begin
  gitout := TStringList.Create;
  try
    // Dump full log of tag
    if HasTCRef(Path, false) then
      Git(['log', TCTag ], gitout, cdoPruneLog in FDebugOpts, Path)
    else if HasTCRef(Path, true) then
      Git(['log', TCTagOld ], gitout, cdoPruneLog in FDebugOpts, Path)
    else
      Git(['log', 'HEAD' ], gitout, cdoPruneLog in FDebugOpts, Path);


    inSection := false;
    lastProg := -1;
    totalProg := gitout.Count -1;

    Writeln('Pruning committed revisions for: '+Path);
    for idf := 0 to gitout.Count-1 do
    begin
      curLine := gitout[idf];
      WritePercent(idf, totalProg, lastProg);
      if not insection then
      begin
        idx := PosEx(CRevBegin, curline, 1);
        if (idx > 0) and WhiteTill(curline, idx) then
          insection := true; // start of revision block
      end
      else
      begin
        idx := PosEx(CRevEnd, curline);
        if (idx > 0) and WhiteTill(curline, idx) then
          insection := false // end of revision block
        else
        begin
          // Proper work - parse the revisions.
          linelen := Length(Curline);

          // skip spaces
          idx := 1;
          while (idx <= linelen) and CharInSet(curline[idx], [' ',#9]) do
            inc(idx);

          // Parse fileid till 'v'
          fileid := 0;
          while (idx <= linelen) do
          begin
            ch := curline[idx];
            case ch of
            'v':
              begin
                inc(idx);
                break;
              end;
            '0'..'9': fileid := (fileid*10)+ord(ch)-ord('0');
            end;
            inc(idx);
          end;
          StartRev := idx;
          // find :
          while (idx <= linelen) and (Curline[idx] <>  ':') do
            inc(idx);

          foundRev := Copy(curline,startRev, idx-startrev);
          // While this seems a wasteful way of looking things up,
          // it's really quite quick relative to disk-access.
          for FileInf in FFiles do
            if FileInf.ItemID = fileid then
            begin
              srchRev := false;
              // Prune the revisions earlier than the matching
              for revInf in FileInf.Revisions do
              begin
                if not revInf.Required then
                  break;
                if not srchRev and (revInf.RevisionName = foundRev) then
                  srchRev := true;
                if srchRev then
                  revInf.Required := false;
              end;
              break;
            end;
        end;
      end;
    end;
    Writeln('.');

  finally
    gitout.free;
  end;
end;

function CompareDates(lhs, rhs: TDateTime): integer;
begin
  if lhs < rhs then
    result := -1
  else if lhs = rhs then
    result := 0
  else
    result := 1;
end;

procedure WritePercent(curcount, totalCount: longint; var lastProg: integer);
var
  curProg: integer;
begin
  if TotalCount = 0 then
    lastprog := 0
  else
  begin
    curProg := 20 * curcount div totalCount;
    if curProg > lastProg then
    begin
      lastProg := curProg;
      Write(Format('.%d', [curProg * 5]));
    end;
  end;
end;

function TTCCollator.CheckDates: Boolean;
var
  idx, lastProg, totalProg, daysbtwn: integer;
  curFile: TFileInfo;
  lrev, rev: TRevisionInfo;
begin
  Write('Checking dates: 0');

  lastProg := 0;
  totalProg := FFiles.Count - 1;
  result := true;

  for idx := 0 to totalProg do
  begin
    curFile := FFiles[idx];
    lrev := nil;
    // Revisions in order from newest to oldest
    for rev in curFile.Revisions do
    begin
      if rev.required then
      begin
        if assigned(lrev) and (rev.Date > lrev.Date) then
        begin
          Writeln;
          Writeln('File: ' + curFile.Folder.TCPath + '/' + curFile.Filename);
          Writeln('Revision: ' + lrev.RevisionName + ' has date ' + FormatDateTime
              ('dd/mm/yyyy hh:nn', lrev.Date));
          Writeln('Revision: ' + rev.RevisionName + ' has date ' + FormatDateTime
              ('dd/mm/yyyy hh:nn', rev.Date));
          daysbtwn := DaysBetween(rev.Date, lrev.Date);
          if daysbtwn > 365 then
          begin
            rev.SortDate := lrev.Date-1;
          end;
          result := false;
        end;
        lrev := rev;
      end;
    end;

    WritePercent(idx, totalProg, lastProg);
  end;
  Writeln('.');

end;
{$IFDEF GROUP_DEPENDS}

function TTCCollator.CheckGroupDependencies: Boolean;
  procedure UpdateOrder(Start: integer = 0);
  var
    idx: integer;
  begin
    for idx := Start to FCheckins.Count - 1 do
    begin
      with FCheckins[idx] do
      begin
        (*
        if (Order >= 0) and (Order <> idx) then
          Write(Format('(%d->%d)', [Order, idx])); *)
        Order := idx;
      end;
    end;
  end;
{$IFDEF MRG_DEBUG1}
  procedure DumpOrder;
    procedure DumpGroup(group : TCheckinGroup; withFileVersions : boolean = true);
    var
      idx : integer;
      rev : TRevisionInfo;
      depGroup : TCheckinGroup;
    begin
      Write(IntToStr(group.Order)+' :'+FormatDateTime('dd/mm/yyyy',Group.LabelDate));
      idx := PosEx(#13,group.Comments);
      if idx = 0 then
        idx := length(group.Comments)+1;
      WriteLn(': '+Copy(group.Comments,1,idx-1));
      if withFileVersions then
      begin
        for rev in group.Revisions do
          Writeln('  '+ rev.RevisionName +': '+rev.FileInf.Filename);

        Write('Pre-depends:');
        for depGroup in group.PreDepends do
          Write(' '+IntToStr(depGroup.Order));
        Writeln('.');
        Write('Post-depends:');
        for depGroup in group.PostDepends do
          Write(' '+IntToStr(depGroup.Order));
        Writeln('.');
      end;
    end;
  var
    Group : TCheckinGroup;
  begin
    WriteLn;
    for group in FCheckins  do
    begin
      DumpGroup(group);
    end;
  end;
{$ENDIF}
  function CheckPreDepends(checkin: TCheckinGroup;
    var Target: integer): integer;
  var
    idx: integer;
    myOrder, checkOrder: integer;
  begin
    result := 0;
    myOrder := checkin.Order;
    Target := -1;
    if assigned(checkin.PreDepends) then
      for idx := 0 to checkin.PreDepends.Count - 1 do
      begin
        checkOrder := checkin.PreDepends[idx].Order;
        if checkOrder > myOrder then
        begin
          result := 1;
          if (Target = -1) or (checkOrder < Target) then
            Target := checkOrder;
        end;
      end;
  end;

  function CheckPostDepends(checkin: TCheckinGroup;
    var Target: integer): integer;
  var
    idx: integer;
    myOrder, checkOrder: integer;
  begin

    result := 0;
    myOrder := checkin.Order;
    Target := -1;
    if assigned(checkin.PostDepends) then
      for idx := 0 to checkin.PostDepends.Count - 1 do
      begin
        checkOrder := checkin.PostDepends[idx].Order;
        if checkOrder < myOrder then
        begin
          result := -1;
          if checkOrder > Target then
            Target := checkOrder;
        end;
      end;
  end;

var
  rept, curPos, newPos, totalCount, lastProg: integer;
  changedall, changed: Boolean;
begin
  //
  System.Writeln('Checking dependencies');
  System.Write('PreDepends: 0');
  UpdateOrder;
{$IFDEF MRG_DEBUG1}
  DumpOrder;
{$ENDIF}
  totalCount := FCheckins.Count - 1;

  changedall := false;
  for rept := 0 to 100 do
  begin
    lastProg := 0;
    changed := false;
    curPos := totalCount;
    while curPos >= 0 do
    begin
      WritePercent(totalCount - curPos, totalCount, lastProg);
      if CheckPreDepends(FCheckins[curPos], newPos) <> 0 then
      begin
        Write('.|');
{$IFDEF MRG_DEBUG1}
        System.Writeln;
        System.Writeln(Format('Moving %d -> %d', [curPos, newPos]));
        System.Writeln(FCheckins[curPos].Describe);
        System.Writeln(FCheckins[newPos - 1].Describe);
{$ENDIF}
        FCheckins.Move(curPos, newPos);

        UpdateOrder; //(curPos);
        changed := true;
      end;
      Dec(curPos)
    end;
    System.Writeln('.');
    lastProg := 0;
    System.Write('PostDepends: 0');
    for curPos := 0 to totalCount do
    begin
      WritePercent(curPos, totalCount, lastProg);
      if CheckPostDepends(FCheckins[curPos], newPos) <> 0 then
      begin
        Write('.|');
{$IFDEF MRG_DEBUG1}
        System.Writeln;
        System.Writeln(Format('Moving %d -> %d', [newPos, curPos]));

        System.Writeln(FCheckins[newPos].Describe);
        System.Writeln(FCheckins[curPos].Describe);
{$ENDIF}
        FCheckins.Move(newPos, curPos);
        UpdateOrder; //(newPos);
        changed := true;
      end;
    end;
    System.Writeln('.');
    changedall := changedall or changed;
    if not changed then
      break;
  end;
  UpdateOrder;
{$IFDEF MRG_DEBUG1}
  DumpOrder;
{$ENDIF}
  result := true;
  if changed then
  begin
    lastProg := 0;
    System.Writeln('.');
    System.Write('Confirming dependencies: 0');
    for curPos := 0 to totalCount do
    begin
      WritePercent(curPos, totalCount, lastProg);
      if CheckPostDepends(FCheckins[curPos], newPos) <> 0 then
      begin
        System.Writeln;
        System.Writeln('Commit out of order:');
        with FCheckins[curPos] do
        begin
          System.Writeln(' Author: ' + Author);
          System.Writeln(' Date: ' + FormatDateTime('dd/mm/yyyy', LabelDate));
          System.Writeln(' Comments: ' + Comments);
        end;
        result := false;
      end;
    end;
  end;

end;

function ValAt(const revVal: string; dotIdx: integer): integer;
var
  idx: integer;
  ch: Char;
begin
  result := 0;
  inc(dotIdx);
  for idx := dotIdx to Length(revVal) do
  begin
    result := result * 10;
    ch := revVal[Idx];
    case ch of
      '0':
        ;
      '1' .. '9':
        result := result + ord(ch) - ord('0');
    else
      break;
    end;

  end;
end;

function LastDot(const revVal: String; startIdx: integer = 0): integer;
begin
  if (startIdx <= 0) or (startIdx > Length(revVal)) then
    result := Length(revVal)
  else
    result := startIdx;
  while result >= 1 do
  begin
    case revVal[result] of
      '.':
        break;
    end;
    Dec(result);
  end;
end;

function MatchesStart(const revVal1, revVal2: String; len: integer): Boolean;
var
  len1, idx: integer;
begin

  len1 := Length(revVal1);

  if (len > len1) or (len > length(revVal2)) then
    result := false
  else
  begin
    result := true;
    for idx := 1 to len do
      if revVal1[idx] <> revVal2[idx] then
      begin
        result := false;
        break;
      end;
  end;
end;

{: Return True if parentRev is the immediate parent of ChildRev
  ie IsParentOf('1.9','1.8') = true
     IsParentOf('1.5.1.0','1.5') = true
     IsParentOf('1.5.2.0','1.5') = true
}
function IsParentOf(childRev, parentRev: String): Boolean;
var
  lastDotChild, lastDotParent, childVal, parentVal: integer;
begin
  lastDotChild := LastDot(childRev);
  lastDotParent := LastDot(parentRev);

  if lastDotChild = lastDotParent then
  begin
    if not MatchesStart(childRev, parentRev, lastDotChild) then
      result := false
    else
    begin
      childVal := ValAt(childRev, lastDotChild);
      parentVal := ValAt(parentRev, lastDotParent);
      result := parentVal + 1 = childVal;
    end;
  end
  else if Length(parentRev) > Length(childRev) then
    result := false
  else if MatchesStart(parentRev, childRev, Length(parentRev)) then
    result := ValAt(childRev, LastDot(childRev)) = 0
  else
    result := false;
end;

function IsBranchRevision( revision : String) : boolean;
var
  idx : integer;
  ch : CHar;
begin
  idx := 0;
  for ch in revision do
    if ch = '.' then
      inc(idx);
  result :=  idx > 1;
end;

function TTCCollator.LoadGroupDependencies: Boolean;
var
  idx, idr, findRev, lastProg, totalProg: integer;
  curFile: TFileInfo;
  rev, nrev: TRevisionInfo;
  isBranchRev, curisBranchRev : Boolean;
begin
  Write('Load Dependencies: 0');

  lastProg := 0;
  totalProg := FFiles.Count - 1;
  result := true;

  for idx := totalProg downto 0 do
  begin
    curFile := FFiles[idx];
    // Go through Revisions in order from oldest to newest
    WritePercent(totalProg - idx, totalProg, lastProg);

    for idr := curFile.Revisions.Count - 1 downto 0 do
    begin
      rev := curFile.Revisions[idr];
      curisBranchRev := IsBranchRevision(rev.RevisionName);
      if not rev.Required then
        continue;
      if not assigned(rev.AssignedGroup.PreDepends) then
        rev.AssignedGroup.PreDepends := TCheckinList.Create;

      if not assigned(rev.AssignedGroup.PostDepends) then
        rev.AssignedGroup.PostDepends := TCheckinList.Create;

      // Assign Pre depends
      for findRev := idr + 1 to curFile.Revisions.Count - 1 do
      begin
        nrev := curFile.Revisions[findRev];
        isbranchRev := IsBranchRevision(nrev.RevisionName);
        if (nrev.Required)  and (rev.AssignedGroup <> nrev.AssignedGroup) then
        begin
          if (not curIsBranchRev and not isBranchRev) or
            IsParentOf(rev.RevisionName, nrev.RevisionName) then
            rev.AssignedGroup.PreDepends.Add(nrev.AssignedGroup);
        end;
        if not isBranchRev then
          break; // Break after the first non-branch revision
      end;

      // Assign post depends.
      for findRev := idr - 1 downto 0 do
      begin
        nrev := curFile.Revisions[findRev];
        isbranchRev := IsBranchRevision(nrev.RevisionName);
        if (nrev.Required) and (rev.AssignedGroup <> nrev.AssignedGroup) then
        begin
          if (not curisBranchRev and not isBranchRev)
             or IsParentOf(rev.RevisionName, nrev.RevisionName) then
            rev.AssignedGroup.PostDepends.Add(nrev.AssignedGroup);
        end;

        if not IsBranchRev then // Break after the first non-branch revision
          break;
      end;
    end;
  end;
  Writeln('.');

end;
{$ENDIF}

procedure TTCCollator.Load;
var
  idx: integer;
  loadRi: TLoadRevisionInfo;
  lastProg, totalProg: integer;

  curFile: TFileInfo;
  rev: TRevisionInfo;
begin
  FPromptMSecs := 0;
  FStartTime := now;

  if FRootID = 0 then
    raise Exception.Create('Root Project/Folder has not been selected');

  LoadFiles;

  AssignFolders;

  Write('Revisions: ');
  lastProg := -1;
  totalProg := FFiles.Count - 1;
  for idx := 0 to FFiles.Count - 1 do
  begin
    WritePercent(idx, totalProg, lastProg);
    curFile := FFiles[idx];
    if CurFile.Required then
    begin
      loadRi.vl := curFile.Revisions;
      loadRi.pfi := curFile;
      VcsErrCvt(VcsEnumRevisions(curFile.ItemID, LoadRevisionsList, @loadRi));
    end;

  end;
  Writeln('.');

  Prune;

  CheckDates;

  Write('Copy required revisions');
  for curFile in FFiles do
    for rev in curFile.Revisions do
      if rev.Required then
        FRevisions.Add(rev);
  Writeln('.');

  if FRevisions.Count = 0 then
  begin
    Writeln('No revisions: Abort');
    exit;
  end;

  Writeln('Sorting..');
  // Custom sort
  FRevisions.Sort(TDelegatedComparer<TRevisionInfo>.Create(
      // Using an anonymous function.
      function(const lhs, rhs: TRevisionInfo): integer
      begin // Use normal date for grouping purpose
        result := CompareDates(lhs.Date, rhs.Date);
      end));

  CollateCheckins;

  LoadGroupDependencies;

  CheckGroupDependencies;
end;

procedure TTCCollator.LoadAuthors;
var
  f: TextFile;
  fname, authmap: String;
  idx: integer;
begin
  GetAuthorsFilename(fname);
  WriteLn('Load Authors: '+fname);
  if FileExists(fname) then
  begin
    AssignFile(f, fname);
    FileMode := 1;
    Reset(f);
    try
      while not EOF(f) do
      begin
        ReadLn(f, authmap);
        idx := Pos('=', authmap);
        if idx > 1 then
        begin
          FSignOff.Add(Copy(authmap, 1, idx - 1), Copy(authmap, idx + 1,
              Length(authmap)));
        end;
      end;
    finally
      CloseFile(f);
    end;
  end;
end;

procedure TTCCollator.SaveAuthors;
var
  f: TextFile;
  fname: string;
  dictenum: TDictionary<String, string>.TPairEnumerator;
begin
  GetAuthorsFilename(fname);
  WriteLn('Store Authors: '+fname);
  AssignFile(f, fname);
  Rewrite(f);
  try
    dictenum := FSignOff.GetEnumerator;
    while dictenum.MoveNext do
      Writeln(f, dictenum.Current.Key + '=' + dictenum.Current.Value);
  finally
    CloseFile(f);
  end;

end;

function IntGetFoldersList(Data: Pointer; Name, TCPath, LocalFolder: String;
  ID, ParentID: Cardinal; FolderCount, FileCount: integer): Boolean;
var
  Folder: TFolderInfo;
  fl: TFolderList;
begin
  Folder := TFolderInfo.Create;
  Folder.FolderName := Name;
  Folder.TCPath := TCPath;
  Folder.FolderID := ID;
  Folder.ParentID := ParentID;
  fl := TFolderList(Data);
  fl.Add(ID, Folder);
  result := true;
end;

procedure TTCCollator.LoadFolders;
var
  foldInf : TPair<Cardinal, TFolderInfo>;
  chkPath, mapPath : String;
begin
  if FRootID = 0 then
    raise Exception.Create('Root Project/Folder has not been selected');
  VcsErrCvt(VcsEnumFolders(FRootID, IntGetFoldersList, FFolders, true));

  for foldInf in FFolders do
  begin
    chkPath := GetPathToRoot(foldinf.Value.FolderID, false);
    mappath := MappedPath(chkPath);
    if mappath = '-' then
    begin
      // Mark the folder as not being needed
      foldInf.Value.Required := false;
      DebugLn(cdoMaps, 'Not Required: '+ chkPath);
    end
    // Just for debuuging.
    else if cdoMaps in FDebugOpts then
    begin
      if mappath <> chkPath then
        DebugLn(cdoMaps, 'Remapped: '+ ChkPath + ' -> ' + mappath);
    end;
  end;
end;


procedure TTCCollator.AssignFolders;
var
  fileinfo: TFileInfo;
begin
  if FFolders.Count = 0 then
    LoadFolders;

  for fileinfo in FFiles do
  begin
    fileinfo.Folder := FFolders.Items[fileinfo.ParentID];
    if fileinfo.Required then
      fileinfo.Required := FileInfo.Folder.Required;
  end;
end;


function TTCCollator.GetPathToRoot(FolderID: Cardinal; mapped :boolean = true): string;
var
  folderInf: TFolderInfo;
begin
  result := '';
  while FolderID <> FRootID do
  begin
    folderInf := FFolders.Items[FolderID];
    if not assigned(folderInf) then
      break
    else
    begin
      result := folderInf.FolderName + '\' + result;
      FolderID := folderInf.ParentID;
    end;
  end;
  if mapped then
    Result := MappedPath(result);
end;

function TTCCollator.GetSignOff(const Author: String): String;
var
  user, email, value : string;
  userobj : TTCUser;
begin
  if not FSignOff.TryGetValue(Author, result) then
    result := '';
  if result = '' then
  begin
    user := Author;
    email := '';
    if FUseTrackUsers and not assigned(FUsers) then
    begin
      FUsers := TTCUserList.Create;
      FUsers.LoadUsers(FConnection, FUsername, FPassword);
    end;
    for userobj in FUsers do
    begin
      if CompareText(userObj.UserName, Author) = 0 then
      begin
        if userObj.FullName <> '' then
          user := userObj.FullName;
        email := userObj.Email;
        break;
      end;
    end;

    repeat
      Writeln('Sign-off required for username ' + Author + ': ');
      Write(format('Full name (%s):', [user]));
      ReadLn(value);
      if Value <> '' then
        user := Value;
      Write('Email'+IfThen(email= '',':',format(' (%s):',[email])));
      ReadLn(Value);
      if Value <> '' then
        email := Value;
    until (user <> '') and (email <> '');
    result := Trim(user) + ' <' + Trim(email) + '>';
    FSignOff.Add(Author, result);
    SaveAuthors;
  end;
end;

procedure TTCCollator.GitAllProjects(cmd: array of string; logName: string; onlyMarked: Boolean; return: TStrings = nil; echo: Boolean = true; MainProject: Boolean = true);
var
  submodule : TPair<String, TSubmoduleInf>;
  smoddir, curval : string;
  retList : TStrings;
begin
  if DirHasGit then
  begin
    retList := nil;
    try
      // Perform command on main project.
      if MainProject then
      Begin
        WriteLn(Format(logName, [FOutputDir]));
        Git(cmd, return, echo);
      End;

      if Assigned(FSubmoduleMaps) and (FSubmoduleMaps.Count > 0) then
      begin
        if assigned(return) then
          retList := TStringList.Create;
        for submodule in FSubmoduleMaps do
        begin
          if onlyMarked and (FSubmoduleMod.IndexOf(submodule.Value.Path) < 0) then
            continue; // not modified

          if submodule.value.IsSubmodule then
            // It's a proper submodule
            smoddir := IncludeTrailingPathDelimiter(FOutputDir)+ submodule.key
          else
          begin
            // It's an extracted module
            smoddir := submodule.Value.Path;
            if (smoddir <> '') and (smoddir[1] = '.') then
                smoddir := IncludeTrailingPathDelimiter(FOutputDir)+ smoddir; // Relative
          end;
          if DirHasGit(Smoddir)  then
          begin
            WriteLn(Format(logName, [FOutputDir]));
            // Perform command on submodules/extracted modules
            Git(cmd, retList, echo, Smoddir);

            // append results
            if assigned(Return) and assigned(RetList) then
              for curVal in retList do
                Return.Append(curVal);
          end;
        end;
      end;
    finally
      retList.free;
    end;
  end;
end;

function TTCCollator.CheckModifiedRepositories : boolean;
var
  submodule : TPair<String, TSubmoduleInf>;
  smoddir : string;
begin

  if not DirHasGit then
    result := false
  else if CheckChanged then
    result := true
  else
  begin
    if not Assigned(FSubmoduleMaps) then
      result := true
    else
    begin
      result := false;
      for submodule in FSubmoduleMaps do
      begin

        if submodule.value.IsSubmodule then
          // It's a proper submodule
          smoddir := IncludeTrailingPathDelimiter(FOutputDir)+ submodule.key
        else
        begin
          // It's an extracted module
          smoddir := submodule.Value.Path;
          if (smoddir <> '') and (smoddir[1] = '.') then
            smoddir := IncludeTrailingPathDelimiter(FOutputDir)+ smoddir; // Relative
        end;
        if DirHasGit(Smoddir)  and CheckChanged(smoddir) then
        begin
          result := true;
          break;
        end
      end;
    end;
  end;
end;

function TTCCollator.CheckChanged(DirName : String = #0): Boolean;
var
  res: TStringList;
  line: String;
begin
  if DirName = #0 then
    DirName := FOutputDir;
  result := false;
  res := TStringList.Create;
  try
    // Might not have any files.
    if FileExists(IncludeTrailingPathDelimiter(DirName)+'.git\refs\heads\master') then
    begin
      // Check for changes to files in the repository
      Git(['diff', '--name-only', 'HEAD'], res, false, DirName);
      for line in TStrings(res) do
      begin
        if Trim(line) <> '' then
        begin
          result := true;
          break;
        end;
      end;
      if result then
      begin
        WriteLn('Git Repository: '+DirName);
        Writeln('Uncommitted changes in the following files: ');
        Writeln(res.Text);
      end;
    end;
    // Check for files not checked in.
    Git(['ls-files', '-o', '--exclude-standard'], res, false, DirName);
    for line in TStrings(res) do
    begin
      if Trim(line) <> '' then
      begin
        if not result then
          WriteLn('Git Repository: '+DirName);
        result := true;
        Writeln('The following files are not in the repository: ');
        Writeln(res.Text);
        break;
      end;
    end;
  finally
    res.Free;
  end;
end;

procedure TTCCollator.GetAuthorsFilename(var fname: string);
var
  home, homedrive : String;
begin
  home := sysutils.GetEnvironmentVariable('HOME');
  if home = '' then
  begin
    homedrive := sysutils.GetEnvironmentVariable('HOMEDRIVE');
    home := sysutils.GetEnvironmentVariable('HOMEPATH');
    if (homedrive = '') or (home = '') then
      home := FOutputDir
    else
      home := homedrive+home;
  end;
  ForceDirectories(home);

  fname := IncludeTrailingPathDelimiter(home) + '.authors';
end;

procedure TTCCollator.CollateCheckins;
const
  CToSecs = (24 * 60 * 60);
var
  curCheckin: TCheckinGroup;
{$IFDEF OLD_GROUP}
  curComments: TStringList;

  procedure MergeComments(const comment: String);
  var
    val: String;
    found: Boolean;
    trmComment: String;
  begin
    trmComment := Trim(comment);
    if Length(trmComment) > 2 then
    begin
      found := false;
      for val in curComments do
      begin
        if CompareText(val, comment) = 0 then
        begin
          found := true;
          break;
        end;
      end;
      if not found then
        curComments.Add(comment);
    end;
  end;
{$ENDIF}
  procedure NextCheckin(verinfo: TRevisionInfo);
  begin
    if assigned(curCheckin) then
    begin
{$IFDEF OLD_GROUP}
      if curComments.Count > 0 then
      begin
        curCheckin.Comments := curComments.Text;
        curComments.Clear;
      end
      else
        curCheckin.Comments := '-';
{$ENDIF}
      if curCheckin.Revisions.Count > 0 then
      begin
        FCheckins.Add(curCheckin)
      end
      else
        curCheckin.Free;
      curCheckin := nil;
    end;
    if assigned(verinfo) then
    begin
      curCheckin := TCheckinGroup.Create;
      curCheckin.Author := verinfo.Author;
      curCheckin.SortDate := verinfo.SortDate; // Don't use massively future dates for sorting
      curCheckin.LabelDate := verinfo.Date;
{$IFNDEF OLD_GROUP}
      curCheckin.Comments := verinfo.Comments;
{$ENDIF}
    end;
  end;
  function CheckDateOK(Date: TDateTime): Boolean;
  var
    secs: Int64;
  begin
    secs := SecondsBetween(Date, curCheckin.LabelDate);
    result := (-FDiffSecs <= secs) and (secs <= FDiffSecs);
  end;
{$IFDEF OLD_GROUP}
  procedure CheckCurrent(verinfo: TRevisionInfo);
  begin
    if not assigned(curCheckin) then
      NextCheckin(verinfo)
    else if (verinfo.Author <> curCheckin.Author) then
      NextCheckin(verinfo)
    else if not CheckDateOK(verinfo.Date) then
      NextCheckin(verinfo);

    MergeComments(verinfo.Comments);
    curCheckin.Revisions.Add(verinfo);
    // Pointer to parent for dependency
    verinfo.AssignedGroup := curCheckin;
  end;
{$ENDIF}

var
  idx, idgr: integer;
  lastProg, totalProg: integer;
  curRevision, existRev: TRevisionInfo;
  found: Boolean;
begin
  curCheckin := nil;
{$IFDEF OLD_GROUP}
  curComments := TStringList.Create;
  try
{$ENDIF}
    Write('Grouping.. 0');

    lastProg := 0;
    totalProg := FRevisions.Count - 1;
    for idx := 0 to FRevisions.Count - 1 do
    begin
{$IFDEF OLD_GROUP}
      CheckCurrent(FRevisions[idx]);
{$ELSE}
      curRevision := FRevisions[idx];
      if not assigned(curRevision.AssignedGroup) then
      begin
        NextCheckin(curRevision);
        // Add to the group
        curCheckin.Revisions.Add(curRevision);
        // Pointer to parent for dependency
        curRevision.AssignedGroup := curCheckin;

        for idgr := idx + 1 to FRevisions.Count - 1 do
        begin
          curRevision := FRevisions[idgr];
          if not assigned(curRevision.AssignedGroup) then
          begin
            // once the date is too different - then stop.
            if not CheckDateOK(curRevision.Date) then
              break;
            if (*(Length(curRevision.Comments) > 5) and *)
              (CompareText(curRevision.Author, curCheckin.Author) = 0) and
              (CompareText(curRevision.Comments, curCheckin.Comments) = 0) then
            begin
              // Check the file isn't there already.
              found := false;
              for existRev in curCheckin.Revisions do
                if existRev.FileInf.ItemID = curRevision.FileInf.ItemID then
                begin
                  found := true;
                  break;
                end;
              if not found then
              begin
                // Group this
                curCheckin.Revisions.Add(curRevision);
                // Pointer to parent for dependency
                curRevision.AssignedGroup := curCheckin;
              end;

            end;
          end;
        end;
      end;
{$ENDIF}
      WritePercent(idx, totalProg, lastProg);
    end;
    NextCheckin(nil);
    Writeln('.');

    Write('Sorting Groups');
    FCheckins.Sort(TDelegatedComparer<TCheckinGroup>.Create(
        // Using an anonymous function.
        function(const lhs, rhs: TCheckinGroup)
          : integer begin if lhs.SortDate < rhs.SortDate then result :=
          -1 else if lhs.SortDate = rhs.SortDate then result :=
          0 else result := 1; end));
    Writeln('.');
{$IFDEF OLD_GROUP}
  finally
    curComments.Free;
  end;
{$ENDIF}
end;

function IntGetProjectList(Data: Pointer; Name: String; ID: Cardinal): Boolean;
var
  list: TProjectList;
begin
  result := true;
  list := TProjectList(Data);
  if assigned(list) then
    list.Add(TPair<String, Cardinal>.Create(Name, ID));
end;

function TTCCollator.rProjCount: integer;
begin
  if not assigned(FProjects) then
  begin
    FProjects := TProjectList.Create;
    VcsErrCvt(VcsEnumProjects(IntGetProjectList, FProjects));
  end;
  result := FProjects.Count;
end;

procedure TTCCollator.DebugLn( opt : TCollateDebugOpts; Const LogVal : String);
begin
  if opt in FDebugOpts then
    Writeln(logVal);
end;

function TTCCollator.rDebug(opt : TCollateDebugOpts): boolean;
begin
  result := opt in FDebugOpts;
end;

procedure TTCCollator.wDebug(opt : TCollateDebugOpts; NewVal: boolean);
begin
  if newVal then
    Include(FDebugOpts, opt)
  else
    exclude(FDebugOpts, opt);
end;

procedure TTCCollator.SetDebug( const strVal : String);
var
  opts : TStringList;
  opt : String;
  idx : TCollateDebugOpts;
begin
  opts := TStringList.Create;
  try
    opts.CommaText := strVal;
    for opt in opts do
      for idx := low(TCollateDebugOpts) to high(TCollateDebugOpts) do
        if CompareText(CDebugOpts[idx],strVal) =0 then
        begin
          Include(FDebugOpts, idx);
          break;
        end;

  finally
    opts.free;
  end;
end;

function TTCCollator.rProject(idx: integer): String;
begin
  if (idx >= 0) and (idx < rProjCount) then
    result := FProjects.Items[idx].Key;
end;

procedure TTCCollator.SetProject(const ProjName: String);
var
  idx: integer;
begin
  wActiveProj(-1);
  for idx := 0 to rProjCount - 1 do // Call getter to load project list.
  begin
    if CompareText(FProjects.Items[idx].Key, ProjName) = 0 then
    begin
      // Found matching project.
      wActiveProj(idx);
      break;
    end;
  end;
end;

procedure TTCCollator.SetRootFolder(const FolderName: String);
begin
  FRootID := FindObjectID(FProjID, FolderName);
end;

procedure TTCCollator.wActiveProj(NewVal: integer);
var
  newRootID: Cardinal;
begin
  if NewVal <> FProjIdx then
  begin
    if (NewVal < 0) or (NewVal >= rProjCount) then
    begin
      FProjIdx := -1;
      FProjID := 0;
    end
    else
    begin
      FProjIdx := NewVal;
      newRootID := FProjects.Items[FProjIdx].Value;
      if newRootID <> FProjID then
      begin
        FProjID := newRootID;
        FRootID := newRootID;
      end;
    end;
  end;
end;

type
TVersionLabelItem = class
public
  LabelType : Integer;
  Name : String;
  LabelID : Cardinal;
end;
TVersionLabelList = TObjectList<TVersionLabelItem>;

function ListLabels( Data: Pointer; LabelType: Integer; Name, Comments: String; ID: Cardinal; Timestamp: Integer ): Boolean;
var
  labelList : TVersionLabelList;
  LabelItem : TVersionLabelItem;
begin
  labelList := TVersionLabelList(Data);
  labelItem := TVersionLabelItem.Create;
  labelItem.LabelType := LabelType;
  labelItem.Name := Name;
  labelItem.LabelID  := id;
  labelList.Add(labelItem);
  result := true;
end;

procedure ClearCheckinInfo(chininf : PCheckinInfo; comments : String = '');
begin
  StrCopy( chininf.Comments , PAnsiChar(AnsiString(comments)));
  StrCopy(chininf.Extra,'');
  chininf.VersionID := 0;
  chininf.Flags := 0;
end;

type
  TCheckinFileInfo = class(TObject)
  public
    FullPath : String;
    checkout : boolean;
    fileInf  : TFileInfo;
  end;


procedure TTCCollator.ApplyPatch(const PatchFile, patchLabel: String; checkinOnly : boolean);
type
  TStatParseState = (spsInit, spsNumAdd, spsAddSpace, spsNumDel, spsDelSpace);
var
  gitRet, newList, comment, rawFileList, folderSplit : TStrings;
  fileList : TObjectList<TCheckinFileInfo>;
  filepath, line, lockedby, filename : String;
  idx, curpos : integer;
  folderId, fileID : Cardinal;
  Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status: Integer;
  IsVirtual, Frozen: Boolean;
  curFile, chkFile : TCheckinFileInfo;
  foundInf : TFileInfo;
  coRevisionID: Cardinal;
  choutinf: PCheckOutInfo;
  chininf : PCheckInInfo;
  hasBad, hasClean, founddup : boolean;
  PF : TextFile;
  foldInf : TFolderInfo;
  groupExt, labelMsg : String;
  versionList : TVersionLabelList;
  versionItem : TVersionLabelItem;
  versionLabelID : Cardinal;
  parseState : TStatParseState;
  fullPatchPath : String;
  tcpath : String;
  localFolder: string;
  ignFoldCount: Integer;
  ignFileCount: Integer;
  folderPath: String;
begin
  if not FileExists(PatchFile) then
  begin
    Writeln('Patch File doesn''t exist: '+PatchFile);
    exit;
  end;
  // Need to get the full path.
  fullPatchPath := ExpandFilename(patchFile);

  newList := nil;
  fileLIst := nil;
  comment := nil;
  rawFileList := nil;
  folderSplit := nil;
  gitRet := TStringList.Create;
  try
    versionLabelID := 0;
    if PatchLabel <> '' then
    begin
      versionList := TObjectList<TVersionLabelItem>.Create;
      VcsEnumLabels( FProjID,0,lt_VersionLabel, ListLabels, Pointer(versionList));
      for versionItem in versionList do
        if CompareText(versionItem.Name, PatchLabel) = 0 then
          versionLabelID := versionItem.LabelID;
      if versionLabelID = 0 then
        WriteLn(Format('Version label ''%s'' not found',  [PatchLabel]));
    end;

    FileList := TObjectList<TCheckinFileInfo>.Create(true);
    Writeln('Loading Folder list');
    LoadFolders;
    WriteLn('Parsing Patch:');
    newList := TStringList.Create;
    Git(['apply','--numstat', '--ignore-whitespace', '--', fullPatchPath],gitRet,false);

    rawFileList := TSTringList.Create;

    hasBad := false;
    for line in gitRet do
    begin
      begin
        curpos := 0;
        parseState := spsInit;
        for idx := 1 to length(line) do
        begin
          case line[idx] of
            '0'..'9':
              case ParseState of
                spsInit: ParseState := spsNumAdd;
                spsNumAdd: ;
                spsAddSpace: ParseState := spsNumDel;
                spsNumDel: ;
                spsDelSpace:
                  begin
                    curPos := idx;
                    break;
                  end;
              end;
            ' ',#9:
              case ParseState of
                spsInit:   break;
                spsNumAdd: ParseState := spsAddSpace;
                spsAddSpace: ;
                spsNumDel: ParseState := spsDelSpace;
                spsDelSpace: ;
              end;
          else
            if ParseState = spsDelSpace then
              curPos := idx;
            break;
          end;
        end;

        if curPos > 0 then
        begin
          filepath := ReplaceStr(Trim(Copy(Line,curPos,length(line))), '/','\');

          fileID := 0;
          rawFileList.add(filepath);
          VcsErrCvt(VcsGetFileGroupExt( IncludeTrailingPathDelimiter(FOutputDir)+filepath, groupExt ));
          filepath := ChangeFileExt(filepath,groupext);

          foundInf := getFileInfoForPath(filepath, true);

          if not assigned(foundInf) then
          begin
            // Check if this group is already handled
            founddup := false;
            for filename in newList do
              if filename = filePath then
              begin
                founddup := true;
                break;
              end;
            if founddup then
              continue; // Already handled
            // Add to list.
            WriteLn(format('%s is new and will need to be added', [filepath]));
            newlist.Add(filepath);
          end
          else
          begin
            // Check if this group of files is already handled.
            founddup := false;
            for chkFile in fileList do
              if chkFile.fileInf.ItemID = foundinf.ItemID then
              begin
                founddup := true;
                break;
              end;
            if founddup then
              continue; // Already handled

            // Check the current status of the file.

            VcsErrCvt(VcsFileStatus(foundinf.ParentID, foundinf.ItemID, filepath,lockedBy,
              Modified, Timestamp, CompressedSize, RevisionCount, ShareCount, Status,
              IsVirtual, Frozen));

            curFile := TCheckinFileInfo.Create;
            try
              curFile.checkout := true;
              curFile.fileInf := foundinf;
              // Filepath is modified by VcsFileStatus to be the full path
              curFile.FullPath := filepath;

              if Status and (VCS_STATUS_OUTOTHER  or VCS_STATUS_OUTBYUSER)  <> 0 then
              begin
                Writeln(format('%s is already locked by %s',[filepath, lockedBy]));
                hasBad := true;
              end
              else if not checkinOnly then
              begin
                if (Status and VCS_STATUS_MODIFIED) <> 0 then
                begin
                  Writeln(format('%s has been modified',[filepath]));
                  hasBad := true;
                end
                else if (Status and VCS_STATUS_CHECKEDOUT) <> 0 then
                begin
                  if (Status and VCS_STATUS_OUTOFDATE) <> 0 then
                  begin
                    WRiteln(format('%s is checked out to current path but is out of date',[filepath]));
                    hasBad := true;
                  end;
                  curFile.checkout := false;
                end;
              end;
              fileList.Add(curFile);
              curFile := nil;
            finally
              FreeAndNil(curfile);
            end;
          end;

        end;
      end;
    end;
    if hasBad then
      exit;
    if not checkinOnly then
    begin
      // Checkout all the files.
      choutinf := InitializeCheckOutInfo;
      try
        for curfile in filelist do
        begin
          if curfile.checkout then
          begin
            // Check out a file from TC

            ClearCheckoutInfo(choutinf);

            choutinf.Lock := true;
            choutinf.Overwrite := true;
            choutinf.Flags := co_LeaveWorkfileWritable;

            VcsErrCvt(VcsCheckOutFileEx(curFile.fileinf.ItemID, coRevisionID, choutinf, curFile.FullPath));
          end;
        end;
      finally
        ReleaseCheckOutInfo(choutinf);
      end;
      WRiteLn('Applying Patch');
      // Apply the patch
      Git(['apply', '--ignore-whitespace', '--reject', '--', fullPatchPath],gitRet,false);
      for line in gitRet do
      begin
        if StartsText('failed:', line) then
          hasBad := true
        else if StartsText('error:', line) then
          hasBad := true
        else if PosEx( 'applied cleanly', line ) >= 1 then
          hasClean := true;
      end;

      if true then// hasBad then
      begin
        for line in gitRet do
          WriteLn(line);
      end;

    end;

    comment := TStringList.Create;
    // Extract the header
    AssignFile(pf, fullPatchPath);
    Reset(pf);
    try
      while not Eof(pf) do
      begin
        ReadLn(pf, line);
        if StartsText('Subject:',line) then
        begin
          Line := Trim(copy(line,9,length(line)));
          if StartsText('[', line) then
          begin
            idx := PosEx(']',line,2);
            if idx > 0 then
              line := TrimLeft(Copy(line, idx+1, length(line)));
          end;
          Comment.Add(line);
          break;
        end;
      end;
      while not EOF(pf) do
      begin
        ReadLn(pf, line);
        if line = '---' then
          break;
        if StartsText('Signed-off-by:',TrimLeft(line)) then
        begin

          if (comment.count > 1) and (comment[comment.Count-1] = '') then
            comment.Delete(comment.count-1);
          break;
        end;
        comment.Add(line);
      end;
      if (comment.Count > 2)  and (comment[1] <> '') then
        comment.Insert(1,'');

    finally
      CloseFile(pf);
    end;
    writeln('------Modified Files-------');
    for line in rawFileList do
    begin
      writeln(line);
    end;
    labelMsg := '';
    if PatchLabel <> '' then
      labelMsg := ' to '+PatchLabel;
    if filelist.count > 0 then
    begin
      writeln(Format('------%d File Groups to commit%s-------',[filelist.count, labelMsg]));
      for curfile in filelist do
        writeln(curfile.FullPath);
    end;
    if newlist.Count > 0 then
    begin
      writeln(format('------%d File Groups to add%s-------',[newlist.count, labelMsg]));
      for filename in newList do
        writeln(filename);
    end;
    writeln('-------------');
    for line in comment do
      WriteLn(line);
    writeln('-------------');
    if versionLabelID <> 0 then
      WriteLn('Label: '+patchLabel);
    if hasBad then
      Writeln('Found errors');

    // Then check-in the changes.
    repeat
      Write(Format('Check-in changes to %d files? [y|n|u] ', [ fileList.Count + newList.Count]));
      Readln(line);
    until IndexText(line,['y','n','u']) >= 0;
    case IndexText(line,['y','n','u']) of
      0: ;
      1:
        begin
          WriteLn('Aborting');
          exit;
        end;
      2:
        begin
          WriteLn('Unlock');
          for curFile in FileLIst do
          begin
            try
              VcsErrCvt(VcsUncheckOutFile(curFile.fileInf.ItemID));
            except
              on E: Exception do
                Writeln('Uncheckout Error: '+E.message);
            end;
          end;
          exit;
        end;
    end;

    // Checkin all the files.
    chIninf := InitializeCheckInInfo;
    try
      ClearCheckInInfo(chIninf, comment.Text);
      for curfile in filelist do
      begin
        // Check in a file to TC
        if Assigned(curfile.fileInf) then
        begin
          FileId := curFile.fileinf.ItemID;

          Write('Checkin: '+ curFile.FullPath);
          VcsErrCvt(VcsCheckInFile( 0, 0, FileID, coRevisionID, '', chininf));
          if versionLabelID <> 0 then
          begin
            Write(' --> '+ patchLabel);
            VcsErrCvt(VcsAttachVersionLabel(FileID, coRevisionID,versionLabelID, true ));
          end;
          writeln('.');
        end;
      end;
       // Add all the files/folders
      for line in newList do
      begin
        filepath := ExtractFileDir(line);
        foldInf := getFolderInfo(FRootID, filepath);
        if foldInf <> nil then
          folderId := foldInf.FolderID
        else
        begin
          FolderID := 0;
          if not assigned(folderSplit) then
            folderSplit := TStringList.Create
          else
            folderSplit.Clear;

          repeat
            filename := filepath;
            // Last one gets created first.
            folderSplit.Insert(0,ExtractFileName(filename));
            filepath := ExtractFileDir(filename);
            if filename = filepath then
              break; // Didn't get anywhere - stop
            if (filepath = '') or (CompareText(FOutputDir, filepath) = 0) then
            begin
              FolderID := FRootID;
              break;
            end;
            foldInf := getFolderInfo(FRootID, filepath);
            if Assigned(FoldInf) then
            begin
              // Found one
              FolderID := FoldInf.FolderID;
              break;
            end;
          until false;

          // Construct the folders.
          for filename in folderSplit do
          begin
            if folderID = 0 then
              break;
            Write('Create Folder: '+filename);
            VcsErrCvt(VcsAddFolder(folderID{new}, folderID {original},filename,''));
            Writeln('.');
          end;
        end;
        if folderId = 0 then
           { TODO -oMRG : Create the folder }
          Writeln(format('%s : Unable to find folder for ''%s''', [line, line]))
        else
        begin
          // Check in the new file (group) to the folder
          fileId := 0;
          Write('Add: '+ curFile.FullPath);
          VcsErrCvt(VcsCheckInFile( FProjID, folderID, FileID, coRevisionID,
            IncludeTrailingPathDelimiter(FOutputDir)+line, chininf));

          // Attach the version label.
          if versionLabelID <> 0 then
          begin
            Write(' --> '+ patchLabel);
            VcsErrCvt(VcsAttachVersionLabel(FileID, coRevisionID,versionLabelID, true ));
          end;
        end;
      end;
    finally
      ReleaseCheckInInfo(chIninf);
    end;

  finally
    gitRet.Free;
    FileList.Free;
    newList.Free;
    comment.Free;
    rawFileList.Free;
    folderSplit.Free;
  end;

 end;

procedure TTCCollator.LoadFiles;
begin
  Write('Loading Files..');
  VcsErrCvt(VcsEnumFiles(FRootID, LoadFilesList, @FFiles, true));
  Writeln(IntToStr(FFiles.Count));
end;

{ TCheckinGroup }

procedure TCheckinGroup.AfterConstruction;
begin
  inherited;
  Revisions := TRevisionList.Create(false);
  Order := -1;
end;

procedure TCheckinGroup.BeforeDestruction;
begin
  Revisions.Free;
  inherited;
end;

function TCheckinGroup.Describe: string;
var
  dsc: TStrings;
  rev: TRevisionInfo;
begin
  dsc := TStringList.Create;
  try
    dsc.Add('Author: ' + Author);
    dsc.Add('Date:   ' + FormatDateTime('dd/mm/yyyy', SortDate));
    for rev in Revisions do
    begin
      dsc.Add(rev.FileInf.Filename + ': ' + rev.RevisionName);
    end;

    result := dsc.Text;

  finally
    dsc.Free;
  end;
end;

procedure TFileInfo.AfterConstruction;
begin
  inherited;
  Revisions := TRevisionList.Create(true);
  Required := true;
end;

procedure TFileInfo.BeforeDestruction;
begin
  inherited;
  Revisions.Free;
end;

{ TFolderInfo }

procedure TFolderInfo.AfterConstruction;
begin
  inherited;
  Required := true;
end;

constructor TTCUser.Create(AName, AFullName, AEmail, ALocation : String);
begin
  FUserName := AName;
  FFullName := AFullName;
  FEMail := AEmail;
  FLocation := ALocation;
  inherited Create;
end;

function EnumAddUsers( Data: Pointer; ID: Cardinal; AName, AFullName, AEMail, ALocation : String ) : Boolean;
var
  userlist : TTCUserList;
begin
  userList := TTCUserList(Data);
  if assigned(userList) then
    userList.Add(TTCUser.Create(AName, AFullName, AEMail, ALocation));
  result :=  true;
end;

procedure TTCUserList.LoadUsers(Const Connection, Name, Password : String);
begin
  try
    if TrkConnect(Connection, Name, Password) = 0 then
      TrkEnumUsers(EnumAddUsers, self);
    // Ignore any error - just won't be loaded - not the end of the world.
  except
  end;
end;

type
  TCommentType = (ctNone, ctBrace, ctBrStar);

function isStillComment(const curline: string;
  incomment: TCommentType): TCommentType;
var
  idx: integer;
begin

  for idx := 1 to Length(curline) do
    case curline[idx] of
      '{':
        if incomment = ctNone then
          incomment := ctBrace;
      '}':
        if incomment = ctBrace then
          incomment := ctNone;
      '(':
        if (incomment = ctNone) and (idx < Length(curline)) and
          (curline[idx + 1] = '*') then
          incomment := ctBrStar;
      '*':
        if (incomment = ctBrStar) and (idx < Length(curline)) and
          (curline[idx + 1] = ')') then
          incomment := ctNone;
    end;
  result := incomment;
end;


function DoStripFileMacros(Filename, outname : String; checkonly : boolean) : boolean;
var
  Inf, OutF: TextFile;
  idx, posColon, posDollar: integer;
  curline, prevline : string;
  inlog, skipline, hasPrevline, outPrevLine: Boolean;
  skipped: Boolean;
  incomment, outComment: TCommentType;
  procedure CheckLine(startIdx: integer);
  begin
    idx := startIdx;
    if idx = 0 then
      idx := 1;
    while idx < Length(curline) do
      case curline[idx] of
        ' ', #9, '#':
          inc(idx);
      else
        break;
      end;
    if (idx > startIdx) and (idx < Length(curline)) then
    begin
      if (curline[idx] = '$') then
      begin
        posDollar := PosEx('$', curline, idx + 4);
        if (posDollar > 0) then
        begin
          // It's a $ $ keyword
          skipline := true;
        end
        else
        begin
          posColon := PosEx(':', curline, 4);
          if CompareText(copy(curline, idx + 1, posColon - (idx + 1)), 'LOG')
            = 0 then
          begin
            inlog := true;
            if outPrevLine then
              outPrevLine := false; // Don't output it
          end;
        end;
      end;
    end
    else if not inlog then
    begin
      // At eol still in {
      if not hasPrevline and (startIdx > 0) then
      begin
        if isStillComment(curline, incomment) <> ctNone then
        begin
          if outPrevLine then
            Writeln(outF, prevline);
          hasPrevline := true;
          prevline := curline;
        end;
      end;
    end;
  end;

var
  foundSpecial : Boolean;
begin
  AssignFile(Inf, Filename);
  if not CheckOnly then
  begin

    AssignFile(OutF, outName);
  end;
  Reset(Inf);
  try
    if not CheckOnly then
      Rewrite(OutF);
    try
      foundSpecial := false;
      inlog := false;
      skipped := false;
      hasPrevline := false;
      outPrevLine := false;
      prevline := '';
      (* wasComment := ctNone; *)
      incomment := ctNone;
      outComment := ctNone;
      while not EOF(Inf) do
      begin
        skipline := false;
        ReadLn(Inf, curline);
        if (Length(curline) > 0) and CharInSet(curline[Length(curline)],
          [' ', #9]) then
        begin
          skipped := true;
          if not checkonly then
            curline := TrimRight(curline);
        end;

        if not foundSpecial then
        begin
          if Length(curline) > 0 then
          begin
            case curline[1] of
              '{':
                CheckLine(2);
              '}':
                ;
            else
              if not inlog and outPrevLine then
              begin
                CheckLine(0);
              end
              else if inlog then
              begin
                if incomment = ctNone then
                begin
                  inlog := false;

                  case outComment of
                    ctNone:
                      ;
                    ctBrace:
                      if not CheckOnly then
                        Writeln(OutF, '}');
                    ctBrStar:
                      if not CheckOnly then
                        Writeln(OutF, '*)');
                  end;
                  outComment := ctNone;
                end;
              end
              else if incomment <> ctNone then
                CheckLine(0)
              else if not skipped then
              begin
                // Try and short-cut
                if StartsText(curline, 'interface') then
                  foundSpecial := true;
                if StartsText(curline, 'implementation') then
                  foundSpecial := true;
              end;
            end;
          end;
          incomment := isStillComment(curline, incomment);
        end;

        if inlog or skipline then
        begin
          skipped := true
        end
        else if not hasPrevline then
        begin
          if outPrevLine then
          begin
            if not CheckOnly then
              Writeln(OutF, prevline);
            outPrevLine := false;
            outComment := isStillComment(prevline, outComment);
          end;
          if not CheckOnly then
            Writeln(OutF, curline);
          outComment := isStillComment(curline, outComment);
        end
        else
        begin
          outPrevLine := hasPrevline;
          hasPrevline := false;
        end;

        if skipped and CheckOnly then
          break;
      end;
    finally
      if not CheckOnly then
        CloseFile(OutF);
    end;

  finally
    CloseFile(Inf);
  end;
  result := skipped;
  if skipped and not CheckOnly then
end;

procedure StripFileMacros(Filename : String);
var
  outName : String;
begin

  if DoStripFileMacros(Filename, '', true) then
  begin
    outName := Filename + '.stripped';
    if DoStripFileMacros(Filename, outName, false ) then
    begin
      // writeln(Filename+': Stripped.');
      if FileExists(Filename + '.origin') then
        sysutils.DeleteFile(Filename + '.origin');
      if not sysutils.RenameFile(Filename, Filename + '.origin') then
        Writeln('Rename ' + Filename + ' to origin failed')
      else if not sysutils.RenameFile(outName, Filename) then
        Writeln('Rename of ' + outName + ' failed');
    end
    else
    begin
      sysutils.DeleteFile(outName);
    end;
  end;
end;

end.
