FROM ubuntu:18.04
RUN apt-get update

# Fix TZDATA first because otherwise it tries user-interactive
# questions during installation.
ADD tzdata.sh /tmp/tzdata.sh
RUN /tmp/tzdata.sh

# Install the rest of the needed packages
RUN apt-get install -y apt-transport-https git golang screen psmisc curl iputils-ping --fix-missing

# Fetch, build and sanity-test server
WORKDIR /
RUN git clone https://github.com/GENIVI/ccs-w3c-client

# Install required(?) package for livesim - build fails without it
RUN go get github.com/mattn/go-sqlite3
RUN cd /ccs-w3c-client/livesim && go build

# The script also a local instance of ovds-server to make user
# of it as a database-access abstraction (i.e. livesim uses the
# REST interface exposed by ovds-server)
RUN cd /ccs-w3c-client/ovds/server && go build

# Program start is encoded in the script
WORKDIR /ccs-w3c-client
ADD livesim_start.sh .
CMD ./livesim_start.sh


