<?php

class NewEmail {

    public $mResult;
    public $mReply;
    public $mFrom;

    public function __construct() {
        //var_dump("new email");
    }

    public function init() {
        if (isset($_POST['email_send'])) {
            //var_dump($_SESSION['user_email']);
            $user_email = $_SESSION['user_email'];
            $email_to = $_POST['email_to'];
            $email_subject = $_POST['email_subject'];
            $email_message = $_POST['email_message'];
            $email_message = str_replace("\n.", "\n..", $email_message);
            //print_r("new email");
            //$user_email='user1@mypost.xy';
            //$email_to='user2@mypost.xy';
            //$email_message='subject11';
            //$email_message='dsfsdf';
            $email_headers = "Content-type:text/plain; charset=utf-8; \r\n";
            $email_headers .= "From: " . $user_email . "\r\n";
            //$email_headers .= "Return-Path: " . $user_email . "\r\n";
            $email_headers .= "Reply-To: " . $user_email . "\r\n";
            // $email_headers .= "X-Mailer: PHP".phpversion();
            //$headers = "Content-type:text/plain; charset=utf-8; \r\n";
            //$headers .= "From: $name <$email>"; 

            $this->mResult = mail($email_to, $email_subject, $email_message, $email_headers); //, "f $user_email");

            //echo "<pre>";
            //var_dump($user_email);
            //var_dump($email_to);
            //var_dump($email_subject);
            //var_dump($email_message);
            //var_dump($email_headers);
            //var_dump($this->mResult);
            //echo "</pre>";
        }

        if (isset($_POST['reply_message'])) 
        {
            //$this->mReply=array($_POST['reply_to'], $_POST['reply_subject'], $_POST['reply_message_text']);
            $messageId=$_POST['reply_message_id'];
            
            $user_email=$_SESSION['user_email'];
            $this->mReply= MailFile::MailContentRead($user_email,$messageId);
            $this->mFrom= $this->mReply['from'];
            
            //Format reply text
            $text= explode("\n",$this->mReply['text']);
            for($i=0; $i<count($text)-1; $i++)
            {
                $text[$i]="\t| ".$text[$i];
            }
            $text= implode($text);
            
            
            
            $date="\n\n\t| Date: ".$this->mReply['date']."\n";
            $from="\t| From: ".$this->mReply['from']."\n";
            $email_to="\t| To: ".$user_email."\n";
            $subject="\t| Subject: ".$this->mReply['subject']."\n\n";
            $text2=$date.$from.$email_to.$subject;
            $text2.=$text;            
            $this->mReply['text']= $text2;
            $this->mReply['subject']="Re: ". $this->mReply['subject'];
            
            //echo "\n\nNew email:\n";
            //echo "<pre>";
            //var_dump($this->mReply);           
            //var_dump($text);
            //echo $date;
            //$this->mReply['text']="| ";
            //$this->mReply['text']="\n| ";
            //$this->mReply['text']="\n| ";
            //$this->mReply['text']="\n| ";           
            
            //var_dump($this->mReply['text']);
            //echo "</pre>";
        }
    }

}
?>

