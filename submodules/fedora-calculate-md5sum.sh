#!/bin/bash -xe

set -ex

top_dir=$(cd `dirname $0`; cd ..; pwd)
build_dir=$(cd /root/$2 && pwd)
version=$1 # branch or tag

workspace=${build_dir}/out/release/${version}/Fedora

# Update fedora repo
. ${top_dir}/include/mirror-func.sh
set_fedora_mirror

. ${top_dir}/include/checksum-func.sh

rm -f $workspace/*.MD5SUM
cal_md5sum ${workspace}
