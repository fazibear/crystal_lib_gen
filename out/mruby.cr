@[Link("mruby")]
lib MRuby
  MRB_GC_ARENA_SIZE = 100
  MRUBY_COMPILE_H = 1
  STR_FUNC_PARSING = 0x01
  STR_FUNC_EXPAND = 0x02
  STR_FUNC_REGEXP = 0x04
  STR_FUNC_WORD = 0x08
  STR_FUNC_SYMBOL = 0x10
  STR_FUNC_ARRAY = 0x20
  STR_FUNC_HEREDOC = 0x40
  STR_FUNC_XQUOTE = 0x80
  MRB_PARSER_BUF_SIZE = 1024
  enum FiberState
    MRBFIBERCREATED = 0
    MRBFIBERRUNNING = 1
    MRBFIBERRESUMED = 2
    MRBFIBERTERMINATED = 3
  end
  
  enum GcState
    GCSTATENONE = 0
    GCSTATEMARK = 1
    GCSTATESWEEP = 2
  end
  
  enum CallType
    CALLPUBLIC = 0
    CALLFCALL = 1
    CALLVCALL = 2
    CALLTYPEMAX = 3
  end
  
  enum LexStateEnum
    EXPRBEG = 0
    EXPREND = 1
    EXPRENDARG = 2
    EXPRENDFN = 3
    EXPRARG = 4
    EXPRCMDARG = 5
    EXPRMID = 6
    EXPRFNAME = 7
    EXPRDOT = 8
    EXPRCLASS = 9
    EXPRVALUE = 10
    EXPRMAXSTATE = 11
  end
  
  enum StringType
  end
  
  struct Irep
  end
  
  struct RProc
  end
  
  struct REnv
  end
  
  struct Callinfo
  end
  
  struct Context
  end
  
  struct HeapPage
  end
  
  struct AllocaHeader
  end
  
  struct KhN2s
  end
  
  struct State
  end
  
  struct Pool
  end
  
  struct KhMt
  end
  
  struct RClass
  end
  
  struct CContext
  end
  
  struct AstNode
  end
  
  struct ParserMessage
  end
  
  struct ParserHeredocInfo
  end
  
  struct ParserState
  end
  
  struct Irep
  end
  
  struct RProc
  end
  
  struct REnv
  end
  
  struct Callinfo
    mid: Int16
    proc: RProc*
    stackidx: Int16
    nregs: Int16
    argc: Int16
    pc: Void*
    err: Void*
    acc: Int16
    target_class: RClass*
    ridx: Int16
    eidx: Int16
    env: REnv*
  end
  
  struct Context
    prev: Context*
    stack: Void*
    stbase: Void*
    stend: Void*
    ci: Callinfo*
    cibase: Callinfo*
    ciend: Callinfo*
    rescue_: Void**
    rsize: Int16
    ensure_: RProc**
    esize: Int16
    status: FiberState
    fib: Void*
  end
  
  struct HeapPage
  end
  
  struct AllocaHeader
  end
  
  struct KhN2s
  end
  
  struct State
    jmp: Void*
    allocf: Void*
    c: Context*
    root_c: Context*
    exc: Void*
    globals: Void*
    top_self: Void*
    object_class: RClass*
    class_class: RClass*
    module_class: RClass*
    proc_class: RClass*
    string_class: RClass*
    array_class: RClass*
    hash_class: RClass*
    float_class: RClass*
    fixnum_class: RClass*
    true_class: RClass*
    false_class: RClass*
    nil_class: RClass*
    symbol_class: RClass*
    kernel_module: RClass*
    heaps: HeapPage*
    sweeps: HeapPage*
    free_heaps: HeapPage*
    live: UInt32
    arena: Void**
    arena_capa: Int16
    arena_idx: Int16
    gc_state: GcState
    current_white_part: Int16
    gray_list: Void*
    atomic_gray_list: Void*
    gc_live_after_mark: UInt32
    gc_threshold: UInt32
    gc_interval_ratio: Int16
    gc_step_ratio: Int16
    gc_disabled: UInt8
    gc_full: UInt8
    is_generational_gc_mode: UInt8
    out_of_memory: UInt8
    majorgc_old_threshold: UInt32
    mems: AllocaHeader*
    symidx: Int16
    name2sym: KhN2s*
    e_exception_class: RClass*
    e_standard_error_class: RClass*
    ud: Void*
  end
  
  struct Pool
  end
  
  struct KhMt
  end
  
  struct RClass
    tt: Int32
    color: UInt16
    flags: UInt16
    c: RClass*
    gcnext: Void*
    iv: Void*
    mt: KhMt*
    super_: RClass*
  end
  
  struct CContext
    syms: Void*
    slen: Int16
    filename: UInt8*
    lineno: Int16
    partial_hook: Void*
    partial_data: Void*
    target_class: RClass*
    capture_errors: UInt8
    dump_result: UInt8
    no_exec: UInt8
  end
  
  struct AstNode
    car: AstNode*
    cdr: AstNode*
    lineno: UInt16
    filename_index: UInt16
  end
  
  struct ParserMessage
    lineno: Int16
    column: Int16
    message: UInt8*
  end
  
  struct ParserHeredocInfo
    allow_indent: UInt8
    line_head: UInt8
    type: StringType
    term: UInt8*
    term_len: Int16
    doc: AstNode*
  end
  
  struct ParserState
    mrb: State*
    pool: Pool*
    cells: AstNode*
    s: UInt8*
    send: UInt8*
    f: Void*
    cxt: CContext*
    filename: UInt8*
    lineno: Int16
    column: Int16
    lstate: LexStateEnum
    lex_strterm: AstNode*
    cond_stack: UInt16
    cmdarg_stack: UInt16
    paren_nest: Int16
    lpar_beg: Int16
    in_def: Int16
    in_single: Int16
    cmd_start: Int16
    locals: AstNode*
    pb: AstNode*
    buf: StaticArray(UInt8, 1024)
    bidx: Int16
    all_heredocs: AstNode*
    heredocs_from_nextline: AstNode*
    parsing_heredoc: AstNode*
    lex_strterm_before_heredoc: AstNode*
    heredoc_end_now: UInt8
    ylval: Void*
    nerr: UInt32
    nwarn: UInt32
    tree: AstNode*
    capture_errors: Int16
    error_buffer: StaticArray(ParserMessage, 10)
    warn_buffer: StaticArray(ParserMessage, 10)
    filename_table: Void*
    filename_table_length: UInt32
    current_filename_index: Int16
    jmp: StaticArray(Int16, 37)
  end
  
  fun allocf = "mrb_allocf"(void : Void*, uint32 : UInt32, ud : Void*) : State*
  fun func_t = "mrb_func_t"(state : State*, int32 : Int32) : Int32
  fun define_class = "mrb_define_class"(state : State*, uint8 : UInt8*, rclass : RClass*) : RClass*
  fun define_module = "mrb_define_module"(state : State*, uint8 : UInt8*) : RClass*
  fun singleton_class = "mrb_singleton_class"(state : State*, int32 : Int32) : Int32
  fun include_module = "mrb_include_module"(state : State*, rclass : RClass*, rclass : RClass*) : Void
  fun define_method = "mrb_define_method"(state : State*, rclass : RClass*, uint8 : UInt8*, void : Void*, uint16 : UInt16) : Void
  fun define_class_method = "mrb_define_class_method"(state : State*, rclass : RClass*, uint8 : UInt8*, void : Void*, uint16 : UInt16) : Void
  fun define_singleton_method = "mrb_define_singleton_method"(state : State*, void : Void*, uint8 : UInt8*, void : Void*, uint16 : UInt16) : Void
  fun define_module_function = "mrb_define_module_function"(state : State*, rclass : RClass*, uint8 : UInt8*, void : Void*, uint16 : UInt16) : Void
  fun define_const = "mrb_define_const"(state : State*, rclass : RClass*, name : UInt8*, int32 : Int32) : Void
  fun undef_method = "mrb_undef_method"(state : State*, rclass : RClass*, uint8 : UInt8*) : Void
  fun undef_class_method = "mrb_undef_class_method"(state : State*, rclass : RClass*, uint8 : UInt8*) : Void
  fun obj_new = "mrb_obj_new"(state : State*, c : RClass*, argc : Int16, argv : Void*) : Int32
  fun instance_new = "mrb_instance_new"(state : State*, cv : Int32) : Int32
  fun class_new = "mrb_class_new"(state : State*, super_ : RClass*) : RClass*
  fun module_new = "mrb_module_new"(state : State*) : RClass*
  fun class_defined = "mrb_class_defined"(state : State*, name : UInt8*) : UInt8
  fun class_get = "mrb_class_get"(state : State*, name : UInt8*) : RClass*
  fun class_get_under = "mrb_class_get_under"(state : State*, outer : RClass*, name : UInt8*) : RClass*
  fun obj_dup = "mrb_obj_dup"(state : State*, obj : Int32) : Int32
  fun check_to_integer = "mrb_check_to_integer"(state : State*, val : Int32, method : UInt8*) : Int32
  fun obj_respond_to = "mrb_obj_respond_to"(state : State*, c : RClass*, mid : Int16) : UInt8
  fun define_class_under = "mrb_define_class_under"(state : State*, outer : RClass*, name : UInt8*, super_ : RClass*) : RClass*
  fun define_module_under = "mrb_define_module_under"(state : State*, outer : RClass*, name : UInt8*) : RClass*
  fun get_args = "mrb_get_args"(state : State*, format : UInt8*) : Int16
  fun funcall = "mrb_funcall"(state : State*, int32 : Int32, uint8 : UInt8*, int16 : Int16) : Int32
  fun funcall_argv = "mrb_funcall_argv"(state : State*, int32 : Int32, int16 : Int16, int16 : Int16, void : Void*) : Int32
  fun funcall_with_block = "mrb_funcall_with_block"(state : State*, int32 : Int32, int16 : Int16, int16 : Int16, void : Void*, int32 : Int32) : Int32
  fun intern_cstr = "mrb_intern_cstr"(state : State*, uint8 : UInt8*) : Int16
  fun intern = "mrb_intern"(state : State*, uint8 : UInt8*, uint32 : UInt32) : Int16
  fun intern_static = "mrb_intern_static"(state : State*, uint8 : UInt8*, uint32 : UInt32) : Int16
  fun intern_str = "mrb_intern_str"(state : State*, int32 : Int32) : Int16
  fun check_intern_cstr = "mrb_check_intern_cstr"(state : State*, uint8 : UInt8*) : Int32
  fun check_intern = "mrb_check_intern"(state : State*, uint8 : UInt8*, uint32 : UInt32) : Int32
  fun check_intern_str = "mrb_check_intern_str"(state : State*, int32 : Int32) : Int32
  fun sym2name = "mrb_sym2name"(state : State*, int16 : Int16) : UInt8*
  fun sym2name_len = "mrb_sym2name_len"(state : State*, int16 : Int16, void : Void*) : UInt8*
  fun sym2str = "mrb_sym2str"(state : State*, int16 : Int16) : Int32
  fun str_format = "mrb_str_format"(state : State*, int16 : Int16, void : Void*, int32 : Int32) : Int32
  fun malloc = "mrb_malloc"(state : State*, uint32 : UInt32) : Void*
  fun calloc = "mrb_calloc"(state : State*, uint32 : UInt32, uint32 : UInt32) : Void*
  fun realloc = "mrb_realloc"(state : State*, void : Void*, uint32 : UInt32) : Void*
  fun realloc_simple = "mrb_realloc_simple"(state : State*, void : Void*, uint32 : UInt32) : Void*
  fun malloc_simple = "mrb_malloc_simple"(state : State*, uint32 : UInt32) : Void*
  fun obj_alloc = "mrb_obj_alloc"(state : State*, int32 : Int32, rclass : RClass*) : Void*
  fun free = "mrb_free"(state : State*, void : Void*) : Void
  fun str_new = "mrb_str_new"(state : State*, p : UInt8*, len : UInt32) : Int32
  fun str_new_cstr = "mrb_str_new_cstr"(state : State*, uint8 : UInt8*) : Int32
  fun str_new_static = "mrb_str_new_static"(state : State*, p : UInt8*, len : UInt32) : Int32
  fun open = "mrb_open"() : State*
  fun open_allocf = "mrb_open_allocf"(void : Void*, ud : Void*) : State*
  fun close = "mrb_close"(state : State*) : Void
  fun top_self = "mrb_top_self"(state : State*) : Int32
  fun run = "mrb_run"(state : State*, rproc : RProc*, int32 : Int32) : Int32
  fun context_run = "mrb_context_run"(state : State*, rproc : RProc*, int32 : Int32, uint16 : UInt16) : Int32
  fun p = "mrb_p"(state : State*, int32 : Int32) : Void
  fun obj_id = "mrb_obj_id"(obj : Int32) : Int16
  fun obj_to_sym = "mrb_obj_to_sym"(state : State*, name : Int32) : Int16
  fun obj_eq = "mrb_obj_eq"(state : State*, int32 : Int32, int32 : Int32) : UInt8
  fun obj_equal = "mrb_obj_equal"(state : State*, int32 : Int32, int32 : Int32) : UInt8
  fun equal = "mrb_equal"(state : State*, obj1 : Int32, obj2 : Int32) : UInt8
  fun integer = "mrb_Integer"(state : State*, val : Int32) : Int32
  fun float = "mrb_Float"(state : State*, val : Int32) : Int32
  fun inspect = "mrb_inspect"(state : State*, obj : Int32) : Int32
  fun eql = "mrb_eql"(state : State*, obj1 : Int32, obj2 : Int32) : UInt8
  fun garbage_collect = "mrb_garbage_collect"(state : State*) : Void
  fun full_gc = "mrb_full_gc"(state : State*) : Void
  fun incremental_gc = "mrb_incremental_gc"(state : State*) : Void
  fun gc_arena_save = "mrb_gc_arena_save"(state : State*) : Int16
  fun gc_arena_restore = "mrb_gc_arena_restore"(state : State*, int16 : Int16) : Void
  fun gc_mark = "mrb_gc_mark"(state : State*, void : Void*) : Void
  fun field_write_barrier = "mrb_field_write_barrier"(state : State*, void : Void*, void : Void*) : Void
  fun write_barrier = "mrb_write_barrier"(state : State*, void : Void*) : Void
  fun check_convert_type = "mrb_check_convert_type"(state : State*, val : Int32, type : Int32, tname : UInt8*, method : UInt8*) : Int32
  fun any_to_s = "mrb_any_to_s"(state : State*, obj : Int32) : Int32
  fun obj_classname = "mrb_obj_classname"(state : State*, obj : Int32) : UInt8*
  fun obj_class = "mrb_obj_class"(state : State*, obj : Int32) : RClass*
  fun class_path = "mrb_class_path"(state : State*, c : RClass*) : Int32
  fun convert_type = "mrb_convert_type"(state : State*, val : Int32, type : Int32, tname : UInt8*, method : UInt8*) : Int32
  fun obj_is_kind_of = "mrb_obj_is_kind_of"(state : State*, obj : Int32, c : RClass*) : UInt8
  fun obj_inspect = "mrb_obj_inspect"(state : State*, self_ : Int32) : Int32
  fun obj_clone = "mrb_obj_clone"(state : State*, self_ : Int32) : Int32
  fun exc_new = "mrb_exc_new"(state : State*, c : RClass*, ptr : UInt8*, len : Int32) : Int32
  fun exc_raise = "mrb_exc_raise"(state : State*, exc : Int32) : Void
  fun raise = "mrb_raise"(state : State*, c : RClass*, msg : UInt8*) : Void
  fun raisef = "mrb_raisef"(state : State*, c : RClass*, fmt : UInt8*) : Void
  fun name_error = "mrb_name_error"(state : State*, id : Int16, fmt : UInt8*) : Void
  fun warn = "mrb_warn"(state : State*, fmt : UInt8*) : Void
  fun bug = "mrb_bug"(state : State*, fmt : UInt8*) : Void
  fun print_backtrace = "mrb_print_backtrace"(state : State*) : Void
  fun print_error = "mrb_print_error"(state : State*) : Void
  fun yield_ = "mrb_yield"(state : State*, b : Int32, arg : Int32) : Int32
  fun yield_argv = "mrb_yield_argv"(state : State*, b : Int32, argc : Int16, argv : Void*) : Int32
  fun gc_protect = "mrb_gc_protect"(state : State*, obj : Int32) : Void
  fun to_int = "mrb_to_int"(state : State*, val : Int32) : Int32
  fun check_type = "mrb_check_type"(state : State*, x : Int32, t : Int32) : Void
  fun define_alias = "mrb_define_alias"(state : State*, klass : RClass*, name1 : UInt8*, name2 : UInt8*) : Void
  fun class_name = "mrb_class_name"(state : State*, klass : RClass*) : UInt8*
  fun define_global_const = "mrb_define_global_const"(state : State*, name : UInt8*, val : Int32) : Void
  fun block_proc = "mrb_block_proc"() : Int32
  fun attr_get = "mrb_attr_get"(state : State*, obj : Int32, id : Int16) : Int32
  fun respond_to = "mrb_respond_to"(state : State*, obj : Int32, mid : Int16) : UInt8
  fun obj_is_instance_of = "mrb_obj_is_instance_of"(state : State*, obj : Int32, c : RClass*) : UInt8
  fun pool_open = "mrb_pool_open"(state : State*) : Pool*
  fun pool_close = "mrb_pool_close"(pool : Pool*) : Void
  fun pool_alloc = "mrb_pool_alloc"(pool : Pool*, uint32 : UInt32) : Void*
  fun pool_realloc = "mrb_pool_realloc"(pool : Pool*, void : Void*, oldlen : UInt32, newlen : UInt32) : Void*
  fun pool_can_realloc = "mrb_pool_can_realloc"(pool : Pool*, void : Void*, uint32 : UInt32) : UInt8
  fun alloca = "mrb_alloca"(state : State*, uint32 : UInt32) : Void*
  fun class_ = "mrb_class"(state : State*, v : Int32) : RClass*
  fun define_class_id = "mrb_define_class_id"(state : State*, int16 : Int16, rclass : RClass*) : RClass*
  fun define_module_id = "mrb_define_module_id"(state : State*, int16 : Int16) : RClass*
  fun vm_define_class = "mrb_vm_define_class"(state : State*, int32 : Int32, int32 : Int32, int16 : Int16) : RClass*
  fun vm_define_module = "mrb_vm_define_module"(state : State*, int32 : Int32, int16 : Int16) : RClass*
  fun define_method_vm = "mrb_define_method_vm"(state : State*, rclass : RClass*, int16 : Int16, int32 : Int32) : Void
  fun define_method_raw = "mrb_define_method_raw"(state : State*, rclass : RClass*, int16 : Int16, rproc : RProc*) : Void
  fun define_method_id = "mrb_define_method_id"(state : State*, c : RClass*, mid : Int16, func : Void*, aspec : UInt16) : Void
  fun alias_method = "mrb_alias_method"(state : State*, c : RClass*, a : Int16, b : Int16) : Void
  fun class_outer_module = "mrb_class_outer_module"(state : State*, rclass : RClass*) : RClass*
  fun method_search_vm = "mrb_method_search_vm"(state : State*, rclass : RClass**, int16 : Int16) : RProc*
  fun method_search = "mrb_method_search"(state : State*, rclass : RClass*, int16 : Int16) : RProc*
  fun class_real = "mrb_class_real"(cl : RClass*) : RClass*
  fun gc_mark_mt = "mrb_gc_mark_mt"(state : State*, rclass : RClass*) : Void
  fun gc_mark_mt_size = "mrb_gc_mark_mt_size"(state : State*, rclass : RClass*) : UInt32
  fun gc_free_mt = "mrb_gc_free_mt"(state : State*, rclass : RClass*) : Void
  fun c_context_new = "mrbc_context_new"(state : State*) : CContext*
  fun c_context_free = "mrbc_context_free"(state : State*, cxt : CContext*) : Void
  fun c_filename = "mrbc_filename"(state : State*, c : CContext*, s : UInt8*) : UInt8*
  fun c_partial_hook = "mrbc_partial_hook"(state : State*, c : CContext*, partial_hook : Void*, data : Void*) : Void
  fun parser_new = "mrb_parser_new"(state : State*) : ParserState*
  fun parser_free = "mrb_parser_free"(parserstate : ParserState*) : Void
  fun parser_parse = "mrb_parser_parse"(parserstate : ParserState*, ccontext : CContext*) : Void
  fun parser_set_filename = "mrb_parser_set_filename"(parserstate : ParserState*, uint8 : UInt8*) : Void
  fun parser_get_filename = "mrb_parser_get_filename"(parserstate : ParserState*, idx : UInt16) : UInt8*
  fun parse_file = "mrb_parse_file"(state : State*, void : Void*, ccontext : CContext*) : ParserState*
  fun parse_string = "mrb_parse_string"(state : State*, uint8 : UInt8*, ccontext : CContext*) : ParserState*
  fun parse_nstring = "mrb_parse_nstring"(state : State*, uint8 : UInt8*, int16 : Int16, ccontext : CContext*) : ParserState*
  fun generate_code = "mrb_generate_code"(state : State*, parserstate : ParserState*) : RProc*
  fun load_file = "mrb_load_file"(state : State*, void : Void*) : Int32
  fun load_string = "mrb_load_string"(state : State*, s : UInt8*) : Int32
  fun load_nstring = "mrb_load_nstring"(state : State*, s : UInt8*, len : Int16) : Int32
  fun load_file_cxt = "mrb_load_file_cxt"(state : State*, void : Void*, cxt : CContext*) : Int32
  fun load_string_cxt = "mrb_load_string_cxt"(state : State*, s : UInt8*, cxt : CContext*) : Int32
  fun load_nstring_cxt = "mrb_load_nstring_cxt"(state : State*, s : UInt8*, len : Int16, cxt : CContext*) : Int32
end
