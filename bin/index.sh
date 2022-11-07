#!/bin/bash

# Exit if any command fails.
set -e

# Install dependencies
composer update
yarn

# Build the project
yarn workspaces run build

# Setup the environment
yarn wp-env start --update

# Update wp configs
yarn wp-env run cli "wp config set JETPACK_DEV_DEBUG true"
yarn wp-env run cli "wp config set WPORG_SANDBOXED 'Local Test Environment'"

# Create the table for locales
yarn wp-env run cli "wp db import wp-content/uploads/data/wporg_locales.sql"

# Activate plugins
yarn wp-env run cli "wp plugin activate gutenberg"
yarn wp-env run cli "wp plugin activate locale-detection"

# Activate theme
yarn wp-env run cli "wp theme activate wporg-login"

# Change permalinks
yarn wp-env run cli "wp rewrite structure '/%postname%/'"

# Enable user registrations
yarn wp-env run cli "wp option set users_can_register 1"

# Create the default pages
yarn wp-env run cli "wp post create --post_type=page --post_status='publish' --post_name='login' --post_title='Login'"
