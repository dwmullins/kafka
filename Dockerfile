FROM bekalpine:latest
RUN apk --no-cache add php-pear php7-dev gcc g++ librdkafka-dev make && \
    printf "\n" | pecl install rdkafka && \
    sed '$ a extension=rdkafka.so' -i /etc/php7/php.ini && \
    apk del php-pear php7-dev gcc g++ make
RUN mkdir /app
COPY src app
WORKDIR /app    
ENTRYPOINT ["/bin/ash", "-c", "php kafka.php"]