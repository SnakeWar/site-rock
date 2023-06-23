<?php

namespace App\View\Composers;

use App\Models\Configuration;
use App\Models\Post;

class ConfigurationComposer
{
    /**
     * Create a new profile composer.
     */
    public function __construct(
        protected Configuration $configurations,
        protected Post $post
    ) {}

    /**
     * Bind data to the view.
     */
    public function compose($view)
    {
        $maiorPreco = $this->post->max('valor');
        $menorPreco = $this->post->min('valor');
        $result = $this->configurations
            ->orderBy('code')
            ->get();
        foreach($result as $it) {
            $configuration[$it['code']] = $it['value'];
        }
        return $view->with('configuration', $configuration)->with('maiorPreco', $maiorPreco)->with('menorPreco', $menorPreco);
    }
}
