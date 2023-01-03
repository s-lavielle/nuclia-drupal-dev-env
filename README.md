# Setup

## Pull from GitHub
  ```
  git clone git@github.com:s-lavielle/drupal-docker-env.git <my-project-dir>
  ```
then go into your project directory

  ```
  cd <my-project-dir>
  ```
## optionally remove `.git` dir

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
```docker compose exec --user dev drupal vendor/bin/drush <drush-command>```

Some examples:
```docker compose exec --user dev drupal vendor/bin/drush status```

## Run composer command
```docker compose exec --user dev drupal composer require drupal/admin_toolbar```

## Override drupal system.site uuid
```docker compose exec drupal sh scripts/uuid.sh```

## Stop stack
```docker compose stop```


