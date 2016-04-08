# Docker-ssh-git

This container can act as a git repository for live development. It is expected that there will be a volume mount at run time to the /home/git directory. This should contain a .ssh/authorized_keys file.

If you need a solution with fine grained controls, I suggest: 
https://github.com/hlj/docker-gitolite 
which uses: 
https://github.com/sitaramc/gitolite
