<?php

class MailUser
{

public static function IsAuthenticated()
{
    if(!(isset($_SESSION['auth_id'])))
        return 0;
    else
        return 1;
}

public static function GetLoginInfo($email)
{
    $sql='CALL mailuser_get_login_info(:email)';
    $params=array(':email'=>$email);
    
    return DatabaseHandler::GetRow($sql, $params);
}

public static function IsValid($email, $password)
{
        $mailuser= self::GetLoginInfo($email);
        $validret=array();
        $errorcode=0;
        if(empty($mailuser['accountid']))
        {
            $errorcode=2;
            return $validret=["ErrorCode"=>$errorcode, "MailUser"=>$mailuser];
            //return 2;
        }
        
        $mailuser_id=$mailuser['accountid'];
        
        $hashed_password=$mailuser['accountpassword'];
        
        if(md5($password) != $hashed_password)
        {
            $errorcode=1;
            return $validret=["ErrorCode"=>$errorcode, "MailUser"=>$mailuser];   
        }            
        else
        {
            $_SESSION['auth_id']=$mailuser_id;
            $_SESSION['user_email']=$email;
            $errorcode=0;
            return $validret=["ErrorCode"=>$errorcode, "MailUser"=>$email];
        }        
        //return $mailuser;
}

public static function RegisterNewAccount($new_account_email, $new_account_password)
{
    //$result= self::GetLoginInfo($newAcc);
    
    $sql='CALL get_accountid_via_user_email(:newEmail)';
    $params=array(':newEmail'=>$new_account_email);
    $result=(int) DatabaseHandler::GetOne($sql, $params);
    
     //echo "<pre>line:".__LINE__.":check account: ";
     //var_dump($result);
     //echo ":check end:</pre>";
    
    if(empty($result))
    {
        //echo "<pre>:in1:";
        //var_dump($result);
        //echo ":in1:</pre>";
        
        $new_account_password=md5($new_account_password);
        $sql='CALL create_account(:new_account_email, :new_account_password)';
        $params=array(':new_account_email'=>$new_account_email,
                         ':new_account_password'=>$new_account_password);           
        DatabaseHandler::Execute($sql, $params);
        
        $sql='CALL get_account_id_via_email(:new_account_email)';
        $params=array(':new_account_email'=>$new_account_email);
        $imap_folder_id= DatabaseHandler::GetOne($sql, $params);
        
        $sql='CALL create_imapfolder_id(:imap_folder_id)';
        $params=array(':imap_folder_id'=>$imap_folder_id);
        $result= DatabaseHandler::Execute($sql, $params);
        
        //echo "<pre>line:".__LINE__.":in2:";
        //var_dump($result);
        //echo ":in2:</pre>";
        
    }
    else
    {
        $accExisted='Account '.$new_account_email.' existed';
        
        //echo "<pre>line:".__LINE__.":Account existed:";
        //var_dump($accExisted);
        //echo ":</pre>";
        
        return $accExisted;
        //exit();
        
        
    }
    
    
    //$_SESSION['auth_id']='1';
    //$_SESSION['user_email']='user1@mypost.xy';
    
}

public static function Logout()
{
    unset($_SESSION['auth_id']);
    session_destroy();
}


}
?>

