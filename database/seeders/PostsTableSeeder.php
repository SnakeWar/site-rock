<?php

namespace Database\Seeders;

use App\Models\Post;
use App\Traits\UploadTraits;
use Faker\Core\Number;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Intervention\Image\Image;
use PhpParser\Node\Scalar\String_;

class PostsTableSeeder extends Seeder
{
    use UploadTraits;
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Post::factory(50)->create();
    }
}
