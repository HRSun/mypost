<?php 
class MailBoxListList
{
    public $mSelectedMailbox = 0;
    public $mMailboxes=array();
    public $mUserEmailsFolder;
    
    public function __construct() 
    {
        if(!isset($_GET['MailboxId']))
            $this->mSelectedMailbox=0;
        
        if (isset ($_GET['MailboxId']) && isset($_GET['PageId']))
        {
        //$i=$_GET['MailboxId'];
        //if($i == '')
        //    $this->mSelectedMailbox = 1;
        //else
            $this->mSelectedMailbox = (int)$_GET['MailboxId'];
      //  $this->mSelectedMailbox = Link::ToMailFolder (0);
        }
    }
    
    public function init()
    {
        // Get the list of mailboxes
        //$this->mMailboxes;
        $this->mMailboxes = MailBox::GetMailbox($_SESSION['user_email']);
        //print_r($this->mMailboxes);
    
    // Create the mailbox links
    for ($i = 0; $i < count($this->mMailboxes); $i++)
    {
      $this->mMailboxes[$i]['link_to_mailbox'] =
         Link::ToMailFolder($this->mMailboxes[$i]['contact_id']);
       //'index.php?MailboxId='.$this->mMailboxes[$i]['mailfolder_id'];
      
       //$this->mUserEmails= MailBox::GetAllMailUser($user_email);
       //print_r("From mailbox_list ");
    }
    
    //echo "<pre>";
    //print_r($this->mMailboxes[0]['contact_id']);
    //echo "</pre>";
    
    //Get mail for current mailbox
    if(isset($this->mSelectedMailbox))
        $this->mUserEmailsFolder=
            MailFile::MailHeaderRead($_SESSION['user_email'], $this->mSelectedMailbox);
    
    //print_r($this->mSelectedMailbox);
    //echo "\n\n<pre>VARDUMP:\n";
    //var_dump($this->mUserEmailsFolder);
    //echo "</pre>\n\n"; 
    }
}
?>

