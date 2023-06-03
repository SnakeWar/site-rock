<?php

namespace Database\Factories;

use App\Models\City;
use App\Models\CityNeighborhoods;
use App\Models\Post;
use Faker\Core\Number;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $title = Str::random(15);
        $number = new Number();
        $metro_quadrado = $number->numberBetween(300, 1000);
        $metro_quadrado_privado = $metro_quadrado - $metro_quadrado / 100 * 10;
        $city = $number->numberBetween(1, 2);
        $neighborhood = $city == 1 ? $number->numberBetween(1, 2) : $number->numberBetween(3, 4);
        return [
            'title' => $title,
            'description' => Str::random(20) . ' - ' . City::findOrFail($city)->title . ' - ' . CityNeighborhoods::findOrFail($neighborhood)->title,
            'published_at' => now(),
            'body' => Str::random(100),
            'slug' => Str::slug($title),
            'dormitorios' => $number->numberBetween(1, 5),
            'banheiros' => $number->numberBetween(1, 5),
            'vagas_garagem' => $number->numberBetween(1, 5),
            'metro_quadrado_total' => $metro_quadrado,
            'metro_quadrado_privado' => $metro_quadrado_privado,
            'valor' => $number->randomFloat(100000000, 1000000),
            'photo' => 'posts/aATLKkTh30mgj7ov3OFnZMbHRnLyoFJwinyrtbo6.jpg',
            'city_id' => $city,
            'city_neighborhoods_id' => $neighborhood,
            'status' => 1,
            'created_at' => now(),
            'updated_at' => now(),
            'user_id' => 1
        ];
    }
}
