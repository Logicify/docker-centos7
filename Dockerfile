FROM centos:7
MAINTAINER Dmitry Berezovsky <dberezovsky@clockedlegal.com>

# Install EPEL repository
RUN yum -y install epel-release && yum -y update

# Install pre-requiste software
RUN yum -y install yum-utils git tar acl zip unzip wget && \
    yum clean all
    
# Create user app and grant permissions on /srv folder
RUN useradd -m -u 1717 app \
  && setfacl -m "g:app:rwx" /srv \
  && setfacl -m "d:g:app:rwx" /srv \
  && chown -R app:app /srv
