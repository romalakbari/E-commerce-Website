<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendEmail extends Mailable
{
    use Queueable,SerializesModels;

    public $data;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from($this->data['email'], "Azizi Jobs LLC")
        ->replyTo($this->data['email'], $this->data['fname'])
        ->to('info@azizijobsllc.us', $this->data['fname'])
        ->subject(__('Your friend') . ' ' . $this->data['fname'] . ' ' . __('has shared a link with you'))
        ->view('emails.send_to_friend_message')
        ->with(['data'=>$this->data]);
    }

}
