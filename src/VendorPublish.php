<?php

namespace sagarchauhan;
use Illuminate\Support\Facades\File;
use Illuminate\Console\Command;

class VendorPublish extends Command
{
    const TAG = "serverless";
    /**
     * The filesystem instance.
     *
     * @var \Illuminate\Filesystem\Filesystem
     */
    protected $files;

    /**
     * The provider to publish.
     *
     * @var string
     */
    protected $provider = null;

    /**
     * The tags to publish.
     *
     * @var array
     */
    protected $tags = [];

    /**
     * The console command signature.
     *
     * @var string
     */
    protected $signature = 'sagarchauhan:publish {asset}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Publish publishable assets from package.';

    /**
     * Create a new command instance.
     *
     * @param  \Illuminate\Filesystem\Filesystem  $files
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle()
    {
        $asset = $this->argument("serverless");
        if($asset == "serverless"){
            File::copy(__DIR__.'/sagar-laravel-serverless-installer.sh', app()->basePath() . '/sagar-laravel-serverless-installer.sh');
            File::copy(__DIR__.'/Makefile', app()->basePath() . '/Makefile');
            $this->info("Publishing complete.");
        }
        else{
            $this->error("Invalid argument");
        }
    }

}
