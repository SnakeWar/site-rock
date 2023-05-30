<?php

namespace App\View\Composers;

use App\Models\Configuration;

class ConfigurationComposer
{
    /**
     * Create a new profile composer.
     */
    public function __construct(
        protected Configuration $configurations,
    ) {}

    /**
     * Bind data to the view.
     */
    public function compose($view)
    {
        $result = $this->configurations
            ->orderBy('code')
            ->get();
        foreach($result as $it) {
            $configuration[$it['code']] = $it['value'];
        }
        return $view->with('configuration', $configuration);
    }
}
