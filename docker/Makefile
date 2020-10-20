# Makefile to update & start all client & server components
# It's in a somewhat unusual style but works for the purpose

default: build run

build: info1 build1 build2 build3 build4 build5 build6

# FIXME: client (run2) must run twice, once first to create the ovds
# database file, then again after the server has started?
run: info2 run1 run2 run3 run4 run2 run5 run6

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

# NOTE: "make rm run" will first rm old instance, then run new instance
info2:
	@echo "----------------------------------------------------------"
	@echo "STARTING ALL CONTAINER IMAGES"
	@echo "----------------------------------------------------------"
run1:
	cd ovds-server && make rm run
run2:
	cd ovds-client && make rm run
run3:
	cd w3c-gen2-server && make rm run
run4:
	cd statestorage && make rm run
run5:
	cd grafana && make rm run
run6:
	cd livesim && make rm run
