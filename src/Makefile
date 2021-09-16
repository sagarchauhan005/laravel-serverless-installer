deploy:
	make local
	php artisan optimize
	composer install --optimize-autoloader --no-dev
	sed -i "/^\(APP_ENV=\).*/s//\1production/" .env
	sed -i "/^\(APP_DEBUG=\).*/s//\1false/" .env
	sed -i "/^\(QUEUE_CONNECTION=\).*/s//\1sqs/" .env
	sed -i "/^\(LOG_CHANNEL=\).*/s//\1stack/" .env
	sed -i "/^\(LOG_LEVEL=\).*/s//\1debug/" .env
	php artisan config:clear
	serverless deploy

local:
	sed -i "/^\(APP_ENV=\).*/s//\1local/" .env
	sed -i "/^\(APP_DEBUG=\).*/s//\1true/" .env
	sed -i "/^\(QUEUE_CONNECTION=\).*/s//\1sqs/" .env
	php artisan optimize
