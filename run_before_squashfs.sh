#!/usr/bin/env bash

# Made by Fernando "maroto"
# Run anything in the filesystem right before being "mksquashed"
# ISO-NEXT specific cleanup removals and additions (08-2021 + 10-2021) @killajoe and @manuel
# refining and changes november 2021 @killajoe and @manuel

script_path=$(readlink -f "${0%/*}")
work_dir="work"

# Adapted from AIS. An excellent bit of code!
# all pathes must be in quotation marks "path/to/file/or/folder" for now.

arch_chroot() {
    arch-chroot "${script_path}/${work_dir}/x86_64/airootfs" /bin/bash -c "${1}"
}

do_merge() {

arch_chroot "$(cat << EOF

# Add builddate to motd:
cat "/usr/lib/getfreeos-release" >> "/etc/motd"
echo "------------------" >> "/etc/motd"

# Enable systemd services
systemctl enable NetworkManager.service systemd-timesyncd.service bluetooth.service
systemctl enable vboxservice.service vmtoolsd.service vmware-vmblock-fuse.service
systemctl set-default multi-user.target
#systemctl enable intel.service

# TEMPORARY CUSTOM FIXES

# Fix configs installed
sudo cp -fr /etc/getfreeos/.all/* /
sudo rm -fr /etc/getfreeos/.all

EOF
)"
}

#################################
########## STARTS HERE ##########
#################################

do_merge
