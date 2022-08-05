#!/bin/bash

set -eux

wp core download \
  --version=$WORDPRESS_VERSION \
  --locale=$WORDPRESS_LOCALE

wp config create \
  --dbhost=$WORDPRESS_DB_HOST \
  --dbuser=$WORDPRESS_DB_USER \
  --dbpass=$WORDPRESS_DB_PASSWORD \
  --dbname=$WORDPRESS_DB_NAME

wp core multisite-install \
  --url=$WORDPRESS_URL \
  --title=$WORDPRESS_TITLE \
  --admin_user=$WORDPRESS_ADMIN_USER \
  --admin_email=$WORDPRESS_ADMIN_EMAIL \
  --skip-email

cat <<'EOF' > .htaccess
RewriteEngine On
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteBase /
RewriteRule ^index\.php$ - [L]

# add a trailing slash to /wp-admin
RewriteRule ^([_0-9a-zA-Z-]+/)?wp-admin$ $1wp-admin/ [R=301,L]

RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]
RewriteRule ^([_0-9a-zA-Z-]+/)?(wp-(content|admin|includes).*) $2 [L]
RewriteRule ^([_0-9a-zA-Z-]+/)?(.*\.php)$ $2 [L]
RewriteRule . index.php [L]
EOF
