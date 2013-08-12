# Puppet master and agent
# 
# DOCKER-VERSION 0.5.2

FROM centos

# bootstrap salt
RUN curl -L http://bootstrap.saltstack.org | sh

# Add gitpython
RUN install -y GitPython

# Add gitfs support
ADD .salt-gitfs.conf /etc/salt/master.d/

# /srv/salt
ADD srv/salt /srv/salt

# /srv/pillar
ADD srv/pillar /srv/pillar

# run salt
CMD salt-call --local state.highstate
