#!/bin/sh

mkdir -p /home/git/.ssh

echo $SSH_PUBLIC_KEY > /home/git/.ssh/authorized_keys

chmod 700 /home/git/.ssh
chmod 600 /home/git/.ssh/authorized_keys

exec /usr/sbin/sshd -D
