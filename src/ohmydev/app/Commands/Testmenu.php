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
        $option = $this->menu('Что сделаем?', [
            '0 - Обновим бинарник',
            '1 - Installing Laravel',
            '2 - Doing something else',
            '3 - Дернуть ссылку'
        ])->open();


        switch ($option) {
            case 0:
                echo shell_exec('cd ../../ && sh update_laravel_bin_app.sh');
            break;

            case 1:
                $this->task("Installing Laravel", function () {
                    return true;
                });
            break;

            case 2:
                $this->task("Doing something else", function () {
                    return false;
                });
            break;

            case 3:
                $this->info("You have chosen the option number #$option");
                $this->browse(function ($browser) {
                    $browser->visit("https://laravel.com")
                        ->assertSee("Laravel");
                });
            break;
        }









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
