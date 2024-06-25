# setup local machine

* mkdir ~/.unison/ ~/bin/unison

# install unison

* download release: https://github.com/bcpierce00/unison/releases
* unzip tarball to ~/bin/unison
* add profile to ~/.unison/rsync.net.prf

```
# unison profile
root = /home/josh/Documents
root = ssh://de3682@de3682.rsync.net/Documents

path = foo
path = bar
path = baz
path = qux

sshargs = -C
```

# setup cron

```
/home/josh/bin/unison -batch -auto rsync.net
```
