#!/bin/bash -e

#proxy=""
proxy="apt-proxy:3142/"

debian_server="ftp.us.debian.org/debian"
ubuntu_server="ports.ubuntu.com"

setup_update_sbuild () {
	if [ ! -f /var/lib/sbuild/${dist}-${arch}.tar.gz ] ; then
		sudo sbuild-createchroot ${options} --arch=${arch} --make-sbuild-tarball=/var/lib/sbuild/${dist}-${arch}.tar.gz ${dist} `mktemp -d` ${mirror}
	else
		sudo chown -R root:root /var/lib/sbuild/${dist}-${arch}.tar.gz
		sudo sbuild-update -udcar ${dist}-${arch}-sbuild
	fi
}

echo "\$build_arch_all = 1;" > ~/.sbuildrc
echo "\$build_source = 1;" >> ~/.sbuildrc
echo "\$distribution = 'stretch';" >> ~/.sbuildrc

mirror="http://${proxy}${debian_server}"
dist="wheezy"
arch="armhf"
options=""
setup_update_sbuild

dist="jessie"
arch="armhf"
options=""
setup_update_sbuild

dist="stretch"
arch="armhf"
options=""
setup_update_sbuild

mirror="http://${proxy}${ubuntu_server}"
dist="trusty"
arch="armhf"
options="--exclude=debfoster"
setup_update_sbuild

dist="utopic"
arch="armhf"
options="--exclude=debfoster"
setup_update_sbuild

dist="vivid"
arch="armhf"
options="--exclude=debfoster"
setup_update_sbuild

dist="wily"
arch="armhf"
options="--exclude=debfoster"
setup_update_sbuild
