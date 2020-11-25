Containers
===============================

These are the container definitions, some aimed for development, some for
deployment in the actual demonstration system.

The FRONTEND variable in the makefile can be set to something other
than docker, for example podman, or likely "sudo podman" (see below for why).

If docker is installed, it should work without any modifications:

Usage:
------

First enter the subdirectory for the component (where applicable).

In each directory:

To list all possible options run make without parameters
```
make
```

To create the image from Dockerfile, run:
```
make build
```

To run the container:
```
make run
```

To run tests:
```
make test
```

Alternative OCI compatible container frontends
----------------------------------------------

The commands are using docker syntax so it likely requires a runtime that can
emulate or provide a compatible command interface to `docker` -- An
example of this is `podman`.

In time the demo setup might also use a container deployment and management
solution like `kubernetes`.

Be aware that some operations like creating the network are privileged,
and therefore require those to execute `podman` with privileges (since unlike
Docker, it is not delegating the work to a privileged daemon).
This complicates things a bit further.  If running a container is to be done
by invoking the Makefile target using with "sudo run" then it will not find
the container image, if it was built and associated with another user.  (Each
user's images are independently managed). In practice this means that also
building the container needs to run with "sudo" in the simplest case, not
because that operation is privileged but for simplicity so that the images
are associated with the root user that will later on run them.

There might be other ways to manage this inconvenience, but there is no way to
get around that some operations are privileged.  They are equally privileged
for Docker but then it is just hidden from view since the docker daemon
executes them.


