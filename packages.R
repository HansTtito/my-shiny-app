# Lista de paquetes necesarios para la aplicación
paquetes <- c(
  "shiny"
)

# Instalar paquetes faltantes
paquetes_a_instalar <- paquetes[!(paquetes %in% installed.packages()[,"Package"])]
if(length(paquetes_a_instalar) > 0) {
  install.packages(paquetes_a_instalar, repos = "https://cran.rstudio.com/")
}