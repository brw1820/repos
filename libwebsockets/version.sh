#!/bin/bash -e

#mirror="http://ftp.de.debian.org/debian"
mirror="http://deb.dovetail-automata.com/deb-testing"

package_name="libwebsockets"
debian_pkg_name="${package_name}"
package_version="1.3"

git_repo=""
git_sha=""
reprepro_dir="libw/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1~git95a8abb~1431844465git95a8abb~1jessie~1da"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

jessie_version="~20141124+1"
