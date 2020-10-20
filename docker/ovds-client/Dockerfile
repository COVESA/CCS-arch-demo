FROM ubuntu:20.04
RUN apt-get update

# Fix TZDATA first because otherwise it tries user-interactive
# questions during installation.
ADD tzdata.sh /tmp/tzdata.sh
RUN /tmp/tzdata.sh

# Install the rest of the needed packages
RUN apt-get install -y git psmisc curl iputils-ping
RUN apt-get install -y golang

# Fetch, build and sanity-test server
WORKDIR /
RUN git clone https://github.com/GENIVI/ccs-w3c-client
RUN cd /ccs-w3c-client/ovds/client && go build
RUN ls -lR /ccs-w3c-client/ovds/client

WORKDIR /ccs-w3c-client/ovds/client

CMD ./client \
       /data/vsspathlist.json \
       w3c-gen2-server \
       ovds-server  \
       /data/vss_gen2.cnative \
       GEO001 \
       15

