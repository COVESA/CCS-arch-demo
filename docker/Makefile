# Makefile to update & start all client & server components
# It's in a somewhat unusual style but works for the purpose

default: build run

build: info1 build1 build2 build3 build4 build5 build6 build7

# FIXME: client (run2) must run twice, once first to create the ovds
# database file, then again after the server has started?
run: info2 run1 run2 run3 run4 run2 run5 run6 run7

info1:
	@echo "=========================================================="
	@echo "BUILDING ALL CONTAINER IMAGES (NOTE: OUTPUT IS SHORTENED)"
	@echo "=========================================================="
	@echo
build1:
	@echo "----------------------------------------------------------"
	@echo "ovds-server"
	@echo "----------------------------------------------------------"
	cd ovds-server && make build | egrep -i '^Step '
build2:
	@echo "----------------------------------------------------------"
	@echo "ovds-client"
	@echo "----------------------------------------------------------"
	cd ovds-client && make build | egrep -i '^Step '
build3:
	@echo "----------------------------------------------------------"
	@echo "statestorage"
	@echo "----------------------------------------------------------"
	cd statestorage && make build | egrep -i '^Step '
build4:
	@echo "----------------------------------------------------------"
	@echo "grafana"
	@echo "----------------------------------------------------------"
	cd grafana && make build | egrep -i '^Step '
build5:
	@echo "----------------------------------------------------------"
	@echo "livesim"
	@echo "----------------------------------------------------------"
	cd livesim && make build | egrep -i '^Step '
build6:
	@echo "----------------------------------------------------------"
	@echo "w3c-gen2-server"
	@echo "----------------------------------------------------------"
	cd w3c-gen2-server && make build | egrep -i '^Step '
build7:
	@echo "----------------------------------------------------------"
	@echo "nodejs-client"
	@echo "----------------------------------------------------------"
	cd nodejs-client && make build | egrep -i '^Step '

# NOTE: "make rm run" will first rm old instance, then run new instance
info2:
	@echo "----------------------------------------------------------"
	@echo "STARTING ALL CONTAINER IMAGES"
	@echo "----------------------------------------------------------"
run1:
	@echo "----------------------------------------------------------"
	@echo "Start: ovds-server"
	@echo "----------------------------------------------------------"
	cd ovds-server && make rm run
run2:
	@echo "----------------------------------------------------------"
	@echo "Start: ovds-client"
	@echo "----------------------------------------------------------"
	cd ovds-client && make rm run
run3:
	@echo "----------------------------------------------------------"
	@echo "Start: w3c-gen2-server"
	@echo "----------------------------------------------------------"
	cd w3c-gen2-server && make rm run
run4:
	@echo "----------------------------------------------------------"
	@echo "Start: statestorage"
	@echo "----------------------------------------------------------"
	cd statestorage && make rm run
run5:
	@echo "----------------------------------------------------------"
	@echo "Start: grafana"
	@echo "----------------------------------------------------------"
	cd grafana && make rm run
run6:
	@echo "----------------------------------------------------------"
	@echo "Start: livesim"
	@echo "----------------------------------------------------------"
	cd livesim && make rm run
run7:
	@echo "----------------------------------------------------------"
	@echo "Start: nodejs-client"
	@echo "----------------------------------------------------------"
	cd nodejs-client && make rm run
logs:
	cd ovds-client && make logs >ovds-client.log || true
	cd w3c-gen2-server && make logs >w3c-gen2-server.log || true
	cd statestorage && make logs >statestorage.log || true
	cd grafana && make logs >grafana.log || true
	cd livesim && make logs >livesim.log || true
	cd ovds-server && make logs >ovds-server.log || true
	cd nodejs-client && make logs >ovds-server.log || true
