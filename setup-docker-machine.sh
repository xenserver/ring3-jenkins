#!/bin/sh

NFSOPTS="noatime,soft,nolock,vers=3,udp,proto=udp,rsize=8192,wsize=8192,namlen=255,timeo=10,retrans=3,nfsvers=3"

mkdir -p /usr/groups/build /usr/groups/cache /usr/groups/distcache /usr/groups/linux/distfiles /usr/groups/linux/distros /usr/groups/sources /usr/groups/xencore /usr/groups/xenrt

sudo mount -t nfs -o $NFSOPTS camos.uk.xensource.com:/vol/build/build /usr/groups/build
sudo mount -t nfs -o $NFSOPTS camos.uk.xensource.com:/vol/cache/cache /usr/groups/cache
sudo mount -t nfs -o $NFSOPTS camos.uk.xensource.com:/vol/distcache/distcache /usr/groups/distcache
sudo mount -t nfs -o $NFSOPTS filer01.uk.xensource.com:/groups/linux_distfiles /usr/groups/linux/distfiles
sudo mount -t nfs -o $NFSOPTS filer01.uk.xensource.com:/groups/linux_distros /usr/groups/linux/distros
sudo mount -t nfs -o $NFSOPTS camos.uk.xensource.com:/vol/sources/sources /usr/groups/sources
sudo mount -t nfs -o $NFSOPTS filer01.uk.xensource.com:/groups/xencore /usr/groups/xencore
sudo mount -t nfs -o $NFSOPTS filer01.uk.xensource.com:/groups/xenrt /usr/groups/xenrt
