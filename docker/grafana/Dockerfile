FROM ubuntu:19.10
RUN apt-get update

# Standard fix of TZDATA first because otherwise it tries user-interactive
# questions during installation.
ADD tzdata.sh /tmp/tzdata.sh
RUN /tmp/tzdata.sh

RUN apt-get install -y git psmisc curl iputils-ping
RUN apt-get install -y apt-transport-https gnupg

# Package sources for grafana
RUN curl -s https://packages.grafana.com/gpg.key | apt-key add -
RUN echo "deb https://packages.grafana.com/oss/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list 
RUN apt-get update
RUN apt-get install -y grafana

# Enable server
RUN update-rc.d grafana-server defaults 95 10

# TODO: ADD ANY SCRIPTS OR SUCH THINGS?
# ADD ...

CMD service grafana-server start && sleep 10000000

