#!/usr/bin/env bash
if [ -z $1 ]; then
  echo Usage: $0 \<pid\>
  exit 1
fi
if ! ps -p $1 > /dev/null ; then
  echo Process with pid $1 not found. 
  exit 2
fi
if ! which pyrasite > /dev/null ; then
  if ! which yum ; then
    sudo yum install gdb
  fi
  if ! which apt ; then
    sudo apt install gdb
  fi

  pip3 install pyrasite
fi
echo dumping stacktrace for pid: $1 ...
pyrasite $1 stacktrace.py
echo stacktrace dumped to process output.
