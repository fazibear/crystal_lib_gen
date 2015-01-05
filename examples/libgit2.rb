#set -x DYLD_FALLBACK_LIBRARY_PATH /usr/local/opt/llvm/lib/

require 'bundler/setup'
Bundler.require(:default)

require_relative '../lib/crystal_lib_gen'

FFIGen.generate(
  module_name: "Git2",
  ffi_lib:     "libgit2",
  headers:     %w[
                git2.h
                git2/types.h
                git2/repository.h
                git2/status.h
               ],
  cflags:      ['-I/usr/local/opt/libgit2/include/'],
  prefixes:    [],
  output:      "out/git2.cr"
)
