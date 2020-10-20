FROM ubuntu:20.04
RUN apt-get update

# Fix TZDATA first because otherwise it tries user-interactive
# questions during installation.
ADD tzdata.sh /tmp/tzdata.sh
RUN /tmp/tzdata.sh

# Install the rest of the needed packages
RUN apt-get install -y git psmisc curl iputils-ping
RUN apt-get install -y golang

RUN cd / && git clone https://github.com/gunnarx/ccs-w3c-client -b fix_and_refactor_init_db
WORKDIR /ccs-w3c-client/statestorage
RUN go get -v . || true  # There's a failure, but it seems to at least fetch sqlite3 library
RUN go build
RUN true
CMD ./statestorage /data/statestorage.db /data/vsspathlist.json

