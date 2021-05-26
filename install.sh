#!/bin/bash - 
#===============================================================================
#
#          FILE: install.sh
# 
#         USAGE: ./install.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Natan "Albrigs" Fernandes dos Santos
#  ORGANIZATION: 
#       CREATED: 25/05/2021 23:10
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
vim +PlugInstall +qall

