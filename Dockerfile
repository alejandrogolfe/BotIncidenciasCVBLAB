FROM n8nio/n8n:latest

WORKDIR /home/node

# Copiar workflows
COPY workflow.json /home/node/workflows

# Configuración de n8n
ENV N8N_IMPORT_EXPORT_DIR=/home/node/workflows
ENV N8N_IMPORT_MODE=overwrite_unchanged

# Activar autenticación básica (no recomendado sin HTTPS)
ENV N8N_BASIC_AUTH_ACTIVE=true

# Configuración de host y protocolo
ENV N8N_HOST=botincidenciascvblab.onrender.com
ENV N8N_PROTOCOL=https

# Exponer puerto
EXPOSE 5678

# Comando por defecto
ENTRYPOINT ["n8n"]
