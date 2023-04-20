#!/bin/bash
#set -e
##################################################################################################################
# Author	:	Wael Isa
# Website	:	https://www.getfreeos.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
echo "Delete work & out folder."
sudo rm -fr work out
echo "Build."
sudo ./mkarchiso -v "."
echo "Build end."