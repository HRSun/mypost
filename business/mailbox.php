<?php 
class MailBox {
    
    public static function GetPages()
    {
        $sql='CALL get_pages()';
        //print_r(DatabaseHandler::GetAll($sql));
        return DatabaseHandler::GetAll($sql);
    }

    public static function GetMailbox($user_email) {
        $sql = 'CALL get_mailbox_folder_contacts(:user_email)';
        $params=array(':user_email'=>$user_email);
        
        //$mailbox=array(array('folder_name'=>'INBOX','sender_name'=>'other')); 
        $inbox=array('contact_id'=>0,'folder_name'=>'INBOX','contact_email'=>'other');
        $mailbox=DatabaseHandler::GetAll($sql, $params);
        $trashbox=array('contact_id'=>99999,'folder_name'=>'Trashbox','contact_email'=>'other');
        
        $temp=array(array($inbox));
        $temp= array_merge(array(array($trashbox)), $temp);
        
        $req = array_merge(array($inbox),$mailbox,array($trashbox));
        
        //echo "<pre>";
        //print_r($req);
        //echo "</pre>";
        
        return $req;
    }
    
    public static function GetAllMailUser($user_email)
    {
        $sql='CALL get_all_email_user(:user_email)';
        $params=array(':user_email'=>$user_email);
        
        return DatabaseHandler::GetAll($sql, $params);
    }
    
    
    public static function GetAllMailUserFolder($user_email, $contact_id)
    {
        if($contact_id!=0)
        {
        $sql = 'CALL get_accountid_via_user_email(:user_email)';
        $params = array(':user_email'=>$user_email);
        $account_id = DatabaseHandler::GetOne($sql, $params);
        
        $sql='CALL get_contactemail_via_contactid(:contact_id)';
        $params=array(':contact_id'=>$contact_id);
        $contact_email= DatabaseHandler::GetOne($sql, $params);
        
        $sql='CALL get_emails_current_folder(:account_id, :contact_email)';
        $params=array(':account_id'=>$account_id, ':contact_email'=>$contact_email);
        $result= DatabaseHandler::GetAll($sql, $params);        
        }
        elseif($contact_id==0)
        {
            //echo "\n<pre>INBOX ID: ";
            //var_dump($contact_id);
            //echo "</pre>\n";
            
            $sql='CALL get_email_user_folder(:user_email)';
            $params=array(':user_email'=>$user_email);        
            $res=DatabaseHandler::GetAll($sql, $params);
            
            //echo "\n<pre>INBOX result:";
            //var_dump($res);
            //echo "</pre>\n";
            
            $result=array();
            for($i=0; $i<count($res); $i++)
            {
                if($res[$i]['folder_name']===NULL)
                        array_push ($result, $res[$i]);
            }
        }
        
        //echo "<pre>";
        //print_r($result);
        //echo "</pre>";
        
        return $result;
        //$sql='CALL get_email_user_folder(:user_email)';
        //$params=array(':user_email'=>$user_email);        
        //return DatabaseHandler::GetAll($sql, $params);
    }
    
    public static function IsFolderExist($current_user_email,$folder_name)
    {
        //$sql='CALL return_folder_name_for_user_if_exist(:current_user_email, :user_email)';
        //$params=array(':current_user_email'=>$current_user_email, ':user_email'=>$user_email);
        
        $sql='CALL get_account_id_via_email(:current_user_email)';
        $params=array(':current_user_email'=>$current_user_email);
        
        $result= DatabaseHandler::GetOne($sql, $params);       
                
        $sql='CALL get_folder_name_if_exist(:contact_id, :folder_name)';
        $params=array(':contact_id'=>$result, ':folder_name'=>$folder_name);
        
        $result= DatabaseHandler::GetAll($sql, $params);        
               
        return $result;
    }

    public static function CreateFolder($current_user_email,$user_email,$create_folder_name)
    {
        $sql='CALL get_account_id_via_email(:current_user_email)';
        $params=array(':current_user_email'=>$current_user_email);        
        $result= DatabaseHandler::GetOne($sql, $params);   
        
        $sql='CALL create_folder_name(:account_id, :user_email, :folder_name)';
        $params=array(':account_id'=>$result,
                  ':user_email'=>$user_email, 
                  ':folder_name'=>$create_folder_name);
    
        DatabaseHandler::Execute($sql, $params);
        
        
    }
}
?>

