#!/bin/bash

echo "Gremlin Server Starting..."

docker-compose run --rm --service-ports gremlin-server

echo "Gremlin Server Started"