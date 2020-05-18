docker/server
=============

This packages a reference implementation for W3C data server 
W3C_VehicleSignalInterfaceImpl into a container using Docker as
tool/frontend.

The W3C_VehicleSignalInterfaceImpl repository already includes Dockerfiles
and a docker-compose file to put them all together.  For our demonstration
purpose however I find it unnecessarily complicated to put each process
into its own container and to set up the networking between them.  There
are 6 different processes making up the W3C_VehicleSignalInterfaceImpl
implementation and for this demo perspective they will be deployed in the
same space and can be placed in a single container as a start.

Tests
-----

Like all the parts in this directory, it includes a basic sanity-test
script to make sure the container appears to build and work correctly.

The tests are in the tests/ directory, but are already run as part of the
`docker build` process.
