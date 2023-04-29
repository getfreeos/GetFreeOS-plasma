#!/bin/bash
#set -e
cp -fr ${pacstrap_dir}/etc/getfreeos/.all/* ${pacstrap_dir}/
rm -fr ${pacstrap_dir}/etc/getfreeos/.all
rm -fr ${pacstrap_dir}/etc/arch-release
