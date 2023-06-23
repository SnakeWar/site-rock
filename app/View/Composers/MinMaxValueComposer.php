<?php

namespace App\View\Composers;

use App\Models\Post;

class MinMaxValueComposer
{
    /**
     * Create a new profile composer.
     */
    public function __construct(Post $post)
    {
        $this->post = $post;
    }

    /**
     * Bind data to the view.
     */
    public function compose($view)
    {
        $maiorPreco = $this->post->max('valor');
        $menorPreco = $this->post->min('valor');
//        dd($menorPreco, $maiorPreco);
        return $view->with('maiorPreco', $maiorPreco)->with('menorPreco', $menorPreco);
    }
}
