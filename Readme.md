# Laravel Serverless Installer

A simple laravel installer package that guides you into installing a fully optimised Laravel Serverless app

# Screenshot
![Imgur](https://i.imgur.com/2moR3OF.jpg)

![Imgur](https://i.imgur.com/LblMPTy.jpg)

![Imgur](https://i.imgur.com/bSBoO5V.jpg)

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
  ./vendor/bin/serverless-installer 
  ```

## Run Setup (In Lumen/Laravel)

  ```
  ./vendor/bin/serverless-installer
  ```

## Global Setup (Ubuntu)

Move the `vendor/bin/serverless-installer` to `/usr/bin` or `/usr/local/bin` and then run `serverless-installer` to setup the serverless framework.

## Post Installation (Manual task)

1. Add `'token' => env('AWS_SESSION_TOKEN'),` as a node in your queue.php `sqs` driver. This is running issue in Laravel. You can read more about it [here](https://github.com/laravel/laravel/pull/5138#issuecomment-624025825)
   

![Imgur](https://i.imgur.com/z1FZQgc.jpg)
   

2. Define `AWS_SESSION_TOKEN=` in your env file. Leave its value empty. It just needs to be there. That's it.

3. Next add AWS related env values in your .env file

```
AWS_ACCESS_KEY_ID=<key>
AWS_SECRET_ACCESS_KEY=<secret>
AWS_DEFAULT_REGION=ap-south-1
QUEUE_CONNECTION=sqs
SQS_PREFIX=<you-will-get-this-once-you-deploy-your-app-till-then-you-can-leave-empty>  #put the actual value on second deployment
SQS_QUEUE=<you-will-get-this-once-you-deploy-your-app-till-then-you-can-leave-empty>   #put the actual value on second deployment
ASSET_URL=https://<bucket-name>.s3.ap-south-1.amazonaws.com #required for apps that have front-end and back-end coupled
```
4. For enabling scheduler, open your `Kernal.php` file inside `app/Console.`Inside schedule function add 
````
$schedule->command('telescope:prune --hours=48')->daily()->timezone('Asia/Kolkata'); for pruning telescope logs on daily basis.
````

# Author

[Sagar Chauhan](https://twitter.com/sagarchauhan005) works as a Project Manager - Technology at [Greenhonchos](https://www.greenhonchos.com).
In his spare time, he hunts bug as a Bug Bounty Hunter.
Follow him at [Instagram](https://www.instagram.com/chauhansahab005/), [Twitter](https://twitter.com/chauhansahab005),  [Facebook](https://facebook.com/sagar.chauhan3),
[Github](https://github.com/sagarchauhan005)

# License
MIT
