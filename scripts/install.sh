cd /var/www/html/drupal

# Install site
./vendor/bin/drush site-install -v -y \
    --account-mail="${DRUPAL_ACCOUNT_MAIL}" \
    --account-name="${DRUPAL_ACCOUNT_NAME}" \
    --account-pass="${DRUPAL_ACCOUNT_PASS}" \
    --db-url="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db:3306/${MYSQL_DATABASE}" \
    --site-mail="${DRUPAL_SITE_MAIL}" \
    --site-name="${DRUPAL_SITE_NAME}" \
    --sites-subdir="default" \
    --debug \
    "${DRUPAL_INSTALL_PROFILE}"
