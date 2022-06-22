<?php 
class MailContacts
{
    public static function GetContactsBrief($current_user_email)
    {
        $sql = 'CALL get_mailbox_folder_contacts(:current_user_email)';
        $params=array(':current_user_email'=>$current_user_email);        
        $result= DatabaseHandler::GetAll($sql, $params);
        
        for ($i=0; $i<count($result); $i++)
        {
            //$contact_id=(int)$key['contact_id'];
            $result[$i]['contact_link']=Link::ToContact($result[$i]['contact_id']);
            //echo "<pre>";
            //print_r($key);
            //echo "</pre>";            
        }             
        
        $keys1= array_keys ($result);
        for($i=0; $i<count($keys1); $i++ )
            $keys1[$i]=$result[$i]['contact_id'];
        
        $keys= array_combine($keys1, $result);
        //echo "<pre>";
        //var_dump($keys);
        //echo "</pre>";            
        return $keys;
    }
    
    public static function MailContactsCheck($contact_id, $user_email)
    {
        $sql='CALL get_account_id_via_email(:user_email)';
        $params=array(':user_email'=>$user_email);
        $result= DatabaseHandler::GetOne($sql, $params);
        
        //echo "<pre>";        
        //print_r($result);
        //echo "</pre>";
        
        $sql='CALL check_contactid_via_accountid(:account_id, :contact_id)';
        $params=array(':account_id'=>$result, ':contact_id'=>$contact_id);
        $result= DatabaseHandler::GetOne($sql, $params);
        
        
        //$account_id=$result[0]['account_id'];
        
        //echo "<pre>";        
        //print_r($account_id);
        //print_r($result);
        //echo "</pre>";

        //return DatabaseHandler::GetAll($sql, $params);
        return $result;
        
    }
    
    public static function MailChangeContactInfo($c_id, $c_name, $c_email, $c_folder)
    {
        if($c_id!==NULL)
        {
            $sql='CALL update_contact_info(:c_id, :c_name, :c_email, :c_folder)';
            $params=array(':c_id'=>$c_id, ':c_name'=>$c_name, 
                ':c_email'=>$c_email, ':c_folder'=>$c_folder);
            
            return DatabaseHandler::Execute($sql, $params);
        }
    }
}
?>

