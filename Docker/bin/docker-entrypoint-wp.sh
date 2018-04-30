#!/bin/sh

wait-for.sh db:3306

wp core install --url=http://localhost \
    --title="Auth0 ♥ WordPress" \
    --admin_user="$ADMIN_EMAIL" \
    --admin_email="$ADMIN_EMAIL" \
    --admin_password="$ADMIN_PASS" --skip-email --allow-root

wp rewrite structure "/%postname%/" --allow-root
wp rewrite flush --allow-root
wp option update users_can_register 1 --allow-root
wp theme activate auth0-wp-test --allow-root
wp auth0 make_test_pages --allow-root

apache2-foreground