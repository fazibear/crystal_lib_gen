#!/bin/sh
export DYLD_FALLBACK_LIBRARY_PATH=`brew --prefix llvm`/lib/
bundle exec ruby $1 
