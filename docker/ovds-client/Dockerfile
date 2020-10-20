FROM ubuntu:20.10
RUN apt-get update

# Fix TZDATA first because otherwise it tries user-interactive
# questions during installation.
ADD tzdata.sh /tmp/tzdata.sh
RUN /tmp/tzdata.sh

# Install the rest of the needed packages
RUN apt-get install -y git golang screen psmisc curl iputils-ping

# Fetch, build and sanity-test server
WORKDIR /
RUN git clone https://github.com/GENIVI/ccs-w3c-client
RUN cd /ccs-w3c-client/ovds/client && go build
RUN ls -lR /ccs-w3c-client/ovds/client

# FIXME: Temporary use wip branch
#RUN git clone https://github.com/gunnarx/vehicle_signal_specification -b cnative_array --recursive

# Run make in VSS to create the cnative file**
#WORKDIR /vehicle_signal_specification/vss-tools
#RUN  pip3 install -r requirements.txt
#WORKDIR /vehicle_signal_specification/vss-tools/c_native
#RUN gcc -shared -o cnativenodelib.so -fPIC cnativenodelib.c

#WORKDIR /vehicle_signal_specification
#RUN make cnative
#RUN pwd

#RUN ls -al

# Make the name generic (NOTE: Use the name "vss_gen2.cnative" because it
# is hard-coded(!) in the W3C Gen2 server (Should not matter because
# that is on "the other side" of the network communication, we should be
# consistent with the name for simplicity.
# (And while demonstrating, we may also use the same file, in fact, by use
# of shared bind-mounted data dirs)
#RUN mv *.cnative vss_gen2.cnative

WORKDIR /ccs-w3c-client/ovds/client

# **For now this container is the one responsible to create the .cnative file
# Therefore, copy it to the common volume/location, so that other
# containers can use the exact same file.
#CMD mv /vehicle_signal_specification/*.cnative /data/vss_gen2.cnative && \
CMD ./client \
       /data/vsspathlist.json \
       w3c-gen2-server \
       ovds-server  \
       /data/vss_gen2.cnative \
       GEO001 \
       15

