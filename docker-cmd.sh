#!/bin/bash

# add any static files provided by the user
cd /moin/static
cp -r . /usr/share/moin/

# Correct permissions
#chown -R moin:moin /moin
chmod -R ug+rwX /moin

exec /usr/bin/uwsgi_python \
        --http-socket 0.0.0.0:8080 \
        --uwsgi-socket 0.0.0.0:3031 \
        --wsgi-file /usr/share/moin/server/moin.wsgi \
        --buffer-size 65536 \
        --post-buffering 32768 \
        -M -p 4 --need-app -t 60 

