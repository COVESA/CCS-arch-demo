FROM ubuntu:19.10
RUN apt-get update

# Fix TZDATA first because otherwise it tries user-interactive
# questions during installation.
ADD tzdata.sh /tmp/tzdata.sh
RUN /tmp/tzdata.sh

# Install the rest of the needed packages
RUN apt-get install -y git psmisc curl iputils-ping
RUN apt-get install -y nodejs mysql-server
RUN apt-get install -y npm
RUN apt-get install -y telnet net-tools

# Fetch nodejs-client (stored inside ccs-w3c-client project)
RUN git clone https://github.com/GENIVI/ccs-w3c-client
WORKDIR /ccs-w3c-client/nodejs-ccs-driver

ADD setup_mysql.sh .
RUN service mysql start && ./setup_mysql.sh

# index.js is hardcoded to find the websocket server on localhost at
# the moment -- let's insert the logical host name for the w3c-gen2-server
# container in the container-internal network:
RUN sed -i "s/ws.w3cInit('localhost', 8080);/ws.w3cInit('w3c-gen2-server', 8080);/" index.js

RUN npm install

# Reconfigure mysql to listen on external address
RUN sed -i "s/bind-address.*=.*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

CMD service mysql start && npm start

