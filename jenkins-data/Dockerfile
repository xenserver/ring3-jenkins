FROM debian:jessie
MAINTAINER Jon Ludlam <jonathan.ludlam@citrix.com>

RUN useradd -d "/var/jenkins_home" -u 1000 -m -s /bin/bash jenkins
RUN mkdir -p /var/log/jenkins /var/lib/opam
RUN chown -R jenkins:jenkins /var/log/jenkins /var/lib/opam
RUN apt-get update
RUN apt-get install -qq git build-essential sudo rsync wget opam

VOLUME ["/var/log/jenkins", "/var/jenkins_home"]

USER jenkins

ENV OPAMROOT /var/lib/opam
RUN opam init -a -y

CMD ["echo", "Data container for Jenkins"]

