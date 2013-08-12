# Puppet master and agent
# 
# DOCKER-VERSION 0.5.2

FROM centos

# bootstrap salt
RUN curl -L http://bootstrap.saltstack.org | sh -s -- -M

# Add gitpython
RUN yum install -y GitPython

# Add saltconfig 
ADD master.conf /etc/salt/master.d/
ADD minion.conf /etc/salt/minion.d/

# /srv/salt
ADD srv/salt /srv/salt

# /srv/pillar
ADD srv/pillar /srv/pillar

# workaround to be able to resolve localhost from within Java
RUN sed -i "s/^127.0.0.1.*/127.0.0.1 $(hostname) salt.example.com salt/" /etc/hosts
RUN sed -i "s/^::1.*/::1 $(hostname) salt.example.com salt/" /etc/hosts

# start salt
RUN /etc/init.d/salt-master start

# start minion
RUN /etc/init.d/salt-minion start

# add salt-key
RUN salt-key -Ay

# run salt
CMD salt \* state.highstate
