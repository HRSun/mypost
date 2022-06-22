<?php
class MailboxList
{
  /* Public variables available in mailbox_list.tpl Smarty template */
  
  
  public $mCurrentUserEmail;
  public $mUserEmails;
  
  public $mCreateFolder;
  public $mErrorCreateFolder;
  public $folderNameExist;
  
  //public $mCurrentUserEmailFrom;
  //public $mCurrentUserEmailSubject;
  //public $mCurrentUserEmailTextMessage;

  // Constructor reads query string parameter
  public function __construct()
  {
    /* If MailboxId exists in the query string, we're visiting a
       mailbox */    
  }

  /* Calls business tier method to read departments list and create
     their links */
  public function init()
  {    
    //Read current email
    if(isset($_GET['MessageId']))
    {
        $messageId=$_GET['MessageId'];
        $user_email=$_SESSION['user_email'];
        $this->mCurrentUserEmail= MailFile::MailContentRead($user_email,$messageId);
    }
    
    //Create new mailbox/folder
    if(isset($_POST['create_folder_name']))
    {
        $current_user_email=$_SESSION['user_email'];
        $user_email=$_POST['user_email'];
        if (empty($_POST['create_folder_name']))
            $this->mErrorCreateFolder='Folder name cannot be empty';
        else
            $folder_name=$_POST['create_folder_name'];
        
        $isFolderExist= MailBox::IsFolderExist($current_user_email,$folder_name);
        
        if(!empty($isFolderExist))
        {
            $this->mErrorCreateFolder="Folder '".$folder_name."' exist";
            $this->folderNameExist=$folder_name;
        }
        else
        {
            MailBox::CreateFolder($current_user_email, $user_email, $folder_name);
                $this->mCreateFolder="Folder created";
        }
    }  
  }
}
?>