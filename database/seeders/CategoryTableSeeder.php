<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Category;
use App\Models\Attribute;

class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $cats = array(
            [
                'name'=> 'Cat One',
                'parent_id'=> null,
                'banner' => '',
                'icon'=>'',
            ],
            [
                'name'=> 'Cat Two',
                'parent_id'=> null,
                'banner' => '',
                'icon'=>'',
            ],

        );


        foreach ($cats as $value) {
            $check = (new Category())->where('name', $value['name'])->first();
            if (!$check) Category::create($value);
        }

        $attrs = array(
            [
                'name'=> 'Attr One',
                'category_id'=> Category::inRandomOrder()->first()->id,
                'type' => 'detail'
            ],
            [
                'name'=> 'Attr Two',
                'category_id'=> Category::inRandomOrder()->first()->id,
                'type' => 'detail'
            ],

        );


        foreach ($attrs as $value) {
            $check = (new Attribute())->where('name', $value['name'])->first();
            if (!$check) Attribute::create($value);
        }
    }
}
