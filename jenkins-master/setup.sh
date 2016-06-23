#!/bin/bash

cd ~

git clone git://github.com/xenserver/xs-pull-request-build-scripts
cd xs-pull-request-build-scripts
./new_jenkins_job.py -n xen-api -p http://github.com/xapi-project/xen-api -g git://github.com/xapi-project/xen-api -c api
./new_jenkins_job.py -n xenopsd -p http://github.com/xapi-project/xenopsd -g git://github.com/xapi-project/xenopsd -c api-libs
./new_jenkins_job.py -n xcp-rrdd -p http://github.com/xapi-project/xcp-rrdd -g git://github.com/xapi-project/xcp-rrdd -c api-libs

