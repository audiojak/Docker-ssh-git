#!/bin/bash

mkdir -p /home/git/.ssh
echo $SSH_PUBLIC_KEY > /home/git/.ssh/authorized_keys
chown -R git /home/git/.ssh
chmod 700 /home/git/.ssh
chmod 600 /home/git/.ssh/authorized_keys

exec /usr/sbin/sshd -D
