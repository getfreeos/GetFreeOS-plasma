#!/usr/bin/env bash
##################################################################################################################
# Author    :   Wael Isa
# Website   :   https://www.getfreeos.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#################################
########## STARTS HERE ##########
#################################
script_path=$(readlink -f "${0%/*}")
work_dir="work"
# Adapted from AIS. An excellent bit of code!
# all pathes must be in quotation marks "path/to/file/or/folder" for now.
arch_chroot() {
    arch-chroot "${script_path}/${work_dir}/x86_64/airootfs" /bin/bash -c "${1}"
}
do_merge() {
arch_chroot "$(cat << EOF
echo "##############################"
echo "# start chrooted commandlist #"
echo "##############################"
cd "/root"
# Fix configs installed
sudo cp -fr /etc/getfreeos/.all/* /
sudo rm -fr /etc/getfreeos/.all
EOF
)"
}
#################################
##########  END  HERE  ##########
#################################
do_merge
