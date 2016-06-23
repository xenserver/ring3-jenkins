FROM jenkins:latest
MAINTAINER Jon Ludlam <jonathan.ludlam@citrix.com>

USER root
RUN mkdir -p /var/log/jenkins /var/cache/jenkins /var/lib/opam
COPY certs /var/cache/jenkins/docker-cert
RUN chown -R jenkins:jenkins /var/cache/jenkins /var/log/jenkins /var/lib/opam
RUN curl -L http://download.opensuse.org/repositories/home:ocaml/Debian_7.0/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/ocaml/Debian_7.0/ /' >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -qq \
  git \
  mercurial \
  build-essential \
  sudo \
  rsync \
  python-jenkins \
  wget \
  less \
  vim \
  opam

RUN cd / && wget https://releases.hashicorp.com/packer/0.10.0/packer_0.10.0_linux_amd64.zip
RUN unzip /packer_0.10.0_linux_amd64.zip && mv /packer /usr/local/bin/
RUN wget http://www.uk.xensource.com/~jludlam/packer-builder-xenserver-iso -O /usr/local/bin/packer-builder-xenserver-iso
RUN wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
RUN dpkg -i vagrant_1.8.1_x86_64.deb
RUN vagrant plugin install vagrant-xenserver

RUN echo '%jenkins	ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir /usr/local/builds
RUN chown -R jenkins:jenkins /usr/local/builds

COPY setup.sh /usr/local/bin/setup.sh

USER jenkins

ENV OPAMROOT /var/lib/opam
RUN opam init -a -y --root=/var/lib/opam
RUN opam remote add xapi-project git://github.com/xapi-project/opam-repo-dev
RUN opam install -y depext
RUN . /var/lib/opam/opam-init/init.sh; opam depext ocamlscript xen-api-client ezxmlm; opam install -y ocamlfind
#
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
#
ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"



