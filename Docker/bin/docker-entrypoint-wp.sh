#!/bin/sh

wait-for.sh db:3306

wp core install --url="http://localhost:8000" \
    --title="Auth0 ♥ WordPress" \
    --admin_user="$ADMIN_EMAIL" \
    --admin_email="$ADMIN_EMAIL" \
    --admin_password="$ADMIN_PASS" --skip-email --allow-root

wp rewrite structure "/%postname%/" --allow-root
wp rewrite flush --allow-root

wp theme activate auth0-wp-test --allow-root
wp auth0 make_test_pages --allow-root

#
# Convert to headless
#

mkdir wp
mv `\ls -1 ./*.php | grep -v wp-config.php` ./wp/
mv wp-includes wp/wp-includes
mv wp-admin wp/wp-admin
echo "define('WP_USE_THEMES', true);require( './wp/wp-blog-header.php' );" >> index.php

#
# Convert to multisite
#



#
# Options
#

## Link admin to Auth0 user
#wp user meta add 1 auth0_id "$AUTH0_ADMIN_ID"
#
## Activate and configure Auth0
#wp auth0 set_opt domain "$AUTH0_DOMAIN"
#wp auth0 set_opt client_id "$AUTH0_CLIENT_ID"
#wp auth0 set_opt client_secret "$AUTH0_CLIENT_SECRET"
#
## Set auto-login
#wp auth0 set_opt auto_login 1
#wp auth0 set_opt auto_login_method 'twitter'
#
## Allow registrations
#wp option update users_can_register 1 --allow-root

# Apache ON!
apache2-foreground