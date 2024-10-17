<?php


namespace App\Traits;


use Carbon\Carbon;

trait MailTrait
{

    private string $message = '';
    private string $to = "";
    private string $subject = "";
    private string $from = "";
    private array $headers = [];
    private string $password = '';


    /**
     * Send mail
     * @return bool
     */
    public function send(): bool
    {
        try {
            if (empty($headers))
                $this->headers = $this->defaultHeaders();

            if (empty($message))
                $this->message = $this->defaultMessage();

            mail($this->to, $this->subject, $this->message, implode("\r\n", $this->headers));
            return true;
        } catch (\Exception $exception) {
            return false;
        }
    }


    /**
     * Set user password
     * @param string $password
     * @return $this
     */
    public function setPassword(string $password)
    {
        $this->password = $password;
        return $this;
    }

    /**
     * Set mail subject
     * @param string $subject
     * @return $this
     */
    public function setSubject(string $subject)
    {
        $this->subject = $subject;
        return $this;
    }


    /**
     * Set from email
     * @param string $from
     * @return $this
     */
    public function setFrom(string $from)
    {
        $this->from = $from;
        return $this;
    }


    /**
     * Set mail headers
     * @param array $headers
     * @return $this
     */
    public function setHeaders(array $headers)
    {
        $this->headers = $headers;
        return $this;
    }

    /**
     * Set mail message
     * @param string $message
     * @return $this
     */
    public function setMessage(string $message)
    {
        $this->message = $message;
        return $this;
    }


    /**
     * Set the email which you want to send mail
     * @param string $to
     * @return $this
     */
    public function to(string $to)
    {
        $this->to = $to;
        return $this;
    }


    private function defaultMessage()
    {
        return '
                <html>
                <head>
                  <title>Al Ad Hoor Account Password</title>
                </head>
                <body>
                  <h1>Your Al Ad Hoor Password is</h2>
                  <p> ' . $this->password . ' </p>
                  <p> ' . Carbon::now()->toDateTimeString() . ' </p>
                </body>
                </html>
                ';
    }

    /**
     * Default mail headers
     * @return array
     */
    private function defaultHeaders()
    {
        $headers[] = 'MIME-Version: 1.0';
        $headers[] = 'Content-type: text/html; charset=iso-8859-1';
        $headers[] = 'To: ' . $this->to . '';
        $headers[] = 'From: ' . $this->from . '';
        return $headers;
    }
}
