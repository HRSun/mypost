<?php

class ContactsList {

    public $mContactTemplate;
    public $mContactBrief;
    public $mCurrentContactId;
    public $contactIdInvalid;
    public $mUpdateContactInfo;
    public $mContactEmailError;
    public $mContactFolderError;

    public function __construct() {
        if (!isset($_GET['ContactId']) || empty($_GET['ContactId']))
        {
            $user_email = $_SESSION['user_email'];
            $this->mContactTemplate = 'contact_list_unselected.tpl';
            $this->mContactBrief = MailContacts::GetContactsBrief($user_email);
        }
        elseif(isset($_GET['ContactId']) && !empty($_GET['ContactId']))
        {  
            if(MailContacts::MailContactsCheck($_GET['ContactId'], $_SESSION['user_email']))
                $this->mContactTemplate = 'contact_list_selected.tpl';
            else
            {
                $this->contactIdInvalid="Такого контакта не существует";
                $this->mContactTemplate = 'contact_list_unselected.tpl';
            }            
            $user_email = $_SESSION['user_email'];
            $this->mContactBrief = MailContacts::GetContactsBrief($user_email);
            $this->mCurrentContactId=(int)$_GET['ContactId'];
        }
    }

    public function init() {
        

        //$this->mContactTemplate='contact_list_unselected.tpl';
        $user_email = $_SESSION['user_email'];

        
        //echo "<pre>";
        //print_r($this->mContactBrief);
        //echo "</pre>";

        if (isset($_POST['update_contact'])) {
            //print_r("update contact");

            if (!empty($_GET['ContactId']))
            {
                $contact_id = $_GET['ContactId'];
                $this->mCurrentContactId=(int)$contact_id;
            }
            
            if(!empty($_POST['contact_name']))
            {
                $contact_name=$_POST['contact_name'];
            }
            
            if(!empty($_POST['contact_email']))
            {
                $contact_email=$_POST['contact_email'];
            }
            else
            {
                $this->mContactEmailError='Please enter email address';
            }
            
            if(!empty($_POST['contact_foldername']))
            {
                $contact_foldername=$_POST['contact_foldername'];
            }
            else
            {
                $this->mContactFolderError="Please enter folder name";
            }
            
            if(empty($this->mContactEmailError) || empty($this->mContactFolderError))
            {
                $this->mUpdateContactInfo=MailContacts::MailChangeContactInfo($contact_id, $contact_name, $contact_email, $contact_foldername);
                header('Location:http://mypost.xy/index.php?PageId=2&ContactId='.$contact_id); exit;
                //echo "<script>window.history.pushState('', '', 'http://mypost.xy/index.php?PageId=2');</script>";
            }
            
            
            //echo "<pre>";
            //var_dump($this->mUpdateContactInfo);
            //echo "</pre>";
        }
    }

}
?>

