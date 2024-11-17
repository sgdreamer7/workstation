#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

brew update
brew install pyenv

docker compose -f docker-compose.core.yaml up -d
docker compose -f docker-compose.homer.yaml up -d
docker compose -f docker-compose.jupyter-lab.yaml up -d
set -o allexport; source ./docker-compose.postgres.env; set +o allexport; docker compose -f docker-compose.postgres.yaml up -d
docker compose -f docker-compose.pgadmin.yaml up -d
docker compose -f docker-compose.redis.yaml up -d
# docker compose -f docker-compose.open-webui.yaml up -d
docker compose -f docker-compose.qdrant.yaml up -d
docker compose -f docker-compose.vscode.yaml up -d
docker compose -f docker-compose.n8n.yaml up -d
set -o allexport; source ./docker-compose.postgres.env; set +o allexport; docker compose -f docker-compose.nocodb.yaml up -d
