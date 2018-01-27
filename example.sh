#!/bin/sh
#export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
lua51 -e "package.cpath = './?.so'" ./examples/cairo_test1.lua
 