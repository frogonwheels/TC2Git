Team Coherence to Git export
============================

This is a basic incremental exporter from Team Coherence to GIT.
It's a CLI program (so no GUI - yes, that was deliberate).

It groups check-ins with the same commit message into single commits,
providing they fall within a defined time limit.

It supports bad dates - reordering the commits such that they
preserve an individual file's check-in order.

It supports some basic whitespace and $LOG macro stripping,
as well as for storing Delphi binary dfm files as text dfs (parameter --binary-dfm-to-text).


There is also support for the equivalent of a git pm - taking a patch
formatted with git-format-patch and applying it to a TC repository. I ended
up implementing this rather than a two-way import/export due to the different
natures of the repositories.

There is currently _no support_ for exporting labels or views, or branched
versions of a file.

There is support for splitting the project up into multiple git repositories,
as well as for splitting out submodules (handy if you have 3rd party libraries
embedded in your source tree).

It does put some extra information at the end of the commit
message to facilitate the incremental checkin.

Usage
-----

`TC2Git <username>:<password> <Project> [<path>] [<options>]`

| Option               | Description |
|----------------------|-------------|
|`/C {TCconnection}`   |Specify the TC connection to use|
|`/G <gapseconds>`     |maximum seconds for grouping a commit|
|`/O <OutputDir>`      |Export directory|
|`/X <gitpath>`        |Command path for git|
|`/P <msg>{,<msg>}`    |Prompt messages: all,none,new,file,commit,checkin,final,ref,garbage,push,merge|
|`/R <repo>`           |Upstream Repository|
|`/T <Tag>`            |External tag to use in git for the export|
|`/Z`                  |Garbage collect at end|
|`/M <branch>`         |Merge branch at end|
|`/S[+-]`              |Enable/disable signoff|
|`--apply-patch {file}`|Apply patch to project|
|`--apply-label {lab}` |Label to attach to checked in files|
|`--apply-checkin`     |Only checkin patch|
|`--push`              |Push all modified repositories at end|
|`--dump <file>`       |Dump commits to file|
|`--no-fetch`          |Don't fetch from TC|
|`--strip-macro`       |Strip RCS expansions from file|
|`-leave-binary-dfm`   |Disable DFM binary conversion to plain text|
|`/@ <configfilename>` |Filename with renames and skips|
|`--allow-orphan`      |If the tag doesn't exist create an orphan repo|
|`/D <debug>{,<debug>}`|Debug options:init,maps,detail,fileget,fileadd,commits,push,merge,prunelog|

Example:

`TC2Git username:password /C MyTCConnectionName MyTCRepositoryName "\" /O "D:\Projects\TCExport" /X "C:\Program Files (x86)\SmartGit\git\bin\git.exe"`

Configuration File format
-------------------------

|Entry           |Description|
|----------------|-----------|
|{path}={newpath}    |Export to different path (relative to the output dir)|
|{path}=-          |Skip exports|
|{path}=>{url}     |Specified path (after conversion) is a submodule url to be CREATED|
|{path}=>>{newpath}|Specified path (after conversion) is extracted independently|

Licensing and Copyright
-----------------------

Copyright: Michael Geddes 2010

This software is licensed under the [CC-GNU GPL version 2.0](http://creativecommons.org/licenses/GPL/2.0/)
or later.

The copyright does not extend to the Team Coherence API used by this unit.
