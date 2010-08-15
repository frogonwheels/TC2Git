Team Coherence to Git export
============================

This is a basic incremental exporter from Team Coherence to GIT.

It groups check-ins with the same commit message into single commits,
providing they fall within a defined time limit.

It supports bad dates - reordering the commits such that they
preserve an individual file's check-in order.

It supports some basic whitespace and $LOG macro stripping,
as well as for storing Delphi binary dfm files as text dfs.

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

Licensing and Copyright
-----------------------

Copyright: Michael Geddes 2010

This software is licensed under the [CC-GNU GPL version 2.0](http://creativecommons.org/licenses/GPL/2.0/)
or later.


The copyright does not extend to the Team Coherence API used by this unit.

