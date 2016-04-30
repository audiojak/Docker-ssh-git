FROM ubuntu:14.04

RUN apt-get -y update
RUN apt-get -y install openssh-server
RUN apt-get -y install git

# Setting openssh
RUN mkdir /var/run/sshd
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Adding git user
RUN adduser --system git

# Updating shell to bash
RUN sed -i s#/home/git:/bin/false#/home/git:/bin/bash# /etc/passwd

EXPOSE 22

ENV SSH_PUBLIC_KEY ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCj8zRPjlxFMRHpP9orFobBEJwhg4DDQl3g05kscjGKSvz9hRl4MT/NZuhhXnj7cdgSCtnDQXLsovKbiqJjQ3jldj/4oWcJln5Lv9jtZ3QMXd1XovUWK+3AcZMiwd7Xyp7u7kD8zln3S4Zl2+r4MCJuEjM/oa2bw1qD/bMBJ3h0mKFqWwaMyf4Gh8lXWYzGoVIX0B6yGTYLUnOwFvmHo59L7IWwOQO+NXOyZkB0amtibCtL1OWkvUohuc7dHRhcDLDNMkejppyH1IUJmrdsxSm0Cydw+gc5+e8ff+VrkyNzJKtzz49ZwkXCr1hIB/lskf/98QEtjiItejRoDTlDTfA9

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
