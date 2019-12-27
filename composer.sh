#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev

brew install php
brew install composer
#curl -sS https://getcomposer.org/installer | php
COMPOSER_MEMORY_LIMIT=-1 composer global update

COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer global require composer/satis
COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require playbloom/satisfy
COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require hirak/prestissimo
# composer require wikimedia/composer-merge-plugins # For MediaWiki




COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require composer/satis # Simple Repository Generator
COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require playbloom/satisfy # Satis composer repository manager with a Web UI
# composer global require cedaro/satispress # Generate a Composer repository from installed WordPress plugins and themes.
# composer global require maximecolin/satisfaction # A PHP implementation of the specification pattern for DDD
COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require realshadow/satis-control-panel # Satis Control Panel (SCP) is a simple web UI for managing your Satis Repository for Composer packages.
# composer global require satispay/magento2-plugin # Satispay Magento2 Plugin
COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require yohang/satis-admin # A simple web-based interface for Satis repositories
COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require aoe/composer-satis-builder # Complementary tool to Satis for updating the satis.json 'require' key from the project composer.json.
# composer global require blazersix/satispress # Generate a Composer repository from installed WordPress plugins and themes.
# composer global require chiarillomassimo/satispay-php-sdk # PHP SDK for Satispay API
# composer global require satispay/gbusiness-api-php-sdk # Satispay GBusiness API PHP SDK
# composer global require satispay/online-api-php-sdk # Satispay Online API PHP SDK
COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require terramar/packages # Packages extends Composer Satis with a management interface and integrations for GitLab and GitHub
COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require instaclick/medusa # A small set of command to maintain a mirror of git repositories and create a local satis repository for composer.
COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer  global require andkirby/satis # Simple Repository Generator



# https://github.com/tommy-muehle/tooly-composer-script
# https://github.com/bamarni/composition
# https://github.com/goatherd/patch-installer

export COMPOSER_MEMORY_LIMIT=-1
which composer
COMPOSER_MEMORY_LIMIT = -1 php /usr/local/bin/composer

# https://stackoverflow.com/questions/36107400/composer-update-memory-limit