FROM ubuntu:20.04
RUN apt-get update

# Fix TZDATA first because otherwise it tries user-interactive
# questions during installation.
ADD tzdata.sh /tmp/tzdata.sh
RUN /tmp/tzdata.sh

# Install the rest of the needed packages
RUN apt-get install -y git golang screen psmisc curl

# Fetch, build and sanity-test server
RUN mkdir /server
WORKDIR /server
RUN git clone https://github.com/MEAE-GOT/W3C_VehicleSignalInterfaceImpl .
RUN go build
ADD tests/build-sanity.sh /server/
RUN /server/build-sanity.sh

