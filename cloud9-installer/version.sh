#!/bin/bash -e

#https://rcn-ee.net/pkgs/c9v3/

package_name="cloud9-installer"
debian_pkg_name="${package_name}"
package_version="3.0.954"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="c/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar=""
debian_patch=""

wheezy_version="~bpo70+20150312+1"
jessie_version="~bpo80+20150312+1"
trusty_version="~bpo1404+20150312+1"
