# Do nothing.
.PHONY: null
null:
	@$(error No Default Target).

### Environment Setup.

## Variables
MK_DIR:=$(realpath $(dir $(firstword ${MAKEFILE_LIST})))
SANDWICH_DIR:=$(realpath $(dir $(lastword ${MAKEFILE_LIST})))

# Project name
PROJ?=$(notdir ${MK_DIR})

## Targets
# Clean environment.
.PHONY: clean
clean:
	@echo --- Cleaning ${PROJ} ---
	# If it's not in Git, it doesn't exist.
	@git clean -xfd
	
.PHONY: env
env: $(addprefix env.,${ENVS})
	
# Debug
.PHONY: debug
debug: debug.host debug.os
	@$(info $${MK_DIR}='${MK_DIR}')
	@$(info $${SANDWICH_DIR}='${SANDWICH_DIR}')
	@$(info $${PROJ}='${PROJ}')
	@$(info $${USER}='${USER}')

# Variables
include ${SANDWICH_DIR}/var_os.mk
include ${SANDWICH_DIR}/var_dates.mk

# Environments
include ${SANDWICH_DIR}/env_host.mk
include ${SANDWICH_DIR}/env_python.mk
include ${SANDWICH_DIR}/env_arduino.mk
# Tools
include ${SANDWICH_DIR}/tool_git.mk
include ${SANDWICH_DIR}/tool_lint.mk
include ${SANDWICH_DIR}/tool_jenkins.mk

# magnum opus
include ${SANDWICH_DIR}/sandwich.mk
