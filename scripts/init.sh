cd /var/www/html/

TEXT_BOLD=$(tput bold)
TEXT_NORMAL=$(tput sgr0)

# Install Drupal source code
if [ -f composer.json ]; then
  echo "${TEXT_BOLD}Existing Composer files detected: Getting Drupal project dependencies using Composer${TEXT_NORMAL}"
  composer install
else
  echo "${TEXT_BOLD}No Composer files detected: Create a brand new Drupal project code using composer${TEXT_NORMAL}"
  # Create project using composer
  if [ "$DRUPAL_VERSION" = "latest" ]; then
    composer create-project drupal/recommended-project drupal
  else
    composer create-project drupal/recommended-project:"${DRUPAL_VERSION}" drupal
  fi

  # Add drush to project
  cd drupal
  composer require drush/drush
fi

# Create files directory
mkdir -p /var/www/html/drupal/web/sites/default/files && chmod -R 777 /var/www/html/drupal/web/sites/default/files

# Change owner
chown -R dev:dev .

# Create settings files
cp /var/www/html/scripts/stuff/default.settings.php /var/www/html/drupal/web/sites/default/settings.php
chown www-data /var/www/html/drupal/web/sites/default/settings.php
