#!/usr/bin/env bash

flex input.l
gcc lex.yy.c -lfl

# run ./a.out and try to type some text there, finish with ctrl-d
# you will get some stats similar to wc