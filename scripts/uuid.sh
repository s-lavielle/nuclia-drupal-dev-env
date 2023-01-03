cd /var/www/html/

if test -f config/sync/system.site.yml; then
    UUID="$(grep 'uuid: ' config/sync/system.site.yml|sed 's/uuid: //')"
    vendor/bin/drush cset system.site uuid "$UUID" -y
    echo "\"$UUID\" set as system.site uuid."
else
  echo "Fail getting uuid: \"config/sync/system.site.yml\" does not exist."
  exit 1
fi


