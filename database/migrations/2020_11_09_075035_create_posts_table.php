<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->date('published_at')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->unsignedBigInteger('city_id')->nullable();
            $table->foreign('city_id')->references('id')->on('cities')->onDelete('cascade');
            $table->unsignedBigInteger('city_neighborhoods_id')->nullable();
            $table->foreign('city_neighborhoods_id')->references('id')->on('city_neighborhoods')->onDelete('cascade');
            $table->string('title')->unique();
            $table->longText('photo')->nullable();
            $table->string('slug');
            $table->text('description')->nullable();
            $table->longText('body')->nullable();
            $table->integer('dormitorios')->nullable()
                ->default(0);
            $table->integer('banheiros')->nullable()
                ->default(0);
            $table->integer('vagas_garagem')->nullable()
                ->default(0);
            $table->integer('metro_quadrado_total')->nullable()
                ->default(0);
            $table->integer('metro_quadrado_privado')->nullable()
                ->default(0);
            $table->integer('latitude')->nullable()
                ->default(0);
            $table->integer('longitude')->nullable()
                ->default(0);
            $table->decimal('valor', 15, 2);
            $table->tinyInteger('highlight')->default(0);
            $table->tinyInteger('status')->default(0);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posts');
    }
}
