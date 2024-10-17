<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Hash;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
            $check = (new User())->where('email', 'admin@admin.com')->first();
            if (!$check) User::create([
                'name' => 'admin',
                'email' => 'admin@admin.com',
                'password' => Hash::make('password')
            ]);
    }
}
