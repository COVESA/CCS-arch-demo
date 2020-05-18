#!/bin/sh

r=0

# There should be 6 screens if server starts OK
./W3CServer.sh startme
NUM=$(screen -list | fgrep '(Detached)' | wc -l)

if [ $NUM -ne 6 ] ; then
   echo "TEST FAILED!"
   echo "Expected 6 running processes (screens)"
   echo "But instead there are $NUM.  Listing all screens:"
   screen -list
   r=1
else
   echo "Server start test: OK."
fi


# Now try interacting with the server

NODE=Vehicle/Cabin/Door/Row1/Right/IsOpen
PORT=8888

curl -s http://127.0.0.1:$PORT/$NODE | fgrep -q '{"timestamp":'

# Check success code from text match
if [ $? -eq 0 ] ; then
   echo "GET request test: OK."
else
   echo "GET request test: FAILED!"
   r=1
   exit 1
fi
exit $r

