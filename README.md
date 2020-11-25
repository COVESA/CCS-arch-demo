CCS-arch-demo
=============

Working directory to collect up parts that are used to develop and/or
demonstrate the vehicle data reference architecture developed in the Cloud And
Connected Services (CCS) project.

Git submodules are used to reference the various parts that are
stored in other places.  However at the moment most of those are not 
actually used when running the code. This is because each container definition
(see docker/README.md) also fetches its own copy of the corresponding
repositories, while building the container image.  The Dockerfile usually
fetches the tip of the master branch of each repo.

The submodule directories can still be helpful when developing the parts
because they are all readily available in the project tree, but since they are
locked to a commit it is recommended to enter and git-pull the latest code
before studying it.

Directories:
------------

* docker/ -- Container definitions to package parts of the demo for production support as well as final deployment
* ... various parts brought in as submodules (see above)
* data/  -- A shared directory that is bind mounted into the component containers for them to share a storage area, such as shared database files. In the repository it contains a few preloaded data files.  Most of /data is however populated by the containers during runtime.
