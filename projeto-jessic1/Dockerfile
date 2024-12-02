FROM php:8.2-apache

# Instale extensões necessárias para conectar ao MariaDB
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copie o conteúdo da aplicação
COPY src/ /var/www/html/

# Ajuste as permissões
RUN chown -R www-data:www-data /var/www/html
