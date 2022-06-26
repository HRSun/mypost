<?php

class MailFront {

    public $mSiteUrl;
    public $mPageId;
    public $mSelectedPageId = 0;
    
    public $mLoginError;
    public $mEmail='';
    public $mMailUser='';
    public $mLogged=null;
    public $mLoginOrLoggedCell='login.tpl';
    public $mBackground;
    public $mAccountExisted;

    public function __construct() {
        if(empty($_GET))
        $this->mSiteUrl= Link::Build('');
        //print_r($this->mSiteUrl);
        }

    public function init() {
        
        $this->mPageId = MailBox::GetPages();
        
        //var_dump($_GET);

        if (isset($_GET['PageId']))
        {
            //print_r('Page id:'.$_GET['PageId']);
            //$i=$_GET['PageId'];
            if(empty($_GET['PageId']))
            {
                //print_r('empty $GET');
                $this->mSelectedPageId = 1;
                ob_start();
                header('Location:'.Link::ToPage(1));
                ob_end_flush();
                exit();
            }
            elseif(!empty($_GET['PageId']))
            {
                $pageId=$_GET['PageId'];
                
                //$res= MailBox::GetPages();
                //echo "<pre>";
                //print_r($res);
                //print_r($pageId);
                //echo "</pre>";
                
                $flag=0;
                for ($i = 0; $i<count($this->mPageId); $i++)
                {
                    if((int) $this->mPageId[$i]['page_id']==$pageId)
                        $flag=1;//                    
                }
                if($flag===1)
                    $this->mSelectedPageId = (int) $_GET['PageId'];
                else {
                    //echo "<script>window.history.pushState('', '', 'http://mypost.xy/index.php?PageId=1');</script>";                    
                    $this->mSelectedPageId = 1;
                    ob_start();
                    header('Location:'.Link::ToPage(1));
                    ob_end_flush();
                    exit();
                }                    
            }
            else
                $this->mSelectedPageId = (int) $_GET['PageId'];
        }
        else
        {
            $this->mSelectedPageId = 1;
            ob_start();
            header('Location:'.Link::ToPage(1));
            ob_end_flush();
            exit();
        }
        
        //Retrieve from DB info for button Mailbox, Contacts, New Email
        //$this->mPageId = MailBox::GetPages();
        //echo "<pre>";
        //print_r($this->mPageId); 
        //echo "</pre>";
        for ($i = 0; $i < count($this->mPageId); $i++) {
            //var_dump($this->mPageId[$i]);
            $this->mPageId[$i]['link_to_page'] = Link::ToPage($this->mPageId[$i]['page_id']);
            //var_dump($this->mPageId[$i]);
        }
        //echo "<pre>";
        //print_r($this->mPageId); 
        //echo "</pre>";
        //print_r($_SESSION['user_email']);
        if(isset($_POST['Login']))
        {
            //print_r('login!');
            $login_status= MailUser::IsValid($_POST['email'], $_POST['password']);
            
            switch ($login_status)
            {
                case $login_status["ErrorCode"]==2:
                    $this->mLoginError="Unrecognized Email";
                    $this->mEmail=$_POST['email'];
                    MailUser::Logout();
                    break;
                case $login_status["ErrorCode"]==1:
                    $this->mLoginError='Unrecognized password';
                    $this->mEmail=$_POST['email'];
                    MailUser::Logout();
                    break;
                case $login_status["ErrorCode"]==0:
                    //print_r($login_status);
                    $this->mMailUser=$login_status['MailUser'];
                    //ob_start();
                    //header('Location:'.Link::Build('index.php'));
                    //ob_end_flush();
                    //exit();
            }            
            //$_SESSION['auth_id']=1;
        }
        
        if(isset($_POST['Logoff']))
        {
            //print_r('Unlogin!');
            MailUser::Logout();
            ob_start();
            header('Location:'.Link::Build('index.php'));
            ob_end_flush();
            exit();
        }
        
        if(isset($_POST['create_account'])) 
       {
           //print_r("Create account");
           
           $new_account_email=$_POST['new_account_email'];
           $new_account_password=$_POST['new_account_password'];
           $this->mAccountExisted=MailUser::RegisterNewAccount($new_account_email, $new_account_password);
           
           //echo "<pre>";
           //var_dump($this->mAccountExisted);
           //var_dump($new_account_password);
           //echo "</pre>";    
       }
        
        if(isset($_SESSION['auth_id']))
        {            
            $this->mLogged=$_SESSION['auth_id'];
        }
        
        
        //background image/video when logoff
        $image_array=array();
        $path="images/back_logoff/";
        foreach (glob($path."*.{jpg,png,gif,webm}", GLOB_BRACE) as $filename)
                $image_array[]=$filename;        
        
        $max_rand=count($image_array);
        $this->mBackground = (($rand=rand(1, $max_rand))!==$max_rand) ? $image_array[$rand-1] : "webm";
    }

}
?>

