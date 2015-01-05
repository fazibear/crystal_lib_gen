crystal_lib_gen
===============

Automatic binding generator for Crystal

## Install (OSX)

```
brew install llvm --with-clang
brew link llvm --force
brew install crystal
brew install mruby

bundle install

bin/crystal_lib_gen examples/mruby.rb
crystal out/test_mruby.cr
```

## See Also
* [Crystal](https://github.com/manastech/crystal)
* [ffi-gen](https://github.com/neelance/ffi-gen)
