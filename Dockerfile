FROM rocker/shiny:latest

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar archivos de la aplicación a la ubicación correcta
COPY my-shiny-app /srv/shiny-server/

# Script para instalar paquetes
COPY packages.R /tmp/
RUN Rscript /tmp/packages.R

# Configurar permisos
RUN chown -R shiny:shiny /srv/shiny-server/

# Exponer puerto
EXPOSE 3838

# Iniciar Shiny Server
CMD ["/usr/bin/shiny-server"]
