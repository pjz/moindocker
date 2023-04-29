# dockerized moinmoin

Note this runs moinmoin under uwsgi and only exposes a uwsgi socket ; 
you'll need to set up a webserver to serve real pages and set up auth and etc.

```
docker run -d \
    -v ./config:/etc/moin/ \
    -v ./data:/moin/data \
    -v ./underlay:/moin/underlay \
    -v ./log:/moin/log \
    -v ./static:/moin/static \
    -p 127.0.0.1:3031:3031 \
    moindocker
```

/static gets `cp -r`'d into /usr/share/moin at startup to facilitate theme
and plugin installation.
