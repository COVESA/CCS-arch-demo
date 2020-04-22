Containers for individual parts
===============================


These are the container definitions, some aimed for development, some for
deployment in the actual demonstration system.

Docker is used as frontend but it could be adapted to any OCI compatible
setup later on.

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

