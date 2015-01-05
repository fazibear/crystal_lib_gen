@[Link("libgit2")]
lib Git2
  GIT_REPOSITORY_INIT_OPTIONS_VERSION = 1
  GIT_STATUS_OPTIONS_VERSION = 1
  enum GitOtype
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
  
  enum GitRefT
    GITREFINVALID = 0
    GITREFOID = 1
    GITREFSYMBOLIC = 2
  end
  
  enum GitBranchT
    GITBRANCHLOCAL = 1
    GITBRANCHREMOTE = 2
  end
  
  enum GitFilemodeT
    GITFILEMODENEW = 0
    GITFILEMODETREE = 16384
    GITFILEMODEBLOB = 33188
    GITFILEMODEBLOBEXECUTABLE = 33261
    GITFILEMODELINK = 40960
    GITFILEMODECOMMIT = 57344
  end
  
  enum GitSubmoduleUpdateT
    GITSUBMODULEUPDATERESET = -1
    GITSUBMODULEUPDATECHECKOUT = 1
    GITSUBMODULEUPDATEREBASE = 2
    GITSUBMODULEUPDATEMERGE = 3
    GITSUBMODULEUPDATENONE = 4
    GITSUBMODULEUPDATEDEFAULT = 0
  end
  
  enum GitSubmoduleIgnoreT
    GITSUBMODULEIGNORERESET = -1
    GITSUBMODULEIGNORENONE = 1
    GITSUBMODULEIGNOREUNTRACKED = 2
    GITSUBMODULEIGNOREDIRTY = 3
    GITSUBMODULEIGNOREALL = 4
    GITSUBMODULEIGNOREDEFAULT = 0
  end
  
  enum GitSubmoduleRecurseT
    GITSUBMODULERECURSERESET = -1
    GITSUBMODULERECURSENO = 0
    GITSUBMODULERECURSEYES = 1
    GITSUBMODULERECURSEONDEMAND = 2
  end
  
  enum GitRepositoryOpenFlagT
  end
  
  enum GitRepositoryInitFlagT
  end
  
  enum GitRepositoryInitModeT
    GITREPOSITORYINITSHAREDUMASK = 0
    GITREPOSITORYINITSHAREDGROUP = 1533
    GITREPOSITORYINITSHAREDALL = 1535
  end
  
  enum GitRepositoryStateT
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
  
  enum GitStatusT
    GITSTATUSCURRENT = 0
  end
  
  enum GitStatusShowT
    GITSTATUSSHOWINDEXANDWORKDIR = 0
    GITSTATUSSHOWINDEXONLY = 1
    GITSTATUSSHOWWORKDIRONLY = 2
  end
  
  enum GitStatusOptT
  end
  
  struct GitOdb
  end
  
  struct GitOdbBackend
  end
  
  struct GitOdbObject
  end
  
  struct GitOdbStream
  end
  
  struct GitOdbWritepack
  end
  
  struct GitRefdb
  end
  
  struct GitRefdbBackend
  end
  
  struct GitRepository
  end
  
  struct GitObject
  end
  
  struct GitRevwalk
  end
  
  struct GitTag
  end
  
  struct GitBlob
  end
  
  struct GitCommit
  end
  
  struct GitTreeEntry
  end
  
  struct GitTree
  end
  
  struct GitTreebuilder
  end
  
  struct GitIndex
  end
  
  struct GitIndexConflictIterator
  end
  
  struct GitConfig
  end
  
  struct GitConfigBackend
  end
  
  struct GitReflogEntry
  end
  
  struct GitReflog
  end
  
  struct GitNote
  end
  
  struct GitPackbuilder
  end
  
  struct GitTime
  end
  
  struct GitSignature
  end
  
  struct GitReference
  end
  
  struct GitReferenceIterator
  end
  
  struct GitMergeHead
  end
  
  struct GitMergeResult
  end
  
  struct GitStatusList
  end
  
  struct GitRefspec
  end
  
  struct GitRemote
  end
  
  struct GitPush
  end
  
  struct GitRemoteHead
  end
  
  struct GitRemoteCallbacks
  end
  
  struct GitTransferProgress
  end
  
  struct GitSubmodule
  end
  
  struct GitRepositoryInitOptions
  end
  
  struct GitStatusOptions
  end
  
  struct GitStatusEntry
  end
  
  struct GitOdb
  end
  
  struct GitOdbBackend
  end
  
  struct GitOdbObject
  end
  
  struct GitOdbStream
  end
  
  struct GitOdbWritepack
  end
  
  struct GitRefdb
  end
  
  struct GitRefdbBackend
  end
  
  struct GitRepository
  end
  
  struct GitObject
  end
  
  struct GitRevwalk
  end
  
  struct GitTag
  end
  
  struct GitBlob
  end
  
  struct GitCommit
  end
  
  struct GitTreeEntry
  end
  
  struct GitTree
  end
  
  struct GitTreebuilder
  end
  
  struct GitIndex
  end
  
  struct GitIndexConflictIterator
  end
  
  struct GitConfig
  end
  
  struct GitConfigBackend
  end
  
  struct GitReflogEntry
  end
  
  struct GitReflog
  end
  
  struct GitNote
  end
  
  struct GitPackbuilder
  end
  
  struct GitTime
    time: Int64
    offset: Int16
  end
  
  struct GitSignature
    name: UInt8*
    email: UInt8*
    when_: GitTime
  end
  
  struct GitReference
  end
  
  struct GitReferenceIterator
  end
  
  struct GitMergeHead
  end
  
  struct GitMergeResult
  end
  
  struct GitStatusList
  end
  
  struct GitRefspec
  end
  
  struct GitRemote
  end
  
  struct GitPush
  end
  
  struct GitRemoteHead
  end
  
  struct GitRemoteCallbacks
  end
  
  struct GitTransferProgress
    total_objects: UInt16
    indexed_objects: UInt16
    received_objects: UInt16
    local_objects: UInt16
    total_deltas: UInt16
    indexed_deltas: UInt16
    received_bytes: UInt32
  end
  
  struct GitSubmodule
  end
  
  struct GitRepositoryInitOptions
    version: UInt16
    flags: UInt16
    mode: UInt16
    workdir_path: UInt8*
    description: UInt8*
    template_path: UInt8*
    initial_head: UInt8*
    origin_url: UInt8*
  end
  
  struct GitStatusOptions
    version: UInt16
    show: GitStatusShowT
    flags: UInt16
    pathspec: Int32
  end
  
  struct GitStatusEntry
    status: GitStatusT
    head_to_index: Void*
    index_to_workdir: Void*
  end
  
  fun git_transfer_progress_cb(payload : Void*) : GitTransferProgress*
  fun git_repository_open(out : Void**, path : UInt8*) : Int16
  fun git_repository_wrap_odb(out : Void**, odb : GitOdb*) : Int16
  fun git_repository_discover(out : Void*, start_path : UInt8*, across_fs : Int16, ceiling_dirs : UInt8*) : Int16
  fun git_repository_open_ext(out : Void**, path : UInt8*, flags : UInt16, ceiling_dirs : UInt8*) : Int16
  fun git_repository_open_bare(out : Void**, bare_path : UInt8*) : Int16
  fun git_repository_free(repo : GitRepository*) : Void
  fun git_repository_init(out : Void**, path : UInt8*, is_bare : UInt16) : Int16
  fun git_repository_init_init_options(opts : GitRepositoryInitOptions*, version : UInt16) : Int16
  fun git_repository_init_ext(out : Void**, repo_path : UInt8*, opts : GitRepositoryInitOptions*) : Int16
  fun git_repository_head(out : Void**, repo : GitRepository*) : Int16
  fun git_repository_head_detached(repo : GitRepository*) : Int16
  fun git_repository_head_unborn(repo : GitRepository*) : Int16
  fun git_repository_is_empty(repo : GitRepository*) : Int16
  fun git_repository_path(repo : GitRepository*) : UInt8*
  fun git_repository_workdir(repo : GitRepository*) : UInt8*
  fun git_repository_set_workdir(repo : GitRepository*, workdir : UInt8*, update_gitlink : Int16) : Int16
  fun git_repository_is_bare(repo : GitRepository*) : Int16
  fun git_repository_config(out : Void**, repo : GitRepository*) : Int16
  fun git_repository_config_snapshot(out : Void**, repo : GitRepository*) : Int16
  fun git_repository_odb(out : Void**, repo : GitRepository*) : Int16
  fun git_repository_refdb(out : Void**, repo : GitRepository*) : Int16
  fun git_repository_index(out : Void**, repo : GitRepository*) : Int16
  fun git_repository_message(out : Void*, repo : GitRepository*) : Int16
  fun git_repository_message_remove(repo : GitRepository*) : Int16
  fun git_repository_state_cleanup(repo : GitRepository*) : Int16
  fun git_repository_fetchhead_foreach_cb(remote_url : UInt8*, oid : Void*, is_merge : UInt16, payload : Void*) : UInt8*
  fun git_repository_fetchhead_foreach(repo : GitRepository*, callback : Void*, payload : Void*) : Int16
  fun git_repository_mergehead_foreach_cb(payload : Void*) : Void*
  fun git_repository_mergehead_foreach(repo : GitRepository*, callback : Void*, payload : Void*) : Int16
  fun git_repository_hashfile(out : Void*, repo : GitRepository*, path : UInt8*, type : GitOtype, as_path : UInt8*) : Int16
  fun git_repository_set_head(repo : GitRepository*, refname : UInt8*, signature : GitSignature*, log_message : UInt8*) : Int16
  fun git_repository_set_head_detached(repo : GitRepository*, commitish : Void*, signature : GitSignature*, log_message : UInt8*) : Int16
  fun git_repository_detach_head(repo : GitRepository*, signature : GitSignature*, reflog_message : UInt8*) : Int16
  fun git_repository_state(repo : GitRepository*) : Int16
  fun git_repository_set_namespace(repo : GitRepository*, nmspace : UInt8*) : Int16
  fun git_repository_get_namespace(repo : GitRepository*) : UInt8*
  fun git_repository_is_shallow(repo : GitRepository*) : Int16
  fun git_status_cb(status_flags : UInt16, payload : Void*) : UInt8*
  fun git_status_init_options(opts : GitStatusOptions*, version : UInt16) : Int16
  fun git_status_foreach(repo : GitRepository*, callback : Void*, payload : Void*) : Int16
  fun git_status_foreach_ext(repo : GitRepository*, opts : GitStatusOptions*, callback : Void*, payload : Void*) : Int16
  fun git_status_file(status_flags : Void*, repo : GitRepository*, path : UInt8*) : Int16
  fun git_status_list_new(out : Void**, repo : GitRepository*, opts : GitStatusOptions*) : Int16
  fun git_status_list_entrycount(statuslist : GitStatusList*) : UInt32
  fun git_status_byindex(statuslist : GitStatusList*, idx : UInt32) : GitStatusEntry*
  fun git_status_list_free(statuslist : GitStatusList*) : Void
  fun git_status_should_ignore(ignored : Void*, repo : GitRepository*, path : UInt8*) : Int16
end
