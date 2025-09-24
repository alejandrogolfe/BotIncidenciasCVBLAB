FROM n8nio/n8n:latest


WORKDIR /home/node


# Crear carpeta de workflows y copiar el workflow
RUN mkdir -p /home/node/workflows/
COPY workflow.json /home/node/workflows/
# Instalar nodo de la comunidad (Discord)
RUN npm install @jordanburke/n8n-nodes-discord --production --prefix /home/node/.n8n/nodes



# Configuración de n8n
ENV N8N_IMPORT_EXPORT_DIR=/home/node/workflows/
ENV N8N_IMPORT_MODE=overwrite_unchanged
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_HOST=n8ncvblab2.onrender.com
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false


# Exponer puerto
EXPOSE 5678

# Comando por defecto
COPY startup.sh /home/node/startup.sh
ENTRYPOINT ["/home/node/startup.sh"]
