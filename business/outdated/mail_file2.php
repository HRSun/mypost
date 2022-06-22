<?php

//require_once('MimeMailParser.class.php');
require_once SITE_ROOT.'/vendor/autoload.php';
class MailFile {

    public static function MailHeaderRead($user_email) {

        $usermail_folder = MAIL_FOLDER . '/' . explode('@', $user_email)[0];

        $email_user_mails = MailBox::GetAllMailUserFolder($user_email);
        //echo "<pre>";
        //print_r($email_user_mails);
        //echo "</pre>";

        $parser = new PhpMimeMailParser\Parser();
        $parser->setPath('M:\www\mypost\hmail\Data\mypost.xy\user2\8F/{8F041DC5-2D5A-4129-9067-895273FEC052}.eml');
        $rawHeaderTo = $parser->getHeader('return-path');
        $rawHeaderFrom = $parser->getHeader('subject');
        $text = $parser->getMessageBody('text');
        $html = $parser->getMessageBody('html');
        $htmlEmbedded = $parser->getMessageBody('htmlEmbedded');
        echo "<pre>";
        //var_dump($parser);
        //print_r($htmlEmbedded);
        //print_r($html);
        //print_r($rawHeaderTo);
        //print_r($rawHeaderFrom);
        print_r($text);
        echo "</pre>";
        
        foreach ($email_user_mails as $key => $value) {
            //echo "<pre>";
            //print_r($key);
            //print_r($value);
            //echo "</pre>";
            $current_mail_folder = $usermail_folder . '/' . substr($value['messagefilename'], 1, 2);
            $mail_current=$current_mail_folder . '/' . $value['messagefilename'];
            $parser = new PhpMimeMailParser\Parser();
            $parser->setPath($mail_current);
            $rawHeaderFrom = $parser->getHeader('subject');
            $email_user_mails[$key]['messagesubject']=$rawHeaderFrom;
            //$eml = mailparse_msg_parse_file($mail_current);//resource
            //$struct = mailparse_msg_get_structure($eml);//array

            foreach ($struct as $st) {
                $section = mailparse_msg_get_part($eml, $st);//resource
                $info = mailparse_msg_get_part_data($section);//array
                echo "<pre>";
                //print_r($st);
                //print_r($info);
                //print_r($section);
                echo "</pre>";
                //$subject=$info['headers']['subject'];
                //echo "<pre>";
                //print_r("Subject:".$subject);
                //echo "</pre>";
                //$email_user_mails[$key]['messagesubject']=$info['headers']['subject'];
                //echo "<pre>";
                //print_r($email_user_mails);
                //echo "</pre>";
                
            }            
        }
        //print_r($usermail_folder);
        return $email_user_mails;
    }

    public static function MailContentRead($user_email, $messageId)
    {
        $usermail_folder = MAIL_FOLDER . '/' . explode('@', $user_email)[0];
        $current_mail_folder = $usermail_folder . '/' . substr($messageId, 1, 2);
        
        $parser = new PhpMimeMailParser\Parser();
        $parser->setPath($current_mail_folder . '/'.$messageId);

        $text=$parser->getMessageBody('text');
        echo "<pre>";
        print_r($text);
        echo "</pre>";
        
        return $parser->getMessageBody('text');
        
        $eml = mailparse_msg_parse_file($current_mail_folder . '/'.$messageId);
        $struct = mailparse_msg_get_structure($eml);
        
        foreach ($struct as $st) {
                $section = mailparse_msg_get_part($eml, $st);
                $info = mailparse_msg_get_part_data($section);
                echo "<pre>";
                //print_r($info);
                echo "</pre>";
        }
        
        $msgbody=mailparse_msg_extract_part_file($eml, $current_mail_folder . '/'.$messageId, NULL);
        $msgbody=mb_convert_encoding($msgbody, 'UTF-8');
        echo "<pre>";
        //print_r($current_mail_folder . '/'.$messageId);
        //print_r($msgbody);
        echo "</pre>";
        
        
        
    }
    public static function MailContentCallback($string)
    {
        echo "<pre>";
        print_r($string);
        echo "</pre>";
    }
}
?>

