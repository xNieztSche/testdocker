# Usa la imagen base de Ruby 3.1 Alpine
from ruby:3.1-alpine

# Establecer el directorio de trabajo
workdir /app

# Copiar el Gemfile y Gemfile.lock (si lo tienes) y ejecutar bundle install
copy Gemfile Gemfile.lock ./
run bundle install

# Copiar el resto de la aplicación
copy . .

# Exponer el puerto que utiliza Sinatra
expose 4567

# Comando para iniciar la aplicación
cmd ["ruby", "app.rb"]
