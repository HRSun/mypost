<?php 
class Link
{
    public static function Build($link){
        $base='http://'.getenv('SERVER_NAME');
        
        if(defined('HTTP_SERVER_PORT') && HTTP_SERVER_PORT!='81')
        {
            $base.=':'.HTTP_SERVER_PORT.'/';
        }
        $link=$base.VIRTUAL_LOCATION.$link;
        //print_r($base);print_r(PHP_EOL);
        //print_r($link);print_r(PHP_EOL);
        return htmlspecialchars($link, ENT_QUOTES);
    }
    
    public static function ToPage($pageId)
    {
        $link='index.php?PageId='.$pageId;
        return self::Build($link);
    }

    public static function ToMailFolder($mailboxId)
    {
        //$link= self::ToPage(1);
        $link='index.php?PageId=1&MailboxId='.$mailboxId;
        return self::Build($link);
    }
    
    public static function ToEmail()
    {
        $link='index.php?PageId=1&MailboxId=';
    }
    
    public static function ToContact($contactId)
    {
        $link='index.php?PageId=2&ContactId='.$contactId;
        return self::Build($link);
    }
}
?>

