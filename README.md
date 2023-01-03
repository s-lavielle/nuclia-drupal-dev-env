# Setup

## Pull from GitHub
  ```
  git clone git@github.com:s-lavielle/nuclia-drupal-dev-env.git <my-project-dir>
  ```
then go into your project directory

  ```
  cd <my-project-dir>
  ```
## remove `.git` dir

  ```
  rm -rf .git
  ```
## Create env files
  Copy `docker.env.dist` file to `docker.env` and `.env.dist` file to `.env`

  ```
  cp docker.env.dist docker.env && cp .env.dist .env`
  ```

  and update settings variable into copied file.

## Build, and install
  Execute following commands :
  * [Build and/or run stack](#cmd-build-run-stack)
  * [Initialize Drupal site code base](#cmd-init-drupal-codebase)
  * [Install drupal site](#cmd-install-drupal-site)

## Clone local packages

  ```
  cd local-packages
  git clone git@github.com:makinacorpus/nucliadb-php-client.git
  git clone git@git.drupal.org:project/search_api_nuclia.git
  ```
## Change composer.json "minimum-stability" property
  Edit `drupal/composer.json` and change :
  ```
  "minimum-stability": "stable",
  ```
  to :
  ```
  "minimum-stability": "dev",
  ```
## Update composer.json repositories for local packages

  Edit `drupal/composer.json` file, go to the `repositories` section. It should look like this:

  ```
  "repositories": [
      {
          "type": "composer",
          "url": "https://packages.drupal.org/8"
      }
  ],
  ```
  And add local `nucliadb-php-client` package repository. After being modified, it should look like this:
  ```
  "repositories": [
      {
          "type": "composer",
          "url": "https://packages.drupal.org/8"
      },
      {
          "type": "path",
          "url": "/var/www/html/local-packages/nucliadb-php-client"
      }
  ],
  ```
## Require module `Search API` module and `nucliadb-php-client` library using composer

  ```
  docker compose exec --user dev drupal composer require --working-dir /var/www/html/drupal drupal/search_api
  docker compose exec --user dev drupal composer require --working-dir /var/www/html/drupal makina-corpus/nucliadb-php-client:dev-master
  ```

## Create symlink to `search_api_nuclia` dev module
  ```
  docker compose exec --user dev drupal ln -s /var/www/html/local-packages/search_api_nuclia /var/www/html/drupal/web/modules/search_api_nuclia
  ```

## Install Drupal modules
  ```
  docker compose exec --user dev drupal drupal/vendor/bin/drush -y  en search_api_nuclia
  ```

## Configure module.

  At this point Drupal installation is done, just configure module as described in module README.md file

# Useful commands

## <a name="cmd-build-run-stack">Build and/or run stack</a>
```docker compose up -d```

## <a name="cmd-init-drupal-codebase">Initialize Drupal site code base</a>
```docker compose exec drupal sh scripts/init.sh```

## <a name="cmd-install-drupal-site">Install drupal site</a>
```docker compose exec drupal sh scripts/install.sh```

## Connect to drupal container using ssh with dev user
```docker compose exec --user dev drupal bash```

## Run drush command
```docker compose exec --user dev drupal drupal/vendor/bin/drush <drush-command>```

Some examples:
```docker compose exec --user dev drupal drupal/vendor/bin/drush status```
```docker compose exec --user dev drupal drupal/vendor/bin/drush uli```

## Run composer command
```docker compose exec --user dev drupal composer require drupal/admin_toolbar```

## Override drupal system.site uuid
```docker compose exec drupal sh scripts/uuid.sh```

## Stop stack
```docker compose stop```


