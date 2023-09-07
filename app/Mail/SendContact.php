<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
//use Illuminate\Support\Facades\Auth;

class SendContact extends Mailable
{
    //use Queueable, SerializesModels;

    //public $user;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {

        $this->dados = $data;
        //var_dump($this->dados['email']); exit;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        //var_dump($this->dados); exit;
        return $this->from('contato@viniciusaraujoimoveis.com.br')
                    ->replyTo(mb_strtolower($this->dados['email']))
                    ->subject('Formulário do Site')
                    ->markdown('mail.SendContact')
                    ->with([
                        'name'      => ucwords(mb_strtolower($this->dados['name'])),
                        'email'     => mb_strtolower($this->dados['email']),
                        'telephone'      => ucwords(mb_strtolower($this->dados['telephone']))
                    ]);
    }
}
