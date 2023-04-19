<?php

namespace App\View\Composers;

use App\Models\Configuration;
use Illuminate\View\View;

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
    public function compose(View $view): void
    {
        $view->with(
            'configuration_head',
            () => {
                $result = $this->configurations
                    ->whereCode('APP_DESCRIPTION')
                    ->whereCode('APP_APP_NAME')
                    ->whereCode('APP_EMAIL')
                    ->whereCode('APP_INSTAGRAM')
                    ->whereCode('APP_URL')
                    ->whereCode('APP_WHATSAPP')
                    ->orderBy('code')
                    ->get();
                return array_map(function ($it) {
                    return [$it->code => $it->value];
                }, $result);
            }
        );
    }
}
