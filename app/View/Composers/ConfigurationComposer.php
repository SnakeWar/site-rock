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
            ->whereCode('APP_DESCRIPTION')
            ->orWhere('code', 'APP_NAME')
            ->orWhere('code', 'APP_EMAIL')
            ->orWhere('code', 'APP_INSTAGRAM')
            ->orWhere('code', 'APP_URL')
            ->orWhere('code', 'APP_WHATSAPP')
            ->orderBy('code')
            ->get();
        foreach($result as $it) {
            $configuration[$it['code']] = $it['value'];
        }
        return $view->with('configuration', $configuration);
    }
}
