#!/bin/bash

RED="\033[1;31m\n"
NOCOLOR="\033[0m\n"
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

SERVERLESS_FILE="serverless.yml"
ENV_FILE=".env"

sleep 1
printf "${YELLOW}Let's start setting up your serverless app${NOCOLOR}"

sleep 1
printf "${YELLOW}Let's begin with installing required dependencies${NOCOLOR}"

sleep 1
printf "${YELLOW}Installing Serverless${NOCOLOR}"
npm install -g serverless

sleep 1
printf "${YELLOW}Installing AWS-CLI${NOCOLOR}"
sudo apt-get install awscli

sleep 1
printf "${YELLOW}Installing Serverless-Lift${NOCOLOR}"
npm install serverless-lift

sleep 1
printf "${YELLOW}Installing Bref and Laravel Bridge${NOCOLOR}"
composer require bref/bref bref/laravel-bridge --update-with-dependencies

sleep 1
printf "${YELLOW}Publish Serverless Config${NOCOLOR}"
php artisan vendor:publish --tag=serverless-config

sleep 1
printf "${YELLOW}Environment variable configured${NOCOLOR}"
sed -i "/^\(APP_ENV=\).*/s//\1production/" $ENV_FILE
sed -i "/^\(APP_DEBUG=\).*/s//\1false/" $ENV_FILE
sed -i "/^\(QUEUE_CONNECTION=\).*/s//\1sqs/" $ENV_FILE
sed -i "/^\(LOG_CHANNEL=\).*/s//\1stack/" $ENV_FILE
sed -i "/^\(LOG_LEVEL=\).*/s//\1debug/" $ENV_FILE

sleep 1
printf "${YELLOW}Copying kartmax serverless file${NOCOLOR}"
cp "vendor/sagarchauhan/laravel-serverless-installer/src/serverless.yml" $SERVERLESS_FILE

# Setup service
sleep 1
printf "${YELLOW}Enter a VERY UNIQUE name for this lambda service. This shall help in tracking different services and their config.${NOCOLOR}"
read -r service_unique_name
sleep 0.5
# set client service name
sed -i "/^\([[:space:]]*service: \).*/s//\1$service_unique_name/" $SERVERLESS_FILE

sleep 1
printf "${YELLOW}Lets setup up AWS CLI for your local system.${NOCOLOR}"
sleep 1
printf "${YELLOW}Keep your AWS_ACCESS_KEY and AWS_SECRET_KEY handy or ask your DevOps to provide you one.${NOCOLOR}"
sleep 1
aws configure

printf "${GREEN}Setup complete${NOCOLOR}"
printf "${GREEN}....................${NOCOLOR}"

sleep 1
printf "${YELLOW}To deploy your serverless app run :${NOCOLOR}"
printf "${GREEN}make deploy${NOCOLOR}"

sleep 1
printf "${GREEN}....................${NOCOLOR}"
printf "${YELLOW}To configure your app for local environment :${NOCOLOR}"
printf "${GREEN}make local${NOCOLOR}"

sleep 1
printf "${GREEN}....................${NOCOLOR}"
printf "${YELLOW}To access your lambda logs directly, please install Bref Dashboard :${NOCOLOR}"
printf "${GREEN}Visit https://dashboard.bref.sh/ and download the deb package for linux${NOCOLOR}"
