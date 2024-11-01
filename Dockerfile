﻿# Usa una imagen base de Ruby ligera
FROM ruby:3.1-alpine

# Instalar dependencias del sistema necesarias para construir gemas nativas
RUN apk add --no-cache build-base

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos Gemfile y Gemfile.lock
COPY Gemfile Gemfile.lock ./ 

# Instalar las gemas necesarias usando bundler
RUN bundle install

# Copiar el resto del código de la aplicación al contenedor
COPY . .

# Exponer el nuevo puerto para Sinatra
EXPOSE 4569

# Ejecutar la aplicación usando rackup en el nuevo puerto
CMD ["rackup", "-o", "0.0.0.0", "-p", "4569", "config.ru"]
