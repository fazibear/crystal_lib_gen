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
  enum MrbFiberState
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
  
  enum MrbLexStateEnum
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
  
  enum MrbStringType
  end
  
  struct MrbIrep
  end
  
  struct RProc
  end
  
  struct REnv
  end
  
  struct MrbCallinfo
  end
  
  struct MrbContext
  end
  
  struct HeapPage
  end
  
  struct AllocaHeader
  end
  
  struct KhN2s
  end
  
  struct MrbState
  end
  
  struct MrbPool
  end
  
  struct KhMt
  end
  
  struct RClass
  end
  
  struct MrbcContext
  end
  
  struct MrbAstNode
  end
  
  struct MrbParserMessage
  end
  
  struct MrbParserHeredocInfo
  end
  
  struct MrbParserState
  end
  
  struct MrbIrep
  end
  
  struct RProc
  end
  
  struct REnv
  end
  
  struct MrbCallinfo
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
  
  struct MrbContext
    prev: MrbContext*
    stack: Void*
    stbase: Void*
    stend: Void*
    ci: MrbCallinfo*
    cibase: MrbCallinfo*
    ciend: MrbCallinfo*
    rescue_: Void**
    rsize: Int16
    ensure_: RProc**
    esize: Int16
    status: MrbFiberState
    fib: Void*
  end
  
  struct HeapPage
  end
  
  struct AllocaHeader
  end
  
  struct KhN2s
  end
  
  struct MrbState
    jmp: Void*
    allocf: Void*
    c: MrbContext*
    root_c: MrbContext*
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
  
  struct MrbPool
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
  
  struct MrbcContext
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
  
  struct MrbAstNode
    car: MrbAstNode*
    cdr: MrbAstNode*
    lineno: UInt16
    filename_index: UInt16
  end
  
  struct MrbParserMessage
    lineno: Int16
    column: Int16
    message: UInt8*
  end
  
  struct MrbParserHeredocInfo
    allow_indent: UInt8
    line_head: UInt8
    type: MrbStringType
    term: UInt8*
    term_len: Int16
    doc: MrbAstNode*
  end
  
  struct MrbParserState
    mrb: MrbState*
    pool: MrbPool*
    cells: MrbAstNode*
    s: UInt8*
    send: UInt8*
    f: Void*
    cxt: MrbcContext*
    filename: UInt8*
    lineno: Int16
    column: Int16
    lstate: MrbLexStateEnum
    lex_strterm: MrbAstNode*
    cond_stack: UInt16
    cmdarg_stack: UInt16
    paren_nest: Int16
    lpar_beg: Int16
    in_def: Int16
    in_single: Int16
    cmd_start: Int16
    locals: MrbAstNode*
    pb: MrbAstNode*
    buf: StaticArray(UInt8, 1024)
    bidx: Int16
    all_heredocs: MrbAstNode*
    heredocs_from_nextline: MrbAstNode*
    parsing_heredoc: MrbAstNode*
    lex_strterm_before_heredoc: MrbAstNode*
    heredoc_end_now: UInt8
    ylval: Void*
    nerr: UInt32
    nwarn: UInt32
    tree: MrbAstNode*
    capture_errors: Int16
    error_buffer: StaticArray(MrbParserMessage, 10)
    warn_buffer: StaticArray(MrbParserMessage, 10)
    filename_table: Void*
    filename_table_length: UInt32
    current_filename_index: Int16
    jmp: StaticArray(Int16, 37)
  end
  
  fun mrb_allocf(void : Void*, uint32 : UInt32, ud : Void*) : MrbState*
  fun mrb_func_t(mrb : MrbState*, int32 : Int32) : Int32
  fun mrb_define_class(mrbstate : MrbState*, uint8 : UInt8*, rclass : RClass*) : RClass*
  fun mrb_define_module(mrbstate : MrbState*, uint8 : UInt8*) : RClass*
  fun mrb_singleton_class(mrbstate : MrbState*, int32 : Int32) : Int32
  fun mrb_include_module(mrbstate : MrbState*, rclass : RClass*, rclass : RClass*) : Void
  fun mrb_define_method(mrbstate : MrbState*, rclass : RClass*, uint8 : UInt8*, void : Void*, uint16 : UInt16) : Void
  fun mrb_define_class_method(mrbstate : MrbState*, rclass : RClass*, uint8 : UInt8*, void : Void*, uint16 : UInt16) : Void
  fun mrb_define_singleton_method(mrbstate : MrbState*, void : Void*, uint8 : UInt8*, void : Void*, uint16 : UInt16) : Void
  fun mrb_define_module_function(mrbstate : MrbState*, rclass : RClass*, uint8 : UInt8*, void : Void*, uint16 : UInt16) : Void
  fun mrb_define_const(mrbstate : MrbState*, rclass : RClass*, name : UInt8*, int32 : Int32) : Void
  fun mrb_undef_method(mrbstate : MrbState*, rclass : RClass*, uint8 : UInt8*) : Void
  fun mrb_undef_class_method(mrbstate : MrbState*, rclass : RClass*, uint8 : UInt8*) : Void
  fun mrb_obj_new(mrb : MrbState*, c : RClass*, argc : Int16, argv : Void*) : Int32
  fun mrb_instance_new(mrb : MrbState*, cv : Int32) : Int32
  fun mrb_class_new(mrb : MrbState*, super_ : RClass*) : RClass*
  fun mrb_module_new(mrb : MrbState*) : RClass*
  fun mrb_class_defined(mrb : MrbState*, name : UInt8*) : UInt8
  fun mrb_class_get(mrb : MrbState*, name : UInt8*) : RClass*
  fun mrb_class_get_under(mrb : MrbState*, outer : RClass*, name : UInt8*) : RClass*
  fun mrb_obj_dup(mrb : MrbState*, obj : Int32) : Int32
  fun mrb_check_to_integer(mrb : MrbState*, val : Int32, method : UInt8*) : Int32
  fun mrb_obj_respond_to(mrb : MrbState*, c : RClass*, mid : Int16) : UInt8
  fun mrb_define_class_under(mrb : MrbState*, outer : RClass*, name : UInt8*, super_ : RClass*) : RClass*
  fun mrb_define_module_under(mrb : MrbState*, outer : RClass*, name : UInt8*) : RClass*
  fun mrb_get_args(mrb : MrbState*, format : UInt8*) : Int16
  fun mrb_funcall(mrbstate : MrbState*, int32 : Int32, uint8 : UInt8*, int16 : Int16) : Int32
  fun mrb_funcall_argv(mrbstate : MrbState*, int32 : Int32, int16 : Int16, int16 : Int16, void : Void*) : Int32
  fun mrb_funcall_with_block(mrbstate : MrbState*, int32 : Int32, int16 : Int16, int16 : Int16, void : Void*, int32 : Int32) : Int32
  fun mrb_intern_cstr(mrbstate : MrbState*, uint8 : UInt8*) : Int16
  fun mrb_intern(mrbstate : MrbState*, uint8 : UInt8*, uint32 : UInt32) : Int16
  fun mrb_intern_static(mrbstate : MrbState*, uint8 : UInt8*, uint32 : UInt32) : Int16
  fun mrb_intern_str(mrbstate : MrbState*, int32 : Int32) : Int16
  fun mrb_check_intern_cstr(mrbstate : MrbState*, uint8 : UInt8*) : Int32
  fun mrb_check_intern(mrbstate : MrbState*, uint8 : UInt8*, uint32 : UInt32) : Int32
  fun mrb_check_intern_str(mrbstate : MrbState*, int32 : Int32) : Int32
  fun mrb_sym2name(mrbstate : MrbState*, int16 : Int16) : UInt8*
  fun mrb_sym2name_len(mrbstate : MrbState*, int16 : Int16, void : Void*) : UInt8*
  fun mrb_sym2str(mrbstate : MrbState*, int16 : Int16) : Int32
  fun mrb_str_format(mrbstate : MrbState*, int16 : Int16, void : Void*, int32 : Int32) : Int32
  fun mrb_malloc(mrbstate : MrbState*, uint32 : UInt32) : Void*
  fun mrb_calloc(mrbstate : MrbState*, uint32 : UInt32, uint32 : UInt32) : Void*
  fun mrb_realloc(mrbstate : MrbState*, void : Void*, uint32 : UInt32) : Void*
  fun mrb_realloc_simple(mrbstate : MrbState*, void : Void*, uint32 : UInt32) : Void*
  fun mrb_malloc_simple(mrbstate : MrbState*, uint32 : UInt32) : Void*
  fun mrb_obj_alloc(mrbstate : MrbState*, int32 : Int32, rclass : RClass*) : Void*
  fun mrb_free(mrbstate : MrbState*, void : Void*) : Void
  fun mrb_str_new(mrb : MrbState*, p : UInt8*, len : UInt32) : Int32
  fun mrb_str_new_cstr(mrbstate : MrbState*, uint8 : UInt8*) : Int32
  fun mrb_str_new_static(mrb : MrbState*, p : UInt8*, len : UInt32) : Int32
  fun mrb_open() : MrbState*
  fun mrb_open_allocf(void : Void*, ud : Void*) : MrbState*
  fun mrb_close(mrbstate : MrbState*) : Void
  fun mrb_top_self(mrbstate : MrbState*) : Int32
  fun mrb_run(mrbstate : MrbState*, rproc : RProc*, int32 : Int32) : Int32
  fun mrb_context_run(mrbstate : MrbState*, rproc : RProc*, int32 : Int32, uint16 : UInt16) : Int32
  fun mrb_p(mrbstate : MrbState*, int32 : Int32) : Void
  fun mrb_obj_id(obj : Int32) : Int16
  fun mrb_obj_to_sym(mrb : MrbState*, name : Int32) : Int16
  fun mrb_obj_eq(mrbstate : MrbState*, int32 : Int32, int32 : Int32) : UInt8
  fun mrb_obj_equal(mrbstate : MrbState*, int32 : Int32, int32 : Int32) : UInt8
  fun mrb_equal(mrb : MrbState*, obj1 : Int32, obj2 : Int32) : UInt8
  fun mrb_integer(mrb : MrbState*, val : Int32) : Int32
  fun mrb_float(mrb : MrbState*, val : Int32) : Int32
  fun mrb_inspect(mrb : MrbState*, obj : Int32) : Int32
  fun mrb_eql(mrb : MrbState*, obj1 : Int32, obj2 : Int32) : UInt8
  fun mrb_garbage_collect(mrbstate : MrbState*) : Void
  fun mrb_full_gc(mrbstate : MrbState*) : Void
  fun mrb_incremental_gc(mrbstate : MrbState*) : Void
  fun mrb_gc_arena_save(mrbstate : MrbState*) : Int16
  fun mrb_gc_arena_restore(mrbstate : MrbState*, int16 : Int16) : Void
  fun mrb_gc_mark(mrbstate : MrbState*, void : Void*) : Void
  fun mrb_field_write_barrier(mrbstate : MrbState*, void : Void*, void : Void*) : Void
  fun mrb_write_barrier(mrbstate : MrbState*, void : Void*) : Void
  fun mrb_check_convert_type(mrb : MrbState*, val : Int32, type : Int32, tname : UInt8*, method : UInt8*) : Int32
  fun mrb_any_to_s(mrb : MrbState*, obj : Int32) : Int32
  fun mrb_obj_classname(mrb : MrbState*, obj : Int32) : UInt8*
  fun mrb_obj_class(mrb : MrbState*, obj : Int32) : RClass*
  fun mrb_class_path(mrb : MrbState*, c : RClass*) : Int32
  fun mrb_convert_type(mrb : MrbState*, val : Int32, type : Int32, tname : UInt8*, method : UInt8*) : Int32
  fun mrb_obj_is_kind_of(mrb : MrbState*, obj : Int32, c : RClass*) : UInt8
  fun mrb_obj_inspect(mrb : MrbState*, self_ : Int32) : Int32
  fun mrb_obj_clone(mrb : MrbState*, self_ : Int32) : Int32
  fun mrb_exc_new(mrb : MrbState*, c : RClass*, ptr : UInt8*, len : Int32) : Int32
  fun mrb_exc_raise(mrb : MrbState*, exc : Int32) : Void
  fun mrb_raise(mrb : MrbState*, c : RClass*, msg : UInt8*) : Void
  fun mrb_raisef(mrb : MrbState*, c : RClass*, fmt : UInt8*) : Void
  fun mrb_name_error(mrb : MrbState*, id : Int16, fmt : UInt8*) : Void
  fun mrb_warn(mrb : MrbState*, fmt : UInt8*) : Void
  fun mrb_bug(mrb : MrbState*, fmt : UInt8*) : Void
  fun mrb_print_backtrace(mrb : MrbState*) : Void
  fun mrb_print_error(mrb : MrbState*) : Void
  fun mrb_yield(mrb : MrbState*, b : Int32, arg : Int32) : Int32
  fun mrb_yield_argv(mrb : MrbState*, b : Int32, argc : Int16, argv : Void*) : Int32
  fun mrb_gc_protect(mrb : MrbState*, obj : Int32) : Void
  fun mrb_to_int(mrb : MrbState*, val : Int32) : Int32
  fun mrb_check_type(mrb : MrbState*, x : Int32, t : Int32) : Void
  fun mrb_define_alias(mrb : MrbState*, klass : RClass*, name1 : UInt8*, name2 : UInt8*) : Void
  fun mrb_class_name(mrb : MrbState*, klass : RClass*) : UInt8*
  fun mrb_define_global_const(mrb : MrbState*, name : UInt8*, val : Int32) : Void
  fun mrb_block_proc() : Int32
  fun mrb_attr_get(mrb : MrbState*, obj : Int32, id : Int16) : Int32
  fun mrb_respond_to(mrb : MrbState*, obj : Int32, mid : Int16) : UInt8
  fun mrb_obj_is_instance_of(mrb : MrbState*, obj : Int32, c : RClass*) : UInt8
  fun mrb_pool_open(mrbstate : MrbState*) : MrbPool*
  fun mrb_pool_close(mrbpool : MrbPool*) : Void
  fun mrb_pool_alloc(mrbpool : MrbPool*, uint32 : UInt32) : Void*
  fun mrb_pool_realloc(mrbpool : MrbPool*, void : Void*, oldlen : UInt32, newlen : UInt32) : Void*
  fun mrb_pool_can_realloc(mrbpool : MrbPool*, void : Void*, uint32 : UInt32) : UInt8
  fun mrb_alloca(mrb : MrbState*, uint32 : UInt32) : Void*
  fun mrb_class(mrb : MrbState*, v : Int32) : RClass*
  fun mrb_define_class_id(mrbstate : MrbState*, int16 : Int16, rclass : RClass*) : RClass*
  fun mrb_define_module_id(mrbstate : MrbState*, int16 : Int16) : RClass*
  fun mrb_vm_define_class(mrbstate : MrbState*, int32 : Int32, int32 : Int32, int16 : Int16) : RClass*
  fun mrb_vm_define_module(mrbstate : MrbState*, int32 : Int32, int16 : Int16) : RClass*
  fun mrb_define_method_vm(mrbstate : MrbState*, rclass : RClass*, int16 : Int16, int32 : Int32) : Void
  fun mrb_define_method_raw(mrbstate : MrbState*, rclass : RClass*, int16 : Int16, rproc : RProc*) : Void
  fun mrb_define_method_id(mrb : MrbState*, c : RClass*, mid : Int16, func : Void*, aspec : UInt16) : Void
  fun mrb_alias_method(mrb : MrbState*, c : RClass*, a : Int16, b : Int16) : Void
  fun mrb_class_outer_module(mrbstate : MrbState*, rclass : RClass*) : RClass*
  fun mrb_method_search_vm(mrbstate : MrbState*, rclass : RClass**, int16 : Int16) : RProc*
  fun mrb_method_search(mrbstate : MrbState*, rclass : RClass*, int16 : Int16) : RProc*
  fun mrb_class_real(cl : RClass*) : RClass*
  fun mrb_gc_mark_mt(mrbstate : MrbState*, rclass : RClass*) : Void
  fun mrb_gc_mark_mt_size(mrbstate : MrbState*, rclass : RClass*) : UInt32
  fun mrb_gc_free_mt(mrbstate : MrbState*, rclass : RClass*) : Void
  fun mrbc_context_new(mrb : MrbState*) : MrbcContext*
  fun mrbc_context_free(mrb : MrbState*, cxt : MrbcContext*) : Void
  fun mrbc_filename(mrb : MrbState*, c : MrbcContext*, s : UInt8*) : UInt8*
  fun mrbc_partial_hook(mrb : MrbState*, c : MrbcContext*, partial_hook : Void*, data : Void*) : Void
  fun mrb_parser_new(mrbstate : MrbState*) : MrbParserState*
  fun mrb_parser_free(mrbparserstate : MrbParserState*) : Void
  fun mrb_parser_parse(mrbparserstate : MrbParserState*, mrbccontext : MrbcContext*) : Void
  fun mrb_parser_set_filename(mrbparserstate : MrbParserState*, uint8 : UInt8*) : Void
  fun mrb_parser_get_filename(mrbparserstate : MrbParserState*, idx : UInt16) : UInt8*
  fun mrb_parse_file(mrbstate : MrbState*, void : Void*, mrbccontext : MrbcContext*) : MrbParserState*
  fun mrb_parse_string(mrbstate : MrbState*, uint8 : UInt8*, mrbccontext : MrbcContext*) : MrbParserState*
  fun mrb_parse_nstring(mrbstate : MrbState*, uint8 : UInt8*, int16 : Int16, mrbccontext : MrbcContext*) : MrbParserState*
  fun mrb_generate_code(mrbstate : MrbState*, mrbparserstate : MrbParserState*) : RProc*
  fun mrb_load_file(mrbstate : MrbState*, void : Void*) : Int32
  fun mrb_load_string(mrb : MrbState*, s : UInt8*) : Int32
  fun mrb_load_nstring(mrb : MrbState*, s : UInt8*, len : Int16) : Int32
  fun mrb_load_file_cxt(mrbstate : MrbState*, void : Void*, cxt : MrbcContext*) : Int32
  fun mrb_load_string_cxt(mrb : MrbState*, s : UInt8*, cxt : MrbcContext*) : Int32
  fun mrb_load_nstring_cxt(mrb : MrbState*, s : UInt8*, len : Int16, cxt : MrbcContext*) : Int32
end
