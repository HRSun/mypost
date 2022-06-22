<?php 
class Login
{
    public $mLinkToLogin;
    
    
    public function __construct() {
        //$this->mLinkToLogin=Link::Build(str_replace(VIRTUAL_LOCATION, '', ''));
    }
    
    public function init()
    {
        //print_r('init:');
        if(isset($_POST['Login']))
        {
            //print_r('login!');
            $_SESSION['auth_id']=1;
            header('Location',Link::Build(str_replace(VIRTUAL_LOCATION, '', '')));
            //exit();
        }
        if(isset($_POST['UnLogin']))
        {
            //print_r('Unlogin!');
            $_SESSION['auth_id']=null;
            header('Location',Link::Build(str_replace(VIRTUAL_LOCATION, '', '')));
            session_destroy();
            //exit();
        }
        
        //$redirect=Link::Build(str_replace(VIRTUAL_LOCATION, '', ''));
        
        
        //print_r($redirect);
    }
}
?>

