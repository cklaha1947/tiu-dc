FROM php:8.2-apache

# Update apt and install utilities
RUN apt-get update && apt-get install -y \
    zip unzip git

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (important for routing frameworks like Laravel or custom rewrites)
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy project files into container
COPY . /var/www/html/

# Give permissions
RUN chown -R www-data:www-data /var/www/html
