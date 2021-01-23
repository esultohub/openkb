#!/bin/bash

ORG_CONFIG_FILE=/openkb/config.org.json
APP_CONFIG_FILE=/openkb/config/config.json

if [ ! -f "$APP_CONFIG_FILE" ]; then
  cp "$ORG_CONFIG_FILE" "$APP_CONFIG_FILE"
fi

exec npm start