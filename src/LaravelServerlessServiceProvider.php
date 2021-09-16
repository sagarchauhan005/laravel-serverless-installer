<?php

namespace sagarchauhan\LaravelServerlessServiceProvider;
use Illuminate\Support\ServiceProvider;

class LaravelServerlessServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {

    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
            $this->publishes([
                __DIR__.'/sagar-laravel-serverless-installer.sh' =>  app()->basePath() . '/sagar-laravel-serverless-installer.sh',
            ]);
    }
}
