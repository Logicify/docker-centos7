FROM centos:7
MAINTAINER Dmitry Berezovsky <dberezovsky@clockedlegal.com>

# INstall EPEL repository
RUN yum -y install epel-release && yum -y update

# Install pre-requiste software
RUN yum -y install yum-utils git tar acl zip unzip && \
    yum clean all
    
# Create user app and grant permissions on /srv folder
RUN useradd -m app \
  && setfacl -m "g:app:rwx" /srv \
  && setfacl -m "d:g:app:rwx" /srv \
  && chown -R app:app /srv
