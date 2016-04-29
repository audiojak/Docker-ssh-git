#!/bin/sh

mkdir -p /home/git/.ssh

echo $SSH_PUBLIC_KEY > /git/.ssh/authorized_keys

exec /usr/sbin/sshd -D
