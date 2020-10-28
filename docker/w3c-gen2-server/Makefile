IMAGE_NAME ?= w3c-gen2-server
CONTAINER_NAME ?= w3c-gen2-server
CONTAINER_HOSTNAME ?= w3c-gen2-server
CMD=


include ../Makefile_common

# Additional target for this component.  This copies the logs
# that are stored inside the w3c-gen2-server component from the
# container, so they can be reviewed on directly on the host

copy_internal_logs:
	mkdir -p logs
	${FRONTEND} cp ${CONTAINER_NAME}:server/agt_server/logs/agt_server-log.txt logs/
	${FRONTEND} cp ${CONTAINER_NAME}:server/http_mgr/logs/http_mgr-log.txt logs/
	${FRONTEND} cp ${CONTAINER_NAME}:server/service_mgr/logs/service_mgr-log.txt logs/
	${FRONTEND} cp ${CONTAINER_NAME}:server/at_server/logs/at_server-log.txt logs/
	${FRONTEND} cp ${CONTAINER_NAME}:server/server_core/logs/server_core-log.txt logs/
	${FRONTEND} cp ${CONTAINER_NAME}:server/ws_mgr/logs/ws_mgr-log.txt logs/


agt_server_log:
	${FRONTEND} exec ${CONTAINER_NAME} cat server/agt_server/logs/agt_server-log.txt
http_mgr_log:
	${FRONTEND} exec ${CONTAINER_NAME} cat server/http_mgr/logs/http_mgr-log.txt
service_mgr_log:
	${FRONTEND} exec ${CONTAINER_NAME} cat server/service_mgr/logs/service_mgr-log.txt
at_server_log:
	${FRONTEND} exec ${CONTAINER_NAME} cat server/at_server/logs/at_server-log.txt
server_core_log:
	${FRONTEND} exec ${CONTAINER_NAME} cat server/server_core/logs/server_core-log.txt
ws_mgr_log:
	${FRONTEND} exec ${CONTAINER_NAME} cat server/ws_mgr/logs/ws_mgr-log.txt


