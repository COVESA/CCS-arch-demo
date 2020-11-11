FROM influxdb:latest
RUN apt-get update

# Standard fix of TZDATA first because otherwise it tries user-interactive
# questions during installation.
ADD tzdata.sh /tmp/tzdata.sh
RUN /tmp/tzdata.sh

RUN ls -al /var/lib/influxdb

# Usage instructions propose to map a host bind mounted volume
# to access the container's relevant directory from the host (not the other
# way around) So let's link it in that direction.
# It must be done in CMD and not earlier because /data is not mounted until
# the real container is started

# When starting, we also want to point to our own config which is in the common /data

CMD test -h /data/influxdb || ln -s /var/lib/influxdb /data/influxdb && \
    influxdb -config /data/influxdb.conf

