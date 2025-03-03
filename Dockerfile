FROM rocker/shiny:latest

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar archivos de la aplicación
COPY . /srv/shiny-server/mi-app/

# Script para instalar paquetes
COPY install_packages.R /tmp/
RUN Rscript /tmp/install_packages.R

# Configurar permisos
RUN chown -R shiny:shiny /srv/shiny-server/mi-app/

# Exponer puerto
EXPOSE 3838

# Comando para iniciar el servidor Shiny
CMD ["/usr/bin/shiny-server"]