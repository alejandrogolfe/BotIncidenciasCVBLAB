#!/bin/sh
# Importar workflow antes de arrancar n8n
n8n import:workflow --input=/home/node/workflows/workflow.json

# Arranca n8n en foreground
n8n &
N8N_PID=$!

# Espera a que arranque el servidor
sleep 20

# Crear credenciales vacías
curl -s -X POST http://localhost:5678/rest/credentials \
  -u $N8N_BASIC_AUTH_USER:$N8N_BASIC_AUTH_PASSWORD \
  -H "Content-Type: application/json" \
  -d '{"name": "Jira Cloud", "type": "jiraSoftwareCloudApi", "data": {}}'

curl -s -X POST http://localhost:5678/rest/credentials \
  -u $N8N_BASIC_AUTH_USER:$N8N_BASIC_AUTH_PASSWORD \
  -H "Content-Type: application/json" \
  -d '{"name": "Discord Webhook", "type": "discordWebhookApi", "data": {}}'

curl -s -X POST http://localhost:5678/rest/credentials \
  -u $N8N_BASIC_AUTH_USER:$N8N_BASIC_AUTH_PASSWORD \
  -H "Content-Type: application/json" \
  -d '{"name": "Discord App", "type": "discordOAuth2Api", "data": {}}'

# Mantener n8n en primer plano
wait $N8N_PID
