#!/bin/bash

# This script attaches to the log output of the given docker-compose services
# and displays the logs continually.
# Put it in your $PATH.
# Example:
#   dcl backend-api
#   dcl rabbitmq uma

compose logs -f $@
