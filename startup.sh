#!/bin/sh
# Importar workflow antes de arrancar n8n
n8n import:workflow --input=/home/node/workflows/workflow.json



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


# Arranca n8n en foreground
n8n
