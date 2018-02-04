#! /bin/sh

if [ ! -e /mud/lib/secure/master.c ]; then
    tar -zxf /mud/lib.tar.gz -C /mud/lib --no-same-owner
fi

exec /usr/local/bin/ldmud -m /mud/lib -M secure/master.c
