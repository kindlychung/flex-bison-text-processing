#!/usr/bin/env bash

bison -d input.y && flex input.l && cc input.tab.c lex.yy.c -lfl