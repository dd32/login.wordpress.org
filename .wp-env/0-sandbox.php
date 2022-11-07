<?php
// This file handles special loading of mu-plugins.

define( 'GLOTPRESS_LOCALES_PATH', WPMU_PLUGIN_DIR . '/pub/locales/locales.php' );

require_once WPMU_PLUGIN_DIR . '/pub/locales.php';
require_once WPMU_PLUGIN_DIR . '/wporg-mu-plugins/mu-plugins/loader.php';
require_once WPMU_PLUGIN_DIR . '/wporg-sso/wp-plugin.php';
