FROM php:7.4-fpm

#mantenedor da imagem
LABEL maintainer="Edipo Elwes"

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    default-mysql-client \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    nano \
    unzip \
    git \
    curl \
    libzip-dev \
    zlib1g-dev \
    libicu-dev \
    libgmp-dev \
    libpq-dev \
    libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install pdo_mysql \ 
    && docker-php-ext-install exif \ 
    && docker-php-ext-install pcntl \
    && docker-php-ext-install zip \
    && docker-php-ext-enable opcache \
    && docker-php-ext-install calendar \
    && docker-php-ext-install intl \
    && docker-php-ext-install gmp \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && docker-php-ext-install soap \
    && docker-php-ext-install sockets


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install nodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Copy existing application directory contents
COPY . /var/www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
