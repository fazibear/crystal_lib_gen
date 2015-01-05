FFIGen.generate(
  module_name: "MRuby",
  ffi_lib:     "mruby",
  headers:     %w[
                mruby.h
                mruby/class.h
                mruby/compile.h               
               ],
  cflags:      ['-I/usr/local/opt/mruby/include/'],
  prefixes:    [],
  output:      "out/mruby.cr"
)
