#! /bin/bash
dir="mnt/nas/"
if [ $(du -s $dir | awk {'print $1'})]