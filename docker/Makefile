# Makefile to update & start all client & server components
SERVICES ?= ovds-server ovds-client w3c-gen2-server statestorage

default: build run

build: build1 build2 build3 build4

# FIXME: client (run2) must run twice, once first to create a file, then
# once at end _after_ the server is responding?
run: run1 run2 run3 run4 run2

build1:
	cd ovds-server && make build
build2:
	cd ovds-client && make build
build3:
	cd w3c-gen2-server && make build
build4:
	cd statestorage && make build

# NOTE: "make rm run" will first rm old instance, then run new instance
run1:
	cd ovds-server && make rm run
run2:
	cd ovds-client && make rm run
run3:
	cd w3c-gen2-server && make rm run
run4:
	cd statestorage && make rm run
