FROM koromerzhin/php:8.4.3-apache-symfony

# Copier le script d'entrée personnalisé
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Définir le script d'entrée
ENTRYPOINT ["/docker-entrypoint.sh"]