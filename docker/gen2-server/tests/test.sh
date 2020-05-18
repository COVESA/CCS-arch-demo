#!/bin/sh

# There should be 6 screens if server starts OK
./W3CServer.sh startme
NUM=$(screen -list | fgrep '(Detached)' | wc -l)

if [ $NUM -ne 6 ] ; then
   echo "TEST FAILED!"
   echo "Expected 6 running processes (screens)"
   echo "But instead there are $NUM.  Listing all screens:"
   screen -list
   return 1
else
   echo "Server start test: OK."
   return 0
fi




