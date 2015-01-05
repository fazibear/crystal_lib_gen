@[Link("libgit2")]
lib Git2
  GIT_REPOSITORY_INIT_OPTIONS_VERSION = 1
  GIT_STATUS_OPTIONS_VERSION = 1
  enum Otype
    GITOBJANY = -2
    GITOBJBAD = -1
    GITOBJEXT1 = 0
    GITOBJCOMMIT = 1
    GITOBJTREE = 2
    GITOBJBLOB = 3
    GITOBJTAG = 4
    GITOBJEXT2 = 5
    GITOBJOFSDELTA = 6
    GITOBJREFDELTA = 7
  end
  
  enum RefT
    GITREFINVALID = 0
    GITREFOID = 1
    GITREFSYMBOLIC = 2
  end
  
  enum BranchT
    GITBRANCHLOCAL = 1
    GITBRANCHREMOTE = 2
  end
  
  enum FilemodeT
    GITFILEMODENEW = 0
    GITFILEMODETREE = 16384
    GITFILEMODEBLOB = 33188
    GITFILEMODEBLOBEXECUTABLE = 33261
    GITFILEMODELINK = 40960
    GITFILEMODECOMMIT = 57344
  end
  
  enum SubmoduleUpdateT
    GITSUBMODULEUPDATERESET = -1
    GITSUBMODULEUPDATECHECKOUT = 1
    GITSUBMODULEUPDATEREBASE = 2
    GITSUBMODULEUPDATEMERGE = 3
    GITSUBMODULEUPDATENONE = 4
    GITSUBMODULEUPDATEDEFAULT = 0
  end
  
  enum SubmoduleIgnoreT
    GITSUBMODULEIGNORERESET = -1
    GITSUBMODULEIGNORENONE = 1
    GITSUBMODULEIGNOREUNTRACKED = 2
    GITSUBMODULEIGNOREDIRTY = 3
    GITSUBMODULEIGNOREALL = 4
    GITSUBMODULEIGNOREDEFAULT = 0
  end
  
  enum SubmoduleRecurseT
    GITSUBMODULERECURSERESET = -1
    GITSUBMODULERECURSENO = 0
    GITSUBMODULERECURSEYES = 1
    GITSUBMODULERECURSEONDEMAND = 2
  end
  
  enum RepositoryOpenFlagT
  end
  
  enum RepositoryInitFlagT
  end
  
  enum RepositoryInitModeT
    GITREPOSITORYINITSHAREDUMASK = 0
    GITREPOSITORYINITSHAREDGROUP = 1533
    GITREPOSITORYINITSHAREDALL = 1535
  end
  
  enum RepositoryStateT
    GITREPOSITORYSTATENONE = 0
    GITREPOSITORYSTATEMERGE = 1
    GITREPOSITORYSTATEREVERT = 2
    GITREPOSITORYSTATECHERRYPICK = 3
    GITREPOSITORYSTATEBISECT = 4
    GITREPOSITORYSTATEREBASE = 5
    GITREPOSITORYSTATEREBASEINTERACTIVE = 6
    GITREPOSITORYSTATEREBASEMERGE = 7
    GITREPOSITORYSTATEAPPLYMAILBOX = 8
    GITREPOSITORYSTATEAPPLYMAILBOXORREBASE = 9
  end
  
  enum StatusT
    GITSTATUSCURRENT = 0
  end
  
  enum StatusShowT
    GITSTATUSSHOWINDEXANDWORKDIR = 0
    GITSTATUSSHOWINDEXONLY = 1
    GITSTATUSSHOWWORKDIRONLY = 2
  end
  
  enum StatusOptT
  end
  
  struct Odb
  end
  
  struct OdbBackend
  end
  
  struct OdbObject
  end
  
  struct OdbStream
  end
  
  struct OdbWritepack
  end
  
  struct Refdb
  end
  
  struct RefdbBackend
  end
  
  struct Repository
  end
  
  struct Object
  end
  
  struct Revwalk
  end
  
  struct Tag
  end
  
  struct Blob
  end
  
  struct Commit
  end
  
  struct TreeEntry
  end
  
  struct Tree
  end
  
  struct Treebuilder
  end
  
  struct Index
  end
  
  struct IndexConflictIterator
  end
  
  struct Config
  end
  
  struct ConfigBackend
  end
  
  struct ReflogEntry
  end
  
  struct Reflog
  end
  
  struct Note
  end
  
  struct Packbuilder
  end
  
  struct Time
  end
  
  struct Signature
  end
  
  struct Reference
  end
  
  struct ReferenceIterator
  end
  
  struct MergeHead
  end
  
  struct MergeResult
  end
  
  struct StatusList
  end
  
  struct Refspec
  end
  
  struct Remote
  end
  
  struct Push
  end
  
  struct RemoteHead
  end
  
  struct RemoteCallbacks
  end
  
  struct TransferProgress
  end
  
  struct Submodule
  end
  
  struct RepositoryInitOptions
  end
  
  struct StatusOptions
  end
  
  struct StatusEntry
  end
  
  struct Odb
  end
  
  struct OdbBackend
  end
  
  struct OdbObject
  end
  
  struct OdbStream
  end
  
  struct OdbWritepack
  end
  
  struct Refdb
  end
  
  struct RefdbBackend
  end
  
  struct Repository
  end
  
  struct Object
  end
  
  struct Revwalk
  end
  
  struct Tag
  end
  
  struct Blob
  end
  
  struct Commit
  end
  
  struct TreeEntry
  end
  
  struct Tree
  end
  
  struct Treebuilder
  end
  
  struct Index
  end
  
  struct IndexConflictIterator
  end
  
  struct Config
  end
  
  struct ConfigBackend
  end
  
  struct ReflogEntry
  end
  
  struct Reflog
  end
  
  struct Note
  end
  
  struct Packbuilder
  end
  
  struct Time
    time: Int64
    offset: Int16
  end
  
  struct Signature
    name: UInt8*
    email: UInt8*
    when_: Time
  end
  
  struct Reference
  end
  
  struct ReferenceIterator
  end
  
  struct MergeHead
  end
  
  struct MergeResult
  end
  
  struct StatusList
  end
  
  struct Refspec
  end
  
  struct Remote
  end
  
  struct Push
  end
  
  struct RemoteHead
  end
  
  struct RemoteCallbacks
  end
  
  struct TransferProgress
    total_objects: UInt16
    indexed_objects: UInt16
    received_objects: UInt16
    local_objects: UInt16
    total_deltas: UInt16
    indexed_deltas: UInt16
    received_bytes: UInt32
  end
  
  struct Submodule
  end
  
  struct RepositoryInitOptions
    version: UInt16
    flags: UInt16
    mode: UInt16
    workdir_path: UInt8*
    description: UInt8*
    template_path: UInt8*
    initial_head: UInt8*
    origin_url: UInt8*
  end
  
  struct StatusOptions
    version: UInt16
    show: StatusShowT
    flags: UInt16
    pathspec: Int32
  end
  
  struct StatusEntry
    status: StatusT
    head_to_index: Void*
    index_to_workdir: Void*
  end
  
  fun transfer_progress_cb = "git_transfer_progress_cb"(payload : Void*) : TransferProgress*
  fun repository_open = "git_repository_open"(out : Void**, path : UInt8*) : Int16
  fun repository_wrap_odb = "git_repository_wrap_odb"(out : Void**, odb : Odb*) : Int16
  fun repository_discover = "git_repository_discover"(out : Void*, start_path : UInt8*, across_fs : Int16, ceiling_dirs : UInt8*) : Int16
  fun repository_open_ext = "git_repository_open_ext"(out : Void**, path : UInt8*, flags : UInt16, ceiling_dirs : UInt8*) : Int16
  fun repository_open_bare = "git_repository_open_bare"(out : Void**, bare_path : UInt8*) : Int16
  fun repository_free = "git_repository_free"(repo : Repository*) : Void
  fun repository_init = "git_repository_init"(out : Void**, path : UInt8*, is_bare : UInt16) : Int16
  fun repository_init_init_options = "git_repository_init_init_options"(opts : RepositoryInitOptions*, version : UInt16) : Int16
  fun repository_init_ext = "git_repository_init_ext"(out : Void**, repo_path : UInt8*, opts : RepositoryInitOptions*) : Int16
  fun repository_head = "git_repository_head"(out : Void**, repo : Repository*) : Int16
  fun repository_head_detached = "git_repository_head_detached"(repo : Repository*) : Int16
  fun repository_head_unborn = "git_repository_head_unborn"(repo : Repository*) : Int16
  fun repository_is_empty = "git_repository_is_empty"(repo : Repository*) : Int16
  fun repository_path = "git_repository_path"(repo : Repository*) : UInt8*
  fun repository_workdir = "git_repository_workdir"(repo : Repository*) : UInt8*
  fun repository_set_workdir = "git_repository_set_workdir"(repo : Repository*, workdir : UInt8*, update_gitlink : Int16) : Int16
  fun repository_is_bare = "git_repository_is_bare"(repo : Repository*) : Int16
  fun repository_config = "git_repository_config"(out : Void**, repo : Repository*) : Int16
  fun repository_config_snapshot = "git_repository_config_snapshot"(out : Void**, repo : Repository*) : Int16
  fun repository_odb = "git_repository_odb"(out : Void**, repo : Repository*) : Int16
  fun repository_refdb = "git_repository_refdb"(out : Void**, repo : Repository*) : Int16
  fun repository_index = "git_repository_index"(out : Void**, repo : Repository*) : Int16
  fun repository_message = "git_repository_message"(out : Void*, repo : Repository*) : Int16
  fun repository_message_remove = "git_repository_message_remove"(repo : Repository*) : Int16
  fun repository_state_cleanup = "git_repository_state_cleanup"(repo : Repository*) : Int16
  fun repository_fetchhead_foreach_cb = "git_repository_fetchhead_foreach_cb"(remote_url : UInt8*, oid : Void*, is_merge : UInt16, payload : Void*) : UInt8*
  fun repository_fetchhead_foreach = "git_repository_fetchhead_foreach"(repo : Repository*, callback : Void*, payload : Void*) : Int16
  fun repository_mergehead_foreach_cb = "git_repository_mergehead_foreach_cb"(payload : Void*) : Void*
  fun repository_mergehead_foreach = "git_repository_mergehead_foreach"(repo : Repository*, callback : Void*, payload : Void*) : Int16
  fun repository_hashfile = "git_repository_hashfile"(out : Void*, repo : Repository*, path : UInt8*, type : Otype, as_path : UInt8*) : Int16
  fun repository_set_head = "git_repository_set_head"(repo : Repository*, refname : UInt8*, signature : Signature*, log_message : UInt8*) : Int16
  fun repository_set_head_detached = "git_repository_set_head_detached"(repo : Repository*, commitish : Void*, signature : Signature*, log_message : UInt8*) : Int16
  fun repository_detach_head = "git_repository_detach_head"(repo : Repository*, signature : Signature*, reflog_message : UInt8*) : Int16
  fun repository_state = "git_repository_state"(repo : Repository*) : Int16
  fun repository_set_namespace = "git_repository_set_namespace"(repo : Repository*, nmspace : UInt8*) : Int16
  fun repository_get_namespace = "git_repository_get_namespace"(repo : Repository*) : UInt8*
  fun repository_is_shallow = "git_repository_is_shallow"(repo : Repository*) : Int16
  fun status_cb = "git_status_cb"(status_flags : UInt16, payload : Void*) : UInt8*
  fun status_init_options = "git_status_init_options"(opts : StatusOptions*, version : UInt16) : Int16
  fun status_foreach = "git_status_foreach"(repo : Repository*, callback : Void*, payload : Void*) : Int16
  fun status_foreach_ext = "git_status_foreach_ext"(repo : Repository*, opts : StatusOptions*, callback : Void*, payload : Void*) : Int16
  fun status_file = "git_status_file"(status_flags : Void*, repo : Repository*, path : UInt8*) : Int16
  fun status_list_new = "git_status_list_new"(out : Void**, repo : Repository*, opts : StatusOptions*) : Int16
  fun status_list_entrycount = "git_status_list_entrycount"(statuslist : StatusList*) : UInt32
  fun status_byindex = "git_status_byindex"(statuslist : StatusList*, idx : UInt32) : StatusEntry*
  fun status_list_free = "git_status_list_free"(statuslist : StatusList*) : Void
  fun status_should_ignore = "git_status_should_ignore"(ignored : Void*, repo : Repository*, path : UInt8*) : Int16
end
