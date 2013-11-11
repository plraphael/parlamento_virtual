#!/bin/bash

# TODO: use a Chef template to generate this file
bundle exec puma -d -C /var/www/parlamentovirtual.org/shared/puma/app.config
