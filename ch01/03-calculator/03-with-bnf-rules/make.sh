#!/usr/bin/env bash

bison --graph -d input.y && flex input.l && cc input.tab.c lex.yy.c -lfl