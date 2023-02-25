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
            $table->string('title')->unique();
            $table->longText('photo')->nullable();
            $table->string('slug');
            $table->text('description')->nullable();
            $table->string('dormitorios');
            $table->string('banheiros');
            $table->string('vagas_garagem');
            $table->string('metro_quadrado_total');
            $table->string('metro_quadrado_privado');
            $table->decimal('valor');
            $table->integer('status')->default(0);
            $table->tinyInteger('highlight')->default(0);
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
