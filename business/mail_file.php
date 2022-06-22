<?php

//require_once('MimeMailParser.class.php');
require_once SITE_ROOT . '/vendor/autoload.php';

class MailFile {

    public static function MailHeaderRead($user_email, $mailbox_id) {

        $usermail_folder = MAIL_FOLDER . '/' . explode('@', $user_email)[0];
        $email_user_mails = MailBox::GetAllMailUserFolder($user_email, $mailbox_id);

        //echo "<pre>";
        //print_r($email_user_mails);
        //echo "</pre>";

        foreach ($email_user_mails as $key => $value) {

            $current_mail_folder = $usermail_folder . '/' . substr($value['messagefilename'], 1, 2);
            $mail_current = $current_mail_folder . '/' . $value['messagefilename'];            
            
            $parser = new PhpMimeMailParser\Parser();
            $header= self::MailRead($parser->setPath($mail_current));
            $email_user_mails[$key]['messagesubject'] = $header['subject'];            
            $email_user_mails[$key]['messagefrom'] = $header['from'];
        }        
        return $email_user_mails;
    }

    public static function MailContentRead($user_email, $messageId) {
        $usermail_folder = MAIL_FOLDER . '/' . explode('@', $user_email)[0];
        $current_mail_folder = $usermail_folder . '/' . substr($messageId, 1, 2);

        $parser = new PhpMimeMailParser\Parser();
        $path=$current_mail_folder . '/' . $messageId;
        //echo "\n\n<pre>PATH: ";
        //var_dump($path);
        //echo "\nMessageId: ";
        //var_dump($messageId);
        //echo "</pre>\n\n";
        
        $mail_all= self::MailRead($parser->setPath($path), $messageId, true);
        return $mail_all;
    }
    
    private static function MailRead($parser, $messageId=NULL, $text_need=NULL)
    {
        //echo "<pre>";
        //var_dump($parser);
        //echo "</pre>";
        
        $from1 = $parser->getHeader('from');
        $addressesFrom = $parser->getAddresses('from');
        $from2=$addressesFrom[0]['address'];
        $stringHeaders = $parser->getHeadersRaw();
        $arrayHeaders = $parser->getHeaders();
        
        $from = NULL;
        if (strlen(htmlspecialchars($arrayHeaders['from']))!==0) 
        {
                                    
            $from = str_replace(array( '&lt;', '&gt;' ), '', htmlspecialchars($arrayHeaders['from']));            
            $from= explode(' ', $from);
            $from= array_pop($from);
            
            //echo "str_word_count:".str_word_count($from, 0);
            //$from = strstr($from, ' ');
            
            //echo "<pre>From(mailfile1):";
            //var_dump($from);
            //echo "</pre>";            
        }         
        elseif (!empty($addressesFrom[0]['address']))
        {            
            $from = str_replace(array( '&lt;', '&gt;' ), '', htmlspecialchars($addressesFrom[0]['address']));
            $from= explode(' ', $from);
            $from= array_pop($from);
            //echo "<pre>From(mailfile2):";
            //var_dump($from);
            //echo "</pre>";
        } 
        elseif(is_array($arrayHeaders['return-path']) && strlen(htmlspecialchars($arrayHeaders['return-path'][1]!==0)))
        {
            $from = str_replace(array('&lt;', '&gt;'), '', htmlspecialchars($arrayHeaders['return-path'][1]));
            $from= explode(' ', $from);
            $from= array_pop($from);
            //echo "<pre>From(mailfile3):";
            //var_dump($from);
            //echo "</pre>";
        }
        else
        {
            $from = str_replace(array('&lt;', '&gt;'), '', htmlspecialchars($arrayHeaders['return-path']));
            
            $from= explode(' ', $from);
            $from= array_pop($from);
            
            //echo "<pre>From(mailfile4):";
            //var_dump($from);
            //echo "</pre>";
        }

        //echo "<pre>From(mailfile:end:): ";
        //var_dump($from);
        //echo "</pre>";

        $sql='CALL get_message_date_time_by_messageid(:messageId)';
        $params =array(':messageId'=>$messageId);
        $date = DatabaseHandler::GetOne($sql, $params);
        
        $text = array('messageId' => $messageId);
        $text = array_merge($text, array('subject' => $parser->getHeader('subject')));
        $text = array_merge($text, array('from' => $from));
        
        if($text_need)
            $text = array_merge($text, array('text' => $parser->getMessageBody('text')));
        
        $text = array_merge($text, array('date' => $date));
        
        return $text;
    }
}
?>

