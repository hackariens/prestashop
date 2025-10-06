#!/bin/bash

echo "🚀 Démarrage du conteneur PrestaShop..."

# Script de correction des permissions
echo "🔧 Correction automatique des permissions..."

# Dossiers qui ont besoin de permissions d'écriture
DIRECTORIES=(
    "/var/www/var"
    "/var/www/cache"
    "/var/www/upload"
    "/var/www/download"
    "/var/www/img"
    "/var/www/config"
    "/var/www/translations"
    "/var/www/modules"
    "/var/www/themes"
    "/var/www/mails"
)

for dir in "${DIRECTORIES[@]}"; do
    if [ -d "$dir" ]; then
        echo "📁 Correction des permissions pour $dir"
        chmod -R 777 "$dir"
        chown -R www-data:www-data "$dir"
    else
        echo "⚠️  Dossier $dir non trouvé, création..."
        mkdir -p "$dir"
        chmod -R 777 "$dir"
        chown -R www-data:www-data "$dir"
    fi
done

# Permissions spéciales pour les fichiers de configuration
if [ -f "/var/www/config/settings.inc.php" ]; then
    chmod 666 "/var/www/config/settings.inc.php"
    chown www-data:www-data "/var/www/config/settings.inc.php"
fi

echo "✅ Permissions corrigées !"

# Démarrer Apache en mode foreground
echo "🌐 Démarrage d'Apache..."
exec apache2-foreground