IMAGE_NAME ?= w3c-gen2-server
CONTAINER_NAME ?= w3c-gen2-server
CONTAINER_HOSTNAME ?= w3c-gen2-server
CMD=


include ../Makefile_common

# Additional target for this component.  This copies the logs
# that are stored inside the w3c-gen2-server component from the
# container, so they can be reviewed on directly on the host

internal_logs:
	mkdir -p logs
	${FRONTEND} cp server/agt_server/logs/agt_server-log.txt logs/
	${FRONTEND} cp server/http_mgr/logs/http_mgr-log.txt logs/
	${FRONTEND} cp server/service_mgr/logs/service_mgr-log.txt logs/
	${FRONTEND} cp server/at_server/logs/at_server-log.txt logs/
	${FRONTEND} cp server/server_core/logs/server_core-log.txt logs/
	${FRONTEND} cp server/ws_mgr/logs/ws_mgr-log.txt logs/

