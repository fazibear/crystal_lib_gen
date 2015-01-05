#set -x DYLD_FALLBACK_LIBRARY_PATH /usr/local/opt/llvm/lib/

require 'bundler/setup'
Bundler.require(:default)

require_relative '../lib/crystal_lib_gen'

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
