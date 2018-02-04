FROM debian:stretch

RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential ca-certificates git bison autoconf autogen automake libgcrypt20-dev \
 && git clone https://github.com/ldmud/ldmud.git \
 && cd ldmud/src && ./autogen.sh && ./configure --prefix=/usr/local && make install-driver && cd ../.. \
 && mkdir /mud && cp -a ldmud/mud/lp-245 /mud/lib \
 && rm -rf ldmud \
 && apt-get clean \
 && apt-get remove --purge -y build-essential ca-certificates git bison autoconf autogen automake libgcrypt20-dev \
 && apt-get autoremove -y

# Save the plain mudlib for copying into the volume.
RUN tar -zcf /mud/lib.tar.gz -C /mud/lib .

ADD driver.sh /usr/local/bin/

EXPOSE 4242 4246/udp
VOLUME /mud/lib

CMD [ "/usr/local/bin/driver.sh" ]
