FROM ubuntu:20.04
RUN apt-get update

# Fix TZDATA first because otherwise it tries user-interactive
# questions during installation.
ADD tzdata.sh /tmp/tzdata.sh
RUN /tmp/tzdata.sh

# Install the rest of the needed packages
RUN apt-get install -y git psmisc curl iputils-ping
RUN apt-get install -y golang
RUN apt-get install -y python3-pip

# FIXME: Temporary use wip branch
# Run make the VSS tree, to create the cnative file
RUN git clone https://github.com/GENIVI/vehicle_signal_specification --recursive
WORKDIR /vehicle_signal_specification/
RUN cd vss-tools && pip3 install -r requirements.txt
RUN cd vss-tools/c_native && gcc -shared -o cnativenodelib.so -fPIC cnativenodelib.c
RUN make cnative  # (In VSS root)

# Make the name generic (NOTE: Use the name "vss_gen2.cnative" because it
# is hard-coded(!) in the W3C Gen2 server (Name not matter because
# that is on "the other side" of the network communication, but we can be
# consistent with the name for simplicity)
# And while demonstrating, we might also use the same file, in fact, by use
# of shared bind-mounted data dirs.
RUN mv *.cnative vss_gen2.cnative

# Fetch, build and sanity-test server
WORKDIR /
RUN git clone https://github.com/GENIVI/ccs-w3c-client
RUN cd /ccs-w3c-client/ovds/server && go build
RUN ls -lR /ccs-w3c-client

WORKDIR /ccs-w3c-client/ovds/server
CMD mv /vehicle_signal_specification/*.cnative /data/vss_gen2.cnative && \
          ./server /data/ovds.db /data/vss_gen2.cnative

