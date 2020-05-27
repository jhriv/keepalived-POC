# Proof of concept for Keepalived & HAProxy

To use:
`make all`

Enjoy !

## Running playbook by hand

Use either `make main` as provided by the Makefile, or `ansible-playbook
main.yml`. You must use use `ansible-playbook` to use options like
`-C`/`--check` or `-D/--diff` or  limit the hosts in the play.

If you really break things drastically:

* `vagrant halt --force`
* `git reset --hard HEAD`
* `git clean -f`
* `make all`

## Experimenting

### Status:

Run in a separate terminal. Running the lynx/curl/nc under `watch` will let
you keep a live update.

* `sudo ping -f 172.16.1.5`
* `ansible pr\* -a 'cat /run/keepalived.state'`
* `lynx -dump 172.16.1.5`
* `curl -s -D /dev/stdout http://172.16.1.5`
* `printf 'GET / HTTP/1.0\n\n' | nc 172.16.1.5 80`

### Breaking:

Mix and match!

* Pick a frontend proxy (the one that is MASTER is a good choice):
  * `vagrant halt pr-1`
  * `ansible pr-1 -b -m service -a 'name=keepalived state=stopped'`
  * `ansible pr-1 -b -m service -a 'name=haproxy state=stopped'`
* Pick a backend web server (the one that is responding is a good choice):
  * `vagrant halt be-1`
  * `ansible be-1 -b -m service -a 'name=nginx state=stopped'`

Re-run the playbook after these:

* Change the salt in `templates/haproxy.conf.j2`
* Turn off a proxy and/or backend
* Change the `vip` in `main.yml`

## DEPRECATION WARNING

If you are getting `host <...> should use /usr/bin/python3` or other
deprecation warnings, silence them with:

```
$ export ANSIBLE_DEPRECATION_WARNINGS=false
```

## Resources:

* https://packetpushers.net/vrrp-linux-using-keepalived-2/
* http://www.linux-admins.net/2015/02/keepalived-using-unicast-track-and.html
* https://github.com/jhriv/vagrant-as-infrastructure
