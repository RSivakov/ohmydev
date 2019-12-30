<?php

namespace App\Commands;

use Illuminate\Console\Scheduling\Schedule;
use LaravelZero\Framework\Commands\Command;
use LaravelZero\Framework\Providers\GitVersion\GitVersionServiceProvider as Service;

class Testmenu extends Command
{
    /**
     * The signature of the command.
     *
     * @var string
     */
    protected $signature = 'init';

    /**
     * The description of the command.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //
        $option = $this->menu('Pizza menu', [
            'Freshly baked muffins',
            'Freshly baked croissants',
            'Turnovers, crumb cake, cinnamon buns, scones',
        ])->open();

        $this->info("You have chosen the option number #$option");

        $this->task("Installing Laravel", function () {
            return true;
        });

        $this->task("Doing something else", function () {
            return false;
        });

        echo shell_exec('sh init_tests.sh');

    }

    /**
     * Define the command's schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule $schedule
     * @return void
     */
    public function schedule(Schedule $schedule): void
    {
        // $schedule->command(static::class)->everyMinute();
    }
}
