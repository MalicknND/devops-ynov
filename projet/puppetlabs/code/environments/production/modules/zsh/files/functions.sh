#!/bin/zsh

#########################################
# This file is auto-generated by Puppet #
#    All changes will be overwritten    #
#########################################

#FILE SEARCH
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#MKDIR AND CD
function mkcd() { mkdir -p "$@" && cd "$_"; }