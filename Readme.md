# Laravel Serverless Installer

A simple laravel installer package that guides you into installing a fully optimised Laravel Serverless app

# Screenshot
![Imgur](https://i.imgur.com/x0cEVtu.jpg)

# Installation

![Imgur](https://i.imgur.com/zsetLNA.jpg)

Run `composer require sagarchauhan/laravel-serverless-installer` into your app and then follow the steps.

### Register Service Provider (Lumen Only)

This is not required in laravel , but if you are in lumen then you have to register service provider in bootstrap/app.php.

```php
$app->register(sagarchauhan\LaravelServerlessServiceProvider::class);
```

## Publishing Config In Laravel

  ```
  php artisan vendor:publish --tag="serverless"
  ```

## Publishing Config In Lumen

  ```
  php artisan sagarchauhan:publish serverless
  ```

## Run Setup in CorePHP

  ```
  ./vendor/sagarchauhan/laravel-serverless-installer/src/sagar-laravel-serverless-installer.sh 
  ```

## Run Setup (In Lumen/Laravel)

  ```
  ./sagar-laravel-serverless-installer.sh 
  ```

# Author

[Sagar Chauhan](https://twitter.com/sagarchauhan005) works as a Project Manager - Technology at [Greenhonchos](https://www.greenhonchos.com).
In his spare time, he hunts bug as a Bug Bounty Hunter.
Follow him at [Instagram](https://www.instagram.com/chauhansahab005/), [Twitter](https://twitter.com/chauhansahab005),  [Facebook](https://facebook.com/sagar.chauhan3),
[Github](https://github.com/sagarchauhan005)

# License
MIT
