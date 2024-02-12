#!/bin/bash

cbindgen --config cbindgen.toml --output library.h

pushd ../library_user

dart run ffigen

popd

